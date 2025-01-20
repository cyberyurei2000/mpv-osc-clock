# mpv-osc-clock

Displays the system clock as an on-screen clock in mpv.

![Screenshot1](/docs/screenshot1.png)

## How to use?

Toggle it by a keyboard shortcut; by default, it uses `C`.

## Setup

Simply place the file `/scripts/osc-clock.lua` inside the mpv's script directory.

```
• Windows:    C:\Users\%username%\AppData\Roaming\mpv\scripts\osc-clock.lua
• Linux/BSD:  ~/.config/mpv/scripts/osc-clock.lua
• MacOS:      ~/Library/Application Support/mpv/scripts/osc-clock.lua
```

### Folder Structure ([?](https://mpv.io/manual/master/#files))
```
mpv/
├── fonts/
│   └── FO-TVASAHI-GMorning.otf
├── script-opts/
│   └── osc-clock.conf
└── scripts/
	└── osc-clock.lua
```

## Customization

You can customize any aspect of the clock. To do this, create a `osc-clock.conf` file and place inside the `script-opts` directory in the mpv's configuration directory.

### Examples

Here some examples of possible customizations that can be done:

```ini
font=Globoface 2002
fontsize=80
fontbold=no
fontcolor=FFFFFF
bordersize=1
bordercolor=000000
shadowdist=4
shadowcolor=000000
shadowalpha=60
blur=0
positionx=70
positiony=30
formatsmp=0
```

![Screenshot2](/docs/screenshot2.png)

```ini
font=NanumGothic
fontsize=35
fontbold=yes
bordersize=0
shadowdist=2
blur=0
clockposx=52
clockposy=60
formatsmp=1
date=yes
dateposx=50
dateposy=26
dateformat=%d (%a)
```

![Screenshot3](/docs/screenshot3.png)

### Customization options

| General Options |                                      Description                                            |        Default        |
|-----------------|---------------------------------------------------------------------------------------------|-----------------------|
|  `font`         |  Set the font name.                                                                         | `FO-TVASAHI-GMorning` |
|  `fontsize`     |  Set the font size.                                                                         |       `51`            |
|  `fontbold`     |  Set if the font should be bold or not                                                      |       `no`            |
|  `fontcolor`    |  Set the font color (format: BBGGRR).                                                       |       `FFFFFF`        |
|  `fontalpha`    |  Set the font transparency                                                                  |       `0`             |
|  `bordersize`   |  Set the border size, set to `0` to disable the border.                                     |       `4`             |
|  `bordercolor`  |  Set the border color (format: BBGGRR).                                                     |       `000000`        |
|  `shadowdist`   |  Set the distace of the shadow, set to `0` to disable the shadow.                           |       `0`             |
|  `shadowcolor`  |  Set the shadow color (format: BBGGRR).                                                     |       `000000`        |
|  `shadowalpha`  |  Set the shadow transparency                                                                |       `0`             |
|  `blur`         |  Set the strength of the blur to apply in the edges of the text, set to `0` to disable it.  |       `1`             |
|  `key`          |  Set the keybinding to toggle the clock.                                                    |       `C`             |
|  `onbydefault`  |  Set if the clock is gonna be enabled by default.                                           |       `no`            |

|  Clock Options  |                                      Description                                            |        Default        |
|-----------------|---------------------------------------------------------------------------------------------|-----------------------|
|  `clockposx`    |  Set the X position of the clock on screen.                                                 |         `32`          |
|  `clockposy`    |  Set the Y position of the clock on screen.                                                 |         `28`          |
|  `format`       |  Set the time format ([?](https://www.lua.org/pil/22.1.html)) (will be ignored if `formatsmp` is enabled). |        `%H:%M`        |
|  `formatsmp`    |  Set if the clock should be in a simplified 12h format , set to `0` to disable it (available options: `1` and `2`). |        `2`            |

|  Date Options   |                                      Description                                            |        Default        |
|-----------------|---------------------------------------------------------------------------------------------|-----------------------|
|  `date`         |  Set if the date should appear                                                              |         `no`          |
|  `dateposx`     |  Set the X position of the date on screen                                                   |         `52`          |
|  `dateposy`     |  Set the Y position of the date on screen                                                   |         `58`          |
|  `dateformat`   |  Set the date format ([?](https://www.lua.org/pil/22.1.html))                               |       `%Y/%m/%d`      |

## Credits

The font **FO-TVASAHI-GMorning** and the other fonts found in `/extra/TV-TIMER-FONT-V1.zip` was made by the user [@tvoped](https://web.archive.org/web/20220320123906/https://twitter.com/tvoped/status/1466992257962487811) on Twitter.

You can get the fonts in the [`extra`](/extra) directory or from the original [source](https://www.dropbox.com/scl/fi/3lir00hds4o3xqr6hdwea/TV-TIMER-FONT-V1.zip?rlkey=xgnqhdotec8a9kf25nck7azg7&e=1&dl=0).

## License

This project is licensed under the __BSD 3-Clause License__ - See the [LICENSE](./LICENSE) file for more details.
