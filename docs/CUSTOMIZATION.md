# Clock Customization

Create a `osc-clock.conf` file inside the mpv `script-opts` directory.

```
• Windows:    C:\Users\%username%\AppData\Roaming\mpv\script-opts\osc-clock.conf
• Linux/BSD:  ~/.config/mpv/script-opts/osc-clock.conf
• MacOS:      ~/Library/Application Support/mpv/script-opts/osc-clock.conf
```

## Customization options

| General Options |                                      Description                                        |         Default        |
|-----------------|-----------------------------------------------------------------------------------------|------------------------|
|  `font`         |  Set font                                                                               |  `FO-TVASAHI-GMorning` |
|  `fontsize`     |  Set font size                                                                          |        `48`            |
|  `fontbold`     |  Set font bold                                                                          |        `no`            |
|  `fontcolor`    |  Set font color (format: RRGGBB)                                                        |        `FFFFFF`        |
|  `fontalpha`    |  Set font transparency                                                                  |        `0`             |
|  `bordersize`   |  Set border size, set `0` to disable the border                                         |        `4`             |
|  `bordercolor`  |  Set border color (format: RRGGBB)                                                      |        `000000`        |
|  `borderalpha`  |  Set border transparency                                                                |        `0`             |
|  `shadowdist`   |  Set shadow distance, set `0` to disable the shadow                                     |        `0`             |
|  `shadowcolor`  |  Set shadow color (format: RRGGBB)                                                      |        `000000`        |
|  `shadowalpha`  |  Set shadow transparency                                                                |        `0`             |
|  `textspacing`  |  Set spacing between individual characters                                              |        `4`             |
|  `edgeblur`     |  Set text edge blur, set `0` to disable                                                 |        `1`             |
|  `tempkey`      |  Set key to toggle the clock for a brief time                                           |        `c`             |
|  `permakey`     |  Set key to toggle the clock permanently                                                |        `C`             |
|  `duration`     |  Set how many seconds the clock should be displayed before auto-hiding                  |        `5`             |
|  `onbydefault`  |  Set if the clock should be toggled automatically by default                            |        `no`            |

|  Clock Options  |                                      Description                                        |         Default        |
|-----------------|-----------------------------------------------------------------------------------------|------------------------|
|  `clockposx`    |  Set clock X position on screen                                                         |        `32`            |
|  `clockposy`    |  Set clock Y position on screen                                                         |        `28`            |
|  `format`       |  Set time format (learn more at ([?](https://www.lua.org/pil/22.1.html)) (will be ignored if `formatsmp` is set) |        `%H:%M`        |
|  `formatsmp`    |  Toggle between a simplified 12h format (`2` or `1`), set `0` to disable                |         `2`            |

|  Date Options   |                                      Description                                        |         Default        |
|-----------------|-----------------------------------------------------------------------------------------|------------------------|
|  `date`         |  Toggle date                                                                            |        `no`            |
|  `dateposx`     |  Set X position of the date on screen                                                   |        `52`            |
|  `dateposy`     |  Set Y position of the date on screen                                                   |        `58`            |
|  `dateformat`   |  Set date format ([?](https://www.lua.org/pil/22.1.html))                               |      `%Y/%m/%d`        |

### Examples

Here some examples of possible customizations that can be done:

```ini
font=Globoface 2002
fontsize=60
fontbold=no
fontcolor=FFFFFF
bordersize=1
bordercolor=000000
shadowdist=4
shadowcolor=000000
shadowalpha=60
textspacing=0
edgeblur=0
clockposx=70
clockposy=30
format=%H:%M:%S
formatsmp=0
```

![Screenshot2](/docs/assets/screenshot2.png)

```ini
font=Comic Sans MS
fontsize=50
fontbold=yes
fontcolor=FF0000
bordersize=2
bordercolor=FFFF00
shadowdist=3
```

![Screenshot3](/docs/assets/screenshot3.png)

```ini
font=FO-NHKTIMER-2021
bordersize=2
borderalpha=10
shadowdist=0.5
shadowalpha=50
textspacing=4
edgeblur=2
clockposx=44
clockposy=25
formatsmp=2
```

![Screenshot4](/docs/assets/screenshot4.png)

```ini
font=NanumGothic
fontsize=35
fontbold=yes
bordersize=0
shadowdist=2
textspacing=0
edgeblur=0
clockposx=52
clockposy=60
formatsmp=1
date=yes
dateposx=50
dateposy=26
dateformat=%d (%a)
```

![Screenshot5](/docs/assets/screenshot5.png)
