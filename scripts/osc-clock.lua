-- Copyright (c) cyberyurei2000 2024-2025
-- Released under the BSD 3-Clause License
-- https://opensource.org/license/bsd-3-clause

-- parameters: default user option values
-- change them using osc-clock.conf in the script-opts directory
-- for more info, check the README.txt or CUSTOMIZATION.md on the online repository
local user_opts = {
    -- Clock
    clock_font        = "FO-TVASAHI-GMorning",  -- Set clock font
    clock_fontsize    = 48,                     -- Set clock font size
    clock_fontbold    = false,                  -- Set clock font bold
    clock_fontitalic  = false,                  -- Set clock font italic
    clock_fontcolor   = "FFFFFF",               -- Set clock font color (format: RRGGBB)
    clock_fontalpha   = 0,                      -- Set clock font transparency
    clock_bordersize  = 4,                      -- Set clock border size, set 0 to disable the border
    clock_bordercolor = "000000",               -- Set clock border color (format: RRGGBB)
    clock_borderalpha = 0,                      -- Set clock border transparency
    clock_shadowdist  = 0,                      -- Set clock shadow distance, set 0 to disable the shadow
    clock_shadowcolor = "000000",               -- Set clock shadow color (format: RRGGBB)
    clock_shadowalpha = 0,                      -- Set clock shadow transparency
    clock_textspacing = 4,                      -- Set clock spacing between individual characters
    clock_edgeblur    = 1,                      -- Set clock text edge blur, set 0 to disable
    clock_posx        = 32,                     -- Set clock X position on screen
    clock_posy        = 28,                     -- Set clock Y position on screen
    clock_format      = "%H:%M",                -- Set time format (learn more at https://www.lua.org/pil/22.1.html) (will be ignored if formatsmp is set)
    clock_formatsmp   = 2,                      -- Toggle between a simplified 12h format
    -- Date
    date_enable       = false,                  -- Toggle date
    date_posx         = 82,                     -- Set X position of the date on screen
    date_posy         = 88,                     -- Set Y position of the date on screen
    date_format       = "%Y/%m/%d",             -- Set date format (learn more at https://www.lua.org/pil/22.1.html)
    date_useclockopt  = false,                  -- Use the same config. as the clock (all date options bellow will be ignored if enabled)
    date_font         = "",                     -- Set date font
    date_fontsize     = 30,                     -- Set date font size
    date_fontbold     = true,                   -- Set date font bold
    date_fontitalic   = false,                  -- Set date font italic
    date_fontcolor    = "FFFFFF",               -- Set date font color (format: RRGGBB)
    date_fontalpha    = 0,                      -- Set date font transparency
    date_bordersize   = 1,                      -- Set date border size, set 0 to disable the border
    date_bordercolor  = "000000",               -- Set date border color (format: RRGGBB)
    date_borderalpha  = 0,                      -- Set date border transparency
    date_shadowdist   = 0,                      -- Set date shadow distance, set 0 to disable the shadow
    date_shadowcolor  = "000000",               -- Set date shadow color (format: RRGGBB)
    date_shadowalpha  = 0,                      -- Set date shadow transparency
    date_textspacing  = 4,                      -- Set date spacing between individual characters
    date_edgeblur     = 1,                      -- Set date text edge blur, set 0 to disable
    -- General
    tempkey           = "c",                    -- Set key to toggle the clock for a brief time
    permakey          = "C",                    -- Set key to toggle the clock permanently
    duration          = 5,                      -- Set how many seconds the clock should be displayed before auto-hiding
    onbydefault       = "no",                   -- Set if the clock should be toggled automatically by default
}

(require "mp.options").read_options(user_opts, "osc-clock")
local osc_clock = mp.create_osd_overlay("ass-events")
local osc_date = mp.create_osd_overlay("ass-events")
local timer = nil
local hide_timer = nil
local is_shown = false
local is_permanent = false

local clock_pos = string.format("{\\pos(%d,%d)}", user_opts.clock_posx, user_opts.clock_posy)
local date_pos = string.format("{\\pos(%d, %d)}", user_opts.date_posx, user_opts.date_posy)

local function format_color(color, prefix)
    return string.format("{\\%sc&H%s&}", prefix, string.reverse(color))
end

local function set_clock_style()
    local clock_bold = user_opts.clock_fontbold and 1 or 0
    local clock_italic = user_opts.clock_fontitalic and 1 or 0

    return string.format(
        "%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
        string.format("{\\fn%s}", user_opts.clock_font),
        string.format("{\\fs%d}", user_opts.clock_fontsize),
        string.format("{\\b%d}", clock_bold),
        string.format("{\\i%d}", clock_italic),
        format_color(user_opts.clock_fontcolor, "1"),
        string.format("{\\alpha&H%d}", user_opts.clock_fontalpha),
        string.format("{\\bord%d}", user_opts.clock_bordersize),
        format_color(user_opts.clock_bordercolor, "3"),
        string.format("{\\3a&H%d}", user_opts.clock_borderalpha),
        string.format("{\\shad%d}", user_opts.clock_shadowdist),
        format_color(user_opts.clock_shadowcolor, "4"),
        string.format("{\\4a&H%d}", user_opts.clock_shadowalpha),
        string.format("{\\fsp%d}", user_opts.clock_textspacing),
        string.format("{\\blur%d}", user_opts.clock_edgeblur)
    )
end

local function set_date_style()
    local date_bold = user_opts.date_fontbold and 1 or 0
    local date_italic = user_opts.date_fontitalic and 1 or 0

    return string.format(
        "%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
        string.format("{\\fn%s}", user_opts.date_font),
        string.format("{\\fs%d}", user_opts.date_fontsize),
        string.format("{\\b%d}", date_bold),
        string.format("{\\i%d}", date_italic),
        format_color(user_opts.date_fontcolor, "1"),
        string.format("{\\alpha&H%d}", user_opts.date_fontalpha),
        string.format("{\\bord%d}", user_opts.date_bordersize),
        format_color(user_opts.date_bordercolor, "3"),
        string.format("{\\3a&H%d}", user_opts.date_borderalpha),
        string.format("{\\shad%d}", user_opts.date_shadowdist),
        format_color(user_opts.date_shadowcolor, "4"),
        string.format("{\\4a&H%d}", user_opts.date_shadowalpha),
        string.format("{\\fsp%d}", user_opts.date_textspacing),
        string.format("{\\blur%d}", user_opts.date_edgeblur)
    )
end

local function clock()
    local systime = nil
    local time = nil
    local date = os.date(user_opts.date_format)
    local clock_data = set_clock_style()
    local date_data = nil

    if user_opts.date_useclockopt then
        date_data = clock_data
    else
        date_data = set_date_style()
    end

    if user_opts.clock_formatsmp > 0 then
        systime = os.date("%I:%M")
        if systime:match("^12") then
            if user_opts.clock_formatsmp == 2 then
                time = systime:gsub("^(..)", "　0")
            else
                time = systime:gsub("^(..)", "0")
            end
        elseif systime:match("^0") then
            if user_opts.clock_formatsmp == 2 then
                time = systime:gsub("^(0)", "　")
            else
                time = systime:gsub("^(0)", "")
            end
        else
            time = systime
        end
    else
        time = os.date(user_opts.clock_format)
    end
    osc_clock.data = string.format("{\\an7}%s%s%s", clock_data, clock_pos, time)
    osc_clock:update()

    if user_opts.date_enable then
        osc_date.data = string.format("{\\an7}%s%s%s", date_data, date_pos, date)
        osc_date:update()
    end
end

local function hide_clock()
    osc_clock:remove()
    if osc_date then
        osc_date:remove()
    end

    if timer then
        timer:stop()
    end
    if hide_timer then
        hide_timer:kill()
        hide_timer = nil
    end
    is_shown = false
end

local function show_clock_temp()
    if not is_permanent then
        if is_shown and not is_permanent then
            if hide_timer then
                hide_timer:kill()
            end
            hide_timer = mp.add_timeout(user_opts.duration, hide_clock)
            return
        end

        clock()
        timer = mp.add_periodic_timer(1, clock)
        is_shown = true
        hide_timer = mp.add_timeout(user_opts.duration, hide_clock)
    end
end

local function toggle_clock_permanent()
    if not hide_timer then
        if is_shown and is_permanent then
            osc_clock:remove()
            if osc_date then
                osc_date:remove()
            end

            if timer then
                timer:stop()
            end
            is_shown = false
            is_permanent = false
        else
            clock()

            timer = mp.add_periodic_timer(1, clock)
            is_shown = true
            is_permanent = true
        end
    end
end

if user_opts.onbydefault == "yes" then
    toggle_clock_permanent()
elseif user_opts.onbydefault == "fsonly" then
    mp.observe_property("fullscreen", "bool", function(name, is_fullscreen)
        if is_fullscreen then
            toggle_clock_permanent()
        else
            hide_clock()
        end
    end)
end

mp.add_key_binding(user_opts.tempkey, "show_clock_temp", show_clock_temp)
mp.add_key_binding(user_opts.permakey, "toggle_clock_permanent", toggle_clock_permanent)
mp.msg.verbose("Key bindings: \"%s\" for temporary clock, \"%s\" for permanent toggle", user_opts.tempkey, user_opts.permakey)
