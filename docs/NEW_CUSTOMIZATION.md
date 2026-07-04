# Clock Customization Options Guide

Create a `osc-clock.conf` file inside your mpv `script-opts` directory.

```
• Windows:    C:\Users\%username%\AppData\Roaming\mpv\script-opts\osc-clock.conf
• Linux/BSD:  ~/.config/mpv/script-opts/osc-clock.conf
• MacOS:      ~/Library/Application Support/mpv/script-opts/osc-clock.conf
```
- __DISCLAIMER:__ This guide refers to the __master branch__ version of the plugin. Both the plugin and this guide are still __under development__.
It's recommended to use the version available on the [release page](https://github.com/cyberyurei2000/mpv-osc-clock/releases).

## Available options

### Clock options

#### Option: `clock_font`
- Set the clock's font.
- If set to `default`, mpv's osd font will be used.
- __Default:__ `default`

#### Option: `clock_fontsize`
- Set the clock's font size.
- __Default:__ `48`

#### Option: `clock_fontbold`
- Set the clock's font bold.
- __Default:__ `yes`

#### Option: `clock_fontitalic`
- Set the clock's font italic.
- __Default:__ `no`

#### Option: `clock_fontcolor`
- Set the clock's font color.
- Uses the `RRGGBB` color format.
- __Default:__ `FFFFFF`

#### Option: `clock_fontalpha`
- Set the clock's font alpha transparency.
- Available values: `0` (Full opaque) - `255` (Full transparent)
- __Default:__ `0`

#### Option: `clock_bordersize`
- Set the clock's border size.
- Set `0` to disable the border
- __Default:__ `2`

#### Option: `clock_bordercolor`
- Set the clock's border color.
- Uses the `RRGGBB` color format.
- __Default:__ `000000`

#### Option: `clock_borderalpha`
- Set the clock's border alpha transparency.
- Available values: `0` (Full opaque) - `255` (Full transparent)
- __Default:__ `0`

#### Option: `clock_shadowdist`
- Set the clock's shadow distance.
- Set `0` to disable the shadow
- __Default:__ `0`

#### Option: `clock_shadowcolor`
- Set the clock's shadow color.
- Uses the `RRGGBB` color format.
- __Default:__ `000000`

#### Option: `clock_shadowalpha`
- Set the clock's shadow alpha transparency.
- Available values: `0` (Full opaque) - `255` (Full transparent)
- __Default:__ `0`

#### Option: `clock_textspacing`
- Set spacing between individual characters.
- __Default:__ `4`

#### Option: `clock_edgeblur`
- Set clock's text edge blur.
- Set `0` to disable the edge blur.
- __Default:__ `1`

#### Option: `clock_posx`
- Set clock's X position on the screen.
- __Default:__ `32`

#### Option: `clock_posy`
- Set clock's Y position on the screen.
- __Default:__ `28`

#### Option: `clock_format`
- Set clock's time format.
- Will be ignored if `clock_advformat` is not empty.
- Available options:
    - `24`: 24h clock format;
    - `12`: 12h clock format;
    - `24s`: 24h clock format with seconds;
    - `12s`: 12h clock format with seconds;
    - `12m`: 12h clock format with AM/PM;
    - `12j`: Japanese 12h format (12:00 AM/PM -> 0:00);
    - `12jb`: Japanese 12h format with a blank space before one digit hour;
- __Default:__ `12jb`

#### Option: `clock_advformat`
- Set clock's time format using Lua's time notations.
- If not empty, this option will overwrite the `clock_format` option.
- Check [Lua's documentation](https://www.lua.org/pil/22.1.html) to lean more.
- __Default:__ `　`

### Date options

#### Option: `date_enable`
- Display the date in the clock
- __Default:__ `no`

#### Option: `date_posx`
- Set date's X position on the screen.
- __Default:__ `68`

#### Option: `date_posy`
- Set date's Y position on the screen.
- __Default:__ `72`

#### Option: `date_format`
- Set date format.
- Will be ignored if `date_advformat` is not empty.
- Available options:
    - `dmy`: DD/MM/YYYY date format;
    - `iso`: YYYY/MM/DD date format;
    - `usa`: MM/DD/YYYY date format;
    - `smp1`: DD/MM date format;
    - `smp2`: MM/DD date format;
- __Default:__ `smp2`

#### Option: `date_advformat`
- Set date format using Lua's date notations.
- If not empty, this option will overwrite the `date_format` option.
- Check [Lua's documentation](https://www.lua.org/pil/22.1.html) to lean more.
- __Default:__ `　`

#### Option: `date_useclockopts`
- Use the same configuration as the clock for the date.
- All date options bellow will be ignored if enabled.
- __Default:__ `no`

#### Option: `date_font`
- Set the date's font.
- If set to `default`, mpv's osd font will be used.
- __Default:__ `default`

#### Option: `date_fontsize`
- Set the date's font size.
- __Default:__ `30`

#### Option: `date_fontbold`
- Set the date's font bold.
- __Default:__ `yes`

#### Option: `date_fontitalic`
- Set the date's font italic.
- __Default:__ `no`

#### Option: `date_fontcolor`
- Set the date's font color.
- Uses the `RRGGBB` color format.
- __Default:__ `FFFFFF`

#### Option: `date_fontalpha`
- Set the date's font alpha transparency.
- Available values: `0` (Full opaque) - `255` (Full transparent)
- __Default:__ `0`

#### Option: `date_bordersize`
- Set the date's border size.
- Set `0` to disable the border
- __Default:__ `1`

#### Option: `date_bordercolor`
- Set the clock's border color.
- Uses the `RRGGBB` color format.
- __Default:__ `000000`

#### Option: `date_borderalpha`
- Set the date's border alpha transparency.
- Available values: `0` (Full opaque) - `255` (Full transparent)
- __Default:__ `0`

#### Option: `date_shadowdist`
- Set the date's shadow distance.
- Set `0` to disable the shadow
- __Default:__ `0`

#### Option: `date_shadowcolor`
- Set the date's shadow color.
- Uses the `RRGGBB` color format.
- __Default:__ `000000`

#### Option: `date_shadowalpha`
- Set the date's shadow alpha transparency.
- Available values: `0` (Full opaque) - `255` (Full transparent)
- __Default:__ `0`

#### Option: `date_textspacing`
- Set spacing between individual characters.
- __Default:__ `4`

#### Option: `date_edgeblur`
- Set date's text edge blur.
- Set `0` to disable the edge blur.
- __Default:__ `1`

### General options

#### Option: `duration`
- Set how many seconds the clock should be displayed before auto-hiding.
- __Default:__ `5`

#### Option: `showosdmsg`
- Toggle OSD messages.
- __Default:__ `yes`

#### Option: `fade`
- Turn the clock transparent with a keybind.
- __Default:__ `80`

#### Option: `locale`
- Set your prefered locale.
- By default it uses Lua's default (English).
- Uses language tags, ex.:
    - `en-GB` (Windows) / `en_GB.UTF-8` (Linux) for British English;
    - `zh-CN` (Windows) / `zh_CN.UTF-8` (Linux) for Simplified Chinese;
- __Default:__ `　`

#### Option: `autoenable`
- Set if the clock should be toggled automatically by default.
- Available options:
    - `no`: Disable;
    - `yes`: Enable;
    - `fsonly`: Enable only in fullscreen;
    - `bylang`: Enable via an audio track language specified by the user (only works if the audio track has a language metadata);
- __Default:__ `no`

#### Option: `autoenable_langs`
- Set if the clock should be toggled automatically by default.
- Only works if `autoenable` option is set to `bylang`.
- __Default:__ `jpn, jp, kor, ko`

### Keybinds

#### Option: `tempkey`
- Set keybind to toggle the clock for a brief time.
- __Default:__ `c`

#### Option: `permakey`
- Set keybing to toggle the clock permanently.
- __Default:__ `C`

#### Option: `fadekey`
- Set keybing to make the clock translucid.
- Only works if the `fade` option is not set to `0`.
- __Default:__ `;`

## Examples (TODO)

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
locale=ko_KR.UTF-8
```

![Screenshot5](/docs/assets/screenshot5.png)
