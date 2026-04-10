# Clock Customization

Create a `osc-clock.conf` file inside your mpv `script-opts` directory.

```
• Windows:    C:\Users\%username%\AppData\Roaming\mpv\script-opts\osc-clock.conf
• Linux/BSD:  ~/.config/mpv/script-opts/osc-clock.conf
• MacOS:      ~/Library/Application Support/mpv/script-opts/osc-clock.conf
```

## Customization options

|     Clock Options     |                        Description                                            |         Default        |                                        Additional Info                                          |
|-----------------------|-------------------------------------------------------------------------------|------------------------|-------------------------------------------------------------------------------------------------|
|  `clock_font`         |  Set font                                                                     |  `FO-TVASAHI-GMorning` |                                                                                                 |
|  `clock_fontsize`     |  Set font size                                                                |        `48`            |                                                                                                 |
|  `clock_fontbold`     |  Set font bold                                                                |        `no`            |                                                                                                 |
|  `clock_fontitalic`   |  Set font italic                                                              |        `no`            |                                                                                                 |
|  `clock_fontcolor`    |  Set font color                                                               |        `FFFFFF`        |  Uses the RRGGBB format                                                                         |
|  `clock_fontalpha`    |  Set font transparency                                                        |        `0`             |  Available values: `0` - `255`                                                                  |
|  `clock_bordersize`   |  Set border size                                                              |        `4`             |  Set `0` to disable the border                                                                  |
|  `clock_bordercolor`  |  Set border color                                                             |        `000000`        |  Uses the RRGGBB format                                                                         |
|  `clock_borderalpha`  |  Set border transparency                                                      |        `0`             |  Available values: `0` - `255`                                                                  |
|  `clock_shadowdist`   |  Set shadow distance                                                          |        `0`             |  Set `0` to disable the shadow                                                                  |
|  `clock_shadowcolor`  |  Set shadow color                                                             |        `000000`        |  Uses the RRGGBB format                                                                         |
|  `clock_shadowalpha`  |  Set shadow transparency                                                      |        `0`             |  Available values: `0` - `255`                                                                  |
|  `clock_textspacing`  |  Set spacing between individual characters                                    |        `4`             |                                                                                                 |
|  `clock_edgeblur`     |  Set text edge blur                                                           |        `1`             |  Set `0` to disable it                                                                          |
|  `clock_posx`         |  Set X position on screen                                                     |        `32`            |                                                                                                 |
|  `clock_posy`         |  Set Y position on screen                                                     |        `28`            |                                                                                                 |
|  `clock_format`       |  Set time format                                                              |        `%H:%M`         |  Learn more at ([?](https://www.lua.org/pil/22.1.html)); will be ignored if `formatsmp` is set  |
|  `clock_formatsmp`    |  Toggle between a simplified 12h format                                       |        `2`             |  Available options:<br> `0`: Disabled;<br> `1`: No blank space;<br> `2`: Add blank space;<br>   |

|     Date Options      |                        Description                                            |         Default        |                                        Additional Info                                          |
|-----------------------|-------------------------------------------------------------------------------|------------------------|-------------------------------------------------------------------------------------------------|
|  `date_enable`        |  Toggle date                                                                  |        `no`            |                                                                                                 |
|  `date_posx`          |  Set X position on screen                                                     |        `82`            |                                                                                                 |
|  `date_posy`          |  Set Y position on screen                                                     |        `88`            |                                                                                                 |
|  `date_format`        |  Set date format                                                              |      `%Y/%m/%d`        |  Learn more at ([?](https://www.lua.org/pil/22.1.html))                                         |
|  `date_useclockopt`   |  Use the same configuration as the clock                                      |        `no`            |  All date options bellow will be ignored if enabled                                             |
|  `date_font`          |  Set font                                                                     |        ` `             |                                                                                                 |
|  `date_fontsize`      |  Set font size                                                                |        `30`            |                                                                                                 |
|  `date_fontbold`      |  Set font bold                                                                |        `yes`           |                                                                                                 |
|  `date_fontitalic`    |  Set font italic                                                              |        `no`            |                                                                                                 |
|  `date_fontcolor`     |  Set font color                                                               |        `FFFFFF`        |  Uses the RRGGBB format                                                                         |
|  `date_fontalpha`     |  Set font transparency                                                        |        `0`             |  Available values: `0` - `255`                                                                  |
|  `date_bordersize`    |  Set border size                                                              |        `1`             |  Set `0` to disable the border                                                                  |
|  `date_bordercolor`   |  Set border color                                                             |        `000000`        |  Uses the RRGGBB format                                                                         |
|  `date_borderalpha`   |  Set border transparency                                                      |        `0`             |  Available values: `0` - `255`                                                                  |
|  `date_shadowdist`    |  Set shadow distance                                                          |        `0`             |  Set `0` to disable the shadow                                                                  |
|  `date_shadowcolor`   |  Set shadow color                                                             |        `000000`        |  Uses the RRGGBB format                                                                         |
|  `date_shadowalpha`   |  Set shadow transparency                                                      |        `0`             |  Available values: `0` - `255`                                                                  |
|  `date_textspacing`   |  Set spacing between individual characters                                    |        `4`             |                                                                                                 |
|  `date_edgeblur`      |  Set text edge blur                                                           |        `1`             |  Set `0` to disable it                                                                          |

|   General Options    |                                      Description                               |         Default        |                                            Additional Info                                          |
|----------------------|--------------------------------------------------------------------------------|------------------------|-----------------------------------------------------------------------------------------------------|
|  `duration`          |  Set how many seconds the clock should be displayed before auto-hiding         |        `5`             |                                                                                                     |
|  `showosdmsg`        |  Toggle OSD messages                                                           |        `yes`           |                                                                                                     |
|  `fade`              |  Turn the clock transparent with a hotkey                                      |        `80`            |  Set `0` to disable it. Available values: `0` - `255`                                               |
|  `locale`            |  Set your prefered locale                                                      |        ` `             |  By default it uses lua's default (english). Uses language tags, ex.: `en_GB.UTF8` for British English or `zh_CN.UTF8` for Simplified Chinese   |
|  `autoenable`        |  Set if the clock should be toggled automatically by default                   |        `no`            |  Available options:<br> `no`: Disable;<br> `yes`: Enable;<br> `onlyfs`: Enable only in fullscreen;<br> `bylang`: Enable via an audio track language specified by the user (only works if the audio track has a language metadata);  |
|  `autoenable_langs`  |  List languages for the clock to autoenable it                                 |   `jpn, jp, kor, ko`   |  Only works if `autoenable` is set to `bylang`                                                      |
|  `tempkey`           |  Set key to toggle the clock for a brief time                                  |        `c`             |                                                                                                     |
|  `permakey`          |  Set key to toggle the clock permanently                                       |        `C`             |                                                                                                     |
|  `fadekey`           |  Set key for the fade clock feature                                            |        `;`             |                                                                                                     |

### Examples

Here some examples of possible customizations that can be done:

```ini
clock_font=Globoface 2002
clock_fontsize=60
clock_fontbold=no
clock_fontcolor=FFFFFF
clock_bordersize=1
clock_bordercolor=000000
clock_shadowdist=4
clock_shadowcolor=000000
clock_shadowalpha=60
clock_textspacing=0
clock_edgeblur=0
clock_posx=70
clock_posy=30
clock_format=%H:%M:%S
clock_formatsmp=0
```

![Screenshot2](/docs/assets/screenshot2.png)

```ini
clock_font=Comic Sans MS
clock_fontsize=50
clock_fontbold=yes
clock_fontcolor=FF0000
clock_bordersize=2
clock_bordercolor=FFFF00
clock_shadowdist=3
```

![Screenshot3](/docs/assets/screenshot3.png)

```ini
clock_font=FO-NHKTIMER-2021
clock_bordersize=2
clock_borderalpha=10
clock_shadowdist=0.5
clock_shadowalpha=50
clock_textspacing=4
clock_edgeblur=2
clock_posx=44
clock_posy=25
clock_formatsmp=2
```

![Screenshot4](/docs/assets/screenshot4.png)

```ini
clock_font=NanumGothic
clock_fontsize=35
clock_fontbold=yes
clock_bordersize=0
clock_shadowdist=2
clock_textspacing=0
clock_edgeblur=0
clock_posx=52
clock_posy=60
clock_formatsmp=1
date_enable=yes
date_posx=50
date_posy=26
date_format=%d (%a)
date_useclockopt=yes
```

![Screenshot5](/docs/assets/screenshot5.png)
