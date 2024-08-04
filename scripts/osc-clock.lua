-- Copyright (c) cyberyurei2000 2024
-- Released under the BSD 3-Clause License
-- https://opensource.org/license/bsd-3-clause

local config = {
    font        = "FO-ANN-GMorning2020",  -- Set the font name
    fontsize    = 60,                     -- Set the font size
    fontcolor   = "FFFFFF",               -- Set the font color (format: BBGGRR)
    bordersize  = 3,                      -- Set the border size, set to 0 to disable the border
    bordercolor = "000000",               -- Set the border color (format: BBGGRR)
    shadowdist  = 0,                      -- Set the distace of the shadow, set to 0 to disable the shadow
    shadowcolor = "000000",               -- Set the shadow color (format: BBGGRR)
    blur        = 2,                      -- Set the strength of the blur to apply in the edges of the text, set to 0 to disable it
    positionx   = 70,                     -- Set the X position of the clock on screen
    positiony   = 50,                     -- Set the Y position of the clock on screen
    format      = "%H:%M",                -- Set the time format
    key         = "C"                     -- Set the key to toggle the clock
}

local osc_clock = mp.create_osd_overlay("ass-events")
local timer = nil
local is_shown = false

local font = string.format("{\\fn%s}", config.font)
local fontsize = string.format("{\\fs%d}", config.fontsize)
local fontcolor = string.format("{\\1c%s}", config.fontcolor)
local bordersize = string.format("{\\bord%d}", config.bordersize)
local bordercolor = string.format("{\\3c%s}", config.bordercolor)
local shadowdist = string.format("{\\shad%d}", config.shadowdist)
local shadowcolor = string.format("{\\4c&H%d&}", config.shadowcolor)
local blur = string.format("{\\blur2}", config.blur)
local position = string.format("{\\pos(%d,%d)}", config.positionx, config.positiony)

local data = string.format(
    "%s%s%s%s%s%s%s%s%s",
    font, fontsize, fontcolor,
    bordersize, bordercolor,
    shadowdist, shadowcolor,
    blur, position
)

local function clock()
    local time = os.date(config.format)

    osc_clock.data = string.format("{\\an7}{\\b1}{\\blur2}%s%s", data, time)
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

mp.add_key_binding(config.key, "show-clock", clock_toggle)
mp.msg.verbose(string.format("key: \"%s\" bound to \"show-clock\"", config.key))
