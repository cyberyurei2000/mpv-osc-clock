-- Copyright (c) cyberyurei2000 2024-2026
-- Released under the BSD 3-Clause License
-- https://opensource.org/license/bsd-3-clause

local opt = require "mp.options"

-- parameters: default user option values
-- change them using osc-clock.conf in the script-opts directory
-- for more info, check the README.txt or CUSTOMIZATION.md in the online repository
local user_opts = {
    -- Clock options
    clock_font        = "default",              -- Set clock font
    clock_fontsize    = 48,                     -- Set clock font size
    clock_fontbold    = true,                   -- Set clock font bold
    clock_fontitalic  = false,                  -- Set clock font italic
    clock_fontcolor   = "FFFFFF",               -- Set clock font color (format: RRGGBB)
    clock_fontalpha   = 0,                      -- Set clock font transparency
    clock_bordersize  = 2,                      -- Set clock border size, set 0 to disable the border
    clock_bordercolor = "000000",               -- Set clock border color (format: RRGGBB)
    clock_borderalpha = 0,                      -- Set clock border transparency
    clock_shadowdist  = 0,                      -- Set clock shadow distance, set 0 to disable the shadow
    clock_shadowcolor = "000000",               -- Set clock shadow color (format: RRGGBB)
    clock_shadowalpha = 0,                      -- Set clock shadow transparency
    clock_textspacing = 4,                      -- Set spacing between individual characters
    clock_edgeblur    = 1,                      -- Set clock text edge blur, set 0 to disable
    clock_posx        = 32,                     -- Set clock X position on screen
    clock_posy        = 28,                     -- Set clock Y position on screen
    clock_format      = "24",                   -- Set clock time format, will be ignored if clock_advformat is not empty
    clock_advformat   = "",                     -- Set clock time format using Lua's time notations (learn more at https://www.lua.org/pil/22.1.html)
    -- Date options
    date_enable       = false,                  -- Toggle date
    date_posx         = 68,                     -- Set date X position of the date on screen
    date_posy         = 72,                     -- Set date Y position of the date on screen
    date_format       = "smp2",                 -- Set date format, will be ignored if date_advformat is not empty
    date_advformat    = "",                     -- Set date format using Lua's date notations (learn more at https://www.lua.org/pil/22.1.html)
    date_useclockopt  = false,                  -- Use the same config. as the clock for the date (all date options bellow will be ignored if enabled)
    date_font         = "default",              -- Set date font
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
    date_textspacing  = 4,                      -- Set spacing between individual characters
    date_edgeblur     = 1,                      -- Set date text edge blur, set 0 to disable
    -- General options
    duration          = 5,                      -- Set how many seconds the clock should be displayed before auto-hiding
    showosdmsg        = true,                   -- Toggle OSD messages
    fade              = 80,                     -- Turn the clock transparent with a keybind, set 0 to disable
    locale            = "",                     -- Set your prefered locale, by default it uses Lua's default (English)
    autoenable        = "no",                   -- Set if the clock should be toggled automatically by default
    autoenable_langs  = "jpn, jp, kor, ko",     -- List languages for the clock to auto enable it
    -- Keybinds
    tempkey           = "c",                    -- Set keybind to toggle the clock for a brief time
    permakey          = "C",                    -- Set keybind to toggle the clock permanently
    fadekey           = ";",                    -- Set keybind to make the clock translucid
}
opt.read_options(user_opts, "osc-clock")

local osc_clock = mp.create_osd_overlay("ass-events")
local osc_date = mp.create_osd_overlay("ass-events")
local timer = nil
local hide_timer = nil
local is_shown = false
local is_permanent = false
local is_fade = false
local show_msg = user_opts.showosdmsg

local current_alpha = {
    clockfont = user_opts.clock_fontalpha,
    clockborder = user_opts.clock_borderalpha,
    clockshadow = user_opts.clock_shadowalpha,
    datefont = user_opts.date_fontalpha,
    dateborder = user_opts.date_borderalpha,
    dateshadow = user_opts.date_shadowalpha
}
local clock_pos = string.format("{\\pos(%d,%d)}", user_opts.clock_posx, user_opts.clock_posy)
local date_pos = string.format("{\\pos(%d, %d)}", user_opts.date_posx, user_opts.date_posy)

if user_opts.locale ~= "" then
    os.setlocale(user_opts.locale)
end

local function format_color(color, prefix)
    return string.format("{\\%sc&H%s&}", prefix, string.reverse(color))
end

local function set_clock_style()
    local clock_font = nil
    local clock_bold = user_opts.clock_fontbold and 1 or 0
    local clock_italic = user_opts.clock_fontitalic and 1 or 0

    if user_opts.clockfont == "default" then
        clock_font = mp.get_property("options/font")
    else
        clock_font = user_opts.clock_font
    end

    return string.format(
        "%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
        string.format("{\\fn%s}", clock_font),
        string.format("{\\fs%d}", user_opts.clock_fontsize),
        string.format("{\\b%d}", clock_bold),
        string.format("{\\i%d}", clock_italic),
        format_color(user_opts.clock_fontcolor, "1"),
        string.format("{\\alpha&H%X&}", current_alpha.clockfont),
        string.format("{\\bord%d}", user_opts.clock_bordersize),
        format_color(user_opts.clock_bordercolor, "3"),
        string.format("{\\3a&H%X&}", current_alpha.clockborder),
        string.format("{\\shad%d}", user_opts.clock_shadowdist),
        format_color(user_opts.clock_shadowcolor, "4"),
        string.format("{\\4a&H%X&}", current_alpha.clockshadow),
        string.format("{\\fsp%d}", user_opts.clock_textspacing),
        string.format("{\\blur%d}", user_opts.clock_edgeblur)
    )
end

local function set_date_style()
    local date_font = nil
    local date_bold = user_opts.date_fontbold and 1 or 0
    local date_italic = user_opts.date_fontitalic and 1 or 0

    if user_opts.datefont == "default" then
        date_font = mp.get_property("options/font")
    else
        date_font = user_opts.date_font
    end

    return string.format(
        "%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
        string.format("{\\fn%s}", date_font),
        string.format("{\\fs%d}", user_opts.date_fontsize),
        string.format("{\\b%d}", date_bold),
        string.format("{\\i%d}", date_italic),
        format_color(user_opts.date_fontcolor, "1"),
        string.format("{\\alpha%d}", current_alpha.datefont),
        string.format("{\\bord%d}", user_opts.date_bordersize),
        format_color(user_opts.date_bordercolor, "3"),
        string.format("{\\3a%d}", current_alpha.dateborder),
        string.format("{\\shad%d}", user_opts.date_shadowdist),
        format_color(user_opts.date_shadowcolor, "4"),
        string.format("{\\4a%d}", current_alpha.dateshadow),
        string.format("{\\fsp%d}", user_opts.date_textspacing),
        string.format("{\\blur%d}", user_opts.date_edgeblur)
    )
end

local function set_clock_format()
    local time = nil
    local systime = os.date("%I:%M")

    if user_opts.clock_advformat == "" then
        if user_opts.clock_format == "24" then
            time = os.date("%H:%M")
        elseif user_opts.clock_format == "12" then
            time = os.date("%I:%M")
        elseif user_opts.clock_format == "24s" then
            time = os.date("%H:%M:%S")
        elseif user_opts.clock_format == "12s" then
            time = os.date("%I:%M:%S")
        elseif user_opts.clock_format == "12m" then
            time = os.date("%I:%M%p")
        elseif user_opts.clock_format == "full" then
            time = os.date("%X")
        elseif user_opts.clock_format == "12j" then
            if systime:match("^12") then
                time = systime:gsub("^(..)", "0")
            elseif systime:match("^0") then
                time = systime:gsub("^(0)", "")
            end
        elseif user_opts.clock_format == "12jb" then
            if systime:match("^12") then
                time = systime:gsub("^(..)", "　0")
            elseif systime:match("^0") then
                time = systime:gsub("^(0)", "　")
            end
        end
    else
        time = os.date(user_opts.clock_advformat)
    end

    return time
end

local function set_date_format()
    local date = nil

    if user_opts.date_advformat == "" then
        if user_opts.date_format == "dmy" then
            date = os.date("%d/%m/%Y")
        elseif user_opts.date_format == "iso" then
            date = os.date("%Y/%m/%d")
        elseif user_opts.date_format == "usa" then
            date = os.date("%m/%d/%Y")
        elseif user_opts.date_format == "smp1" then
            date = os.date("%d/%m")
        elseif user_opts.date_format == "smp2" then
            date = os.date("%m/%d")
        elseif user_opts.date_format == "full" then
            date = os.date("%x")
        end
    else
        date = os.date(user_opts.date_advformat)
    end

    return date
end

local function clock()
    local clock_data = set_clock_style()
    local clock_format = set_clock_format()
    local date_data = nil
    local date_format = set_date_format()

    osc_clock.data = string.format("{\\an7}%s%s%s", clock_data, clock_pos, clock_format)
    osc_clock:update()

    if user_opts.date_enable then
        if user_opts.date_useclockopt then
            date_data = clock_data
        else
            date_data = set_date_style()
        end

        osc_date.data = string.format("{\\an7}%s%s%s", date_data, date_pos, date_format)
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

local function show_clock_permanent()
    toggle_clock_permanent()

    if show_msg then
        if is_permanent then
            mp.osd_message("Clock enabled")
        else
            mp.osd_message("Clock disabled")
        end
    end
end

local function check_audiolang()
    local track_list = mp.get_property_native("track-list")
    local lang_list = {}

    for lang in string.gmatch(user_opts.autoenable_langs, "([^,]+)") do
        lang_list[string.lower(lang:gsub("%s+", ""))] = true
    end

    for _, track in ipairs(track_list) do
        if track.type == "audio" and track.lang then
            local track_lang = string.lower(track.lang:gsub("%s+", ""))
            if lang_list[track_lang] then
                return true
            end
        end
    end

    return false
end

local function show_clock_bylang()
    if check_audiolang() then
        if not is_shown then
            toggle_clock_permanent()
        end
    end
end

local function update_alpha()
    if is_shown then
        if not is_fade then
            for key, value in pairs(current_alpha) do
                current_alpha[key] = value + user_opts.fade
            end

            is_fade = true
            if show_msg then
                mp.osd_message("Clock fade on")
            end
        else
            for key, value in pairs(current_alpha) do
                current_alpha[key] = value - user_opts.fade
            end

            is_fade = false
            if show_msg then
                mp.osd_message("Clock fade off")
            end
        end

        clock()
    end
end

if user_opts.autoenable == "yes" then
    toggle_clock_permanent()
elseif user_opts.autoenable == "fsonly" then
    mp.observe_property("fullscreen", "bool", function(name, is_fullscreen)
        if is_fullscreen then
            toggle_clock_permanent()

            if show_msg then
                mp.osd_message("Clock automatically enabled (fullscreen)")
            end
        else
            hide_clock()
        end
    end)
elseif user_opts.autoenable == "bylang" then
    mp.register_event("file-loaded", function()
        mp.add_timeout(0.1, show_clock_bylang)
    end)

    if show_msg then
        mp.osd_message("Clock automatically enabled (language)")
    end
end

mp.add_key_binding(user_opts.tempkey, "show_clock_temp", show_clock_temp)
mp.add_key_binding(user_opts.permakey, "show_clock_permanent", show_clock_permanent)
if user_opts.fade > 0 then
    mp.add_key_binding(user_opts.fadekey, "update_alpha", update_alpha)
end
mp.msg.verbose(
    "Key bindings: \"%s\" for temporary clock, \"%s\" for permanent toggle, \"%s\" for fading the clock",
    user_opts.tempkey, user_opts.permakey, user_opts.fadekey
)
