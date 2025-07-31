-- Copyright (c) cyberyurei2000 2024-2025
-- Released under the BSD 3-Clause License
-- https://opensource.org/license/bsd-3-clause

-- parameters: default user option values
-- change them using osc-clock.conf in the script-opts directory
local user_opts = {
    -- General
    font        = "FO-TVASAHI-GMorning",  -- Set font
    fontsize    = 48,                     -- Set font size
    fontbold    = false,                  -- Set font bold
    fontcolor   = "FFFFFF",               -- Set font color (format: RRGGBB)
    fontalpha   = 0,                      -- Set font transparency
    bordersize  = 4,                      -- Set border size, set 0 to disable the border
    bordercolor = "000000",               -- Set border color (format: RRGGBB)
    borderalpha = 0,                      -- Set border transparency
    shadowdist  = 0,                      -- Set shadow distance, set 0 to disable the shadow
    shadowcolor = "000000",               -- Set shadow color (format: RRGGBB)
    shadowalpha = 0,                      -- Set shadow transparency
    textspacing = 4,                      -- Set spacing between individual characters
    edgeblur    = 1,                      -- Set text edge blur, set 0 to disable
    tempkey     = "c",                    -- Set key to toggle the clock for a brief time
    permakey    = "C",                    -- Set key to toggle the clock permanently
    duration    = 5,                      -- Set how many seconds the clock should be displayed before auto-hiding
    onbydefault = false,                  -- Set if the clock should be toggled automatically by default
    -- Clock
    clockposx   = 32,                     -- Set clock X position on screen
    clockposy   = 28,                     -- Set clock Y position on screen
    format      = "%H:%M",                -- Set time format (learn more at https://www.lua.org/pil/22.1.html) (will be ignored if formatsmp is set)
    formatsmp   = 2,                      -- Toggle between a simplified 12h format (2 or 1), set 0 to disable
    -- Date
    date        = false,                  -- Toggle date
    dateposx    = 52,                     -- Set X position of the date on screen
    dateposy    = 58,                     -- Set Y position of the date on screen
    dateformat  = "%Y/%m/%d",             -- Set date format (learn more at https://www.lua.org/pil/22.1.html)
}

(require "mp.options").read_options(user_opts, "osc-clock")
local osc_clock = mp.create_osd_overlay("ass-events")
local osc_date = mp.create_osd_overlay("ass-events")
local timer = nil
local hide_timer = nil
local is_shown = false
local is_permanent = false

local font = string.format("{\\fn%s}", user_opts.font)
local fontsize = string.format("{\\fs%d}", user_opts.fontsize)
local fontcolor = string.format("{\\1c&H%s&}", string.reverse(user_opts.fontcolor))
local fontalpha = string.format("{\\alpha&H%d}", user_opts.fontalpha)
local bordersize = string.format("{\\bord%d}", user_opts.bordersize)
local bordercolor = string.format("{\\3c&H%s&}", string.reverse(user_opts.bordercolor))
local borderalpha = string.format("{\\3a&H%d}", user_opts.borderalpha)
local shadowdist = string.format("{\\shad%d}", user_opts.shadowdist)
local shadowcolor = string.format("{\\4c&H%s&}", string.reverse(user_opts.shadowcolor))
local shadowalpha = string.format("{\\4a&H%d}", user_opts.shadowalpha)
local textspacing = string.format("{\\fsp%d}", user_opts.textspacing)
local edgeblur = string.format("{\\blur%d}", user_opts.edgeblur)
local clockpos = string.format("{\\pos(%d,%d)}", user_opts.clockposx, user_opts.clockposy)
local datepos = string.format("{\\pos(%d, %d)}", user_opts.dateposx, user_opts.dateposy)

local fontbold;
if user_opts.fontbold then
    fontbold = "{\\b1}"
else
    fontbold = "{\\b0}"
end

local data = string.format(
    "%s%s%s%s%s%s%s%s%s%s%s%s%s",
    font, fontsize, fontbold, fontcolor, fontalpha,
    bordersize, bordercolor, borderalpha,
    shadowdist, shadowcolor, shadowalpha,
    textspacing, edgeblur
)

local function clock()
    local systime = nil
    local time = nil
    local date = os.date(user_opts.dateformat)

    if user_opts.formatsmp > 0 then
        systime = os.date("%I:%M")
        if systime:match("^12") then
            if user_opts.formatsmp == 2 then
                time = systime:gsub("^(..)", "　0")
            else
                time = systime:gsub("^(..)", "0")
            end
        elseif systime:match("^0") then
            if user_opts.formatsmp == 2 then
                time = systime:gsub("^(0)", "　")
            else
                time = systime:gsub("^(0)", "")
            end
        else
            time = systime
        end
    else
        time = os.date(user_opts.format)
    end
    osc_clock.data = string.format("{\\an7}%s%s%s", data, clockpos, time)
    osc_clock:update()

    if user_opts.date then
        osc_date.data = string.format("{\\an7}%s%s%s", data, datepos, date)
        osc_date:update()
    end

    for i=1, 4 do
        collectgarbage()
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

if user_opts.onbydefault then
    clock_toggle_permanent()
end

mp.add_key_binding(user_opts.tempkey, "show-clock-temporary", show_clock_temp)
mp.add_key_binding(user_opts.permakey, "toggle-clock-permanent", toggle_clock_permanent)
mp.msg.verbose("Key bindings: \"%s\" for temporary clock, \"%s\" for permanent toggle", user_opts.tempkey, user_opts.permakey)
