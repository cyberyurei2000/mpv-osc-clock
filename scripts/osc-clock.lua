-- Copyright (c) cyberyurei2000 2024
-- Released under the BSD 3-Clause License
-- https://opensource.org/license/bsd-3-clause

-- parameters: default user option values
-- change them using osc-clock.conf in the script-opts directory
local user_opts = {
    font        = "FO-ANN-GMorning2020",  -- Set the font name
    fontsize    = 60,                     -- Set the font size
    fontbold    = false,                  -- Set if the font should be bold or not
    fontcolor   = "FFFFFF",               -- Set the font color (format: BBGGRR)
    bordersize  = 3,                      -- Set the border size, set to 0 to disable the border
    bordercolor = "000000",               -- Set the border color (format: BBGGRR)
    shadowdist  = 0,                      -- Set the distace of the shadow, set to 0 to disable the shadow
    shadowcolor = "000000",               -- Set the shadow color (format: BBGGRR)
    blur        = 2,                      -- Set the strength of the blur to apply in the edges of the text, set to 0 to disable it
    positionx   = 70,                     -- Set the X position of the clock on screen
    positiony   = 50,                     -- Set the Y position of the clock on
    format      = "%H:%M",                -- Set the time format (learn more at https://www.lua.org/pil/22.1.html) (this will be ignored when format12 is enabled)
    jtvformat   = false,                  -- Set if the clock should be in a simplified 12h format
    key         = "C",                    -- Set the key to toggle the clock
    onbydefault = false                   -- Set if the clock is gonna be enabled by default
}

(require 'mp.options').read_options(user_opts, "osc-clock")
local osc_clock = mp.create_osd_overlay("ass-events")
local timer = nil
local is_shown = false

local font = string.format("{\\fn%s}", user_opts.font)
local fontsize = string.format("{\\fs%d}", user_opts.fontsize)
local fontcolor = string.format("{\\1c%s}", user_opts.fontcolor)
local bordersize = string.format("{\\bord%d}", user_opts.bordersize)
local bordercolor = string.format("{\\3c%s}", user_opts.bordercolor)
local shadowdist = string.format("{\\shad%d}", user_opts.shadowdist)
local shadowcolor = string.format("{\\4c&H%d&}", user_opts.shadowcolor)
local blur = string.format("{\\blur%d}", user_opts.blur)
local position = string.format("{\\pos(%d,%d)}", user_opts.positionx, user_opts.positiony)

local fontbold;
if user_opts.fontbold then
    fontbold = "{\\b1}"
else
    fontbold = "{\\b0}"
end

local data = string.format(
    "%s%s%s%s%s%s%s%s%s%s",
    font, fontsize, fontbold, fontcolor,
    bordersize, bordercolor,
    shadowdist, shadowcolor,
    blur, position
)

local function clock()
    local systime
    local time

    if user_opts.jtvformat then
        systime = os.date("%I:%M")
        if systime:match("^12") then
            time = systime:gsub("^(..)", "　0")
        elseif systime:match("^0") then
            time = systime:gsub("^(0)", "　")
        else
            time = systime
        end
    else
        systime = os.date(user_opts.format)
        systime = time
    end

    osc_clock.data = string.format("{\\an7}%s%s", data, time)
    osc_clock:update()

    collectgarbage()
    collectgarbage()
end

local function clock_toggle()
    if is_shown then
        osc_clock:remove()
        timer:stop()
        is_shown = false
    else
        clock()
        timer = mp.add_periodic_timer(1, clock)
        is_shown = true
    end
end

if user_opts.onbydefault then
    clock_toggle()
end

mp.add_key_binding(user_opts.key, "show-clock", clock_toggle)
mp.msg.verbose(string.format("key: \"%s\" bound to \"show-clock\"", user_opts.key))
