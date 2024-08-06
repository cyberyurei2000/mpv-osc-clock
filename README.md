# mpv-osc-clock

Displays the system clock as an on-screen clock in mpv.

![Screenshot1](/docs/screenshot1.png)

## How to use?

Toggle it by a keyboard shortcut; by default, it uses `C`.

## Setup

Simply place the file `/scripts/osc.clock.lua` inside the mpv's script directory.

- **Windows**: `%APPDATA%/mpv/scripts`
- **Linux**: `~/.config/mpv/scripts`

## Customization

You can customize any aspect of the clock. To do this, go to the beginning of the script to change the settings.

![Screenshot1](/docs/screenshot2.png)

```lua
local config = {
    font        = "FO-ANN-GMorning2020",
    fontsize    = 60,
    fontcolor   = "FFFFFF",
    bordersize  = 3,
    bordercolor = "000000",
    shadowdist  = 0,
    shadowcolor = "000000",
    blur        = 2,
    positionx   = 70,
    positiony   = 50,
    format      = "%H:%M",
    key         = "C"
}

...
```

- `font`: Set the font name;
- `fontsize`: Set the font size;
- `fontcolor`: Set the font color (format: BBGGRR);
- `bordersize`: Set the border size, set to 0 to disable the border;
- `bordercolor`: Set the border color (format: BBGGRR);
- `shadowdist`: Set the distace of the shadow, set to 0 to disable the shadow;
- `shadowcolor`: Set the shadow color (format: BBGGRR);
- `blur`: Set the strength of the blur to apply in the edges of the text, set to 0 to disable it;
- `positionx`: Set the X position of the clock on screen;
- `positiony`: Set the Y position of the clock on screen;
- `format`: Set the time format;
- `key`: Set the keybinding to toggle the clock;

## Credits

The font **FO-ANN-GMorning2020** and the other fonts found in `/extra/TV-TIMER-FONT-V1.zip` was made by the user @tvoped on Twitter ([Link](https://web.archive.org/web/20220320123906/https://twitter.com/tvoped/status/1466992257962487811)).

You can get the fonts in the [`extra`](/extra) directory or from the original [source](https://www.dropbox.com/scl/fi/3lir00hds4o3xqr6hdwea/TV-TIMER-FONT-V1.zip?rlkey=xgnqhdotec8a9kf25nck7azg7&e=1&dl=0).

## License

This project is licensed under the __BSD 3-Clause License__ - See the [LICENSE](./LICENSE) file for more details.
