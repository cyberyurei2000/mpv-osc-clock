# Clock Customization

Create a `osc-clock.conf` file inside the mpv `script-opts` directory.

```
• Windows:    C:\Users\%username%\AppData\Roaming\mpv\script-opts\osc-clock.conf
• Linux/BSD:  ~/.config/mpv/script-opts/osc-clock.conf
• MacOS:      ~/Library/Application Support/mpv/script-opts/osc-clock.conf
```

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

![Screenshot2](/docs/assets/screenshot2.png)

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

![Screenshot3](/docs/assets/screenshot3.png)

## Customization options

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
|  `tempkey`      |  Set the key to toggle the clock for a brief time.                                          |       `c`             |
|  `permakey`     |  Set the key to toggle the clock permanently.                                               |       `C`             |
|  `duration`     |  Set how many seconds the clock should be displayed before auto-hiding.                     |       `5`             |
|  `onbydefault`  |  Set if the clock should be toggled automatically by default.                               |       `no`            |

|  Clock Options  |                                      Description                                            |        Default        |
|-----------------|---------------------------------------------------------------------------------------------|-----------------------|
|  `clockposx`    |  Set the X position of the clock on screen.                                                 |         `32`          |
|  `clockposy`    |  Set the Y position of the clock on screen.                                                 |         `28`          |
|  `format`       |  Set the time format ([?](https://www.lua.org/pil/22.1.html)) (will be ignored if `formatsmp` is enabled). |        `%H:%M`        |
|  `formatsmp`    |  Set if the clock should be in a simplified 12h format, set to `0` to disable it (available options: `1` and `2`). |        `2`            |

|  Date Options   |                                      Description                                            |        Default        |
|-----------------|---------------------------------------------------------------------------------------------|-----------------------|
|  `date`         |  Set if the date should appear                                                              |         `no`          |
|  `dateposx`     |  Set the X position of the date on screen                                                   |         `52`          |
|  `dateposy`     |  Set the Y position of the date on screen                                                   |         `58`          |
|  `dateformat`   |  Set the date format ([?](https://www.lua.org/pil/22.1.html))                               |       `%Y/%m/%d`      |
