-----------------------------------------------
    mpv-osc-clock
    Copyright (c) cyberyurei2000 2024-2026

    README                         ver 4.00
-----------------------------------------------

■ Table of content
  ■ About
  ■ How to use?
  ■ Setup
  ■ Customization
  ■ Credits
  ■ Changelog


■ 1. About
    A mpv plugin that displays the system clock as an on-screen clock.

    This project is licensed under the BSD 3-Clause License, check the "LICENSE" file for more details.


■ 2. How to use?
    By default, press the "c" key to display the clock for a brief time.
  To toggle it permanently, press the "C" key.


■ 3. Setup
    1. Place the file "osc-clock.lua" inside your mpv scripts directory.
    2. If you want to use one of the fonts from "TV-TIMER-FONT-V1.zip", place the font inside your mpv fonts directory.

    ----------------------------------------------------------------------------
    Windows:   C:\Users\%username%\AppData\Roaming\mpv\
    Linux/BSD: ~/.config/mpv/
    MacOS:     ~/Library/Application Support/mpv/
    ----------------------------------------------------------------------------
    ◎Folder structure
        mpv/
        ├── fonts/
        ├── script-opts/
        │   └── osc-clock.conf
        └── scripts/
        	└── osc-clock.lua

        For more info, access: https://mpv.io/manual/master/#files
    ----------------------------------------------------------------------------


■ 4. Customization
    Create a "osc-clock.conf" file inside your mpv script-opts directory

    ----------------------------------------------------------------------------
    Windows:   C:\Users\%username%\AppData\Roaming\mpv\script-opts\osc-clock.conf
    Linux/BSD: ~/.config/mpv/script-opts/osc-clock.conf
    MacOS:     ~/Library/Application Support/mpv/script-opts/osc-clock.conf
    ----------------------------------------------------------------------------

    ◎Clock options
        clock_font
            ・Set the clock font.
            ・If set to default, the font from mpv osd will be used.
            ・Default: default

        clock_fontsize
            ・Set the clock font size.
            ・Default: 48

        clock_fontbold
            ・Set the clock font bold.
            ・Default: no

        clock_fontitalic
            ・Set the clock font italic.
            ・Default: no

        clock_fontcolor
            ・Set the clock font color.
            ・Uses the RRGGBB format.
            ・Default: FFFFFF

        clock_fontalpha
            ・Set the clock font alpha transparency.
            ・Available values: 0 (Full opaque) - 255 (Full transparent)
            ・Default: 0

        clock_bordersize
            ・Set the clock border size.
            ・Set 0 to disable the border
            ・Default: 4

        clock_bordercolor
            ・Set the clock border color.
            ・Uses the RRGGBB color format.
            ・Default: 000000

        clock_borderalpha
            ・Set the clock border alpha transparency.
            ・Available values: 0 (Full opaque) - 255 (Full transparent)
            ・Default: 0

        clock_shadowdist
            ・Set the clock shadow distance.
            ・Set 0 to disable the shadow
            ・Default: 0

        clock_shadowcolor
            ・Set the clock shadow color.
            ・Uses the RRGGBB format
            ・Default: 000000

        clock_shadowalpha
            ・Set the clock shadow alpha transparency.
            ・Available values: 0 (Full opaque) - 255 (Full transparent)
            ・Default: 0

        clock_textspacing
            ・Set spacing between individual characters.
            ・Default: 4

        clock_edgeblur
            ・Set clock text edge blur.
            ・Set 0 to disable the edge blur.
            ・Default: 1

        clock_posx
            ・Set clock X position on the screen.
            ・Default: 32

        clock_posy
            ・Set clock Y position on the screen.
            ・Default: 28

        clock_format
            ・Set clock time format.
            ・Will be ignored if clock_advformat is not empty.
            ・Available options:
                - 24: 24h clock format;
                - 12: 12h clock format;
                - 24s: 24h clock format with seconds;
                - 12s: 12h clock format with seconds;
                - 12m: 12h clock format with AM/PM;
                - 12j: Japanese 12h format (12:00 AM/PM -> 0:00);
                - 12jb: Japanese 12h format with a blank space before one digit hour;
            ・Default: 24

        clock_advformat
            ・Set clock time format using Lua's time notations.
            ・If not empty, this option will overwrite the clock_format option.
            ・Check Lua's documentation to learn more: https://www.lua.org/pil/22.1.html
            ・Default:

    ◎Date options
        date_enable
            ・Display the date in the clock.
            ・Default: no

        date_posx
            ・Set date X position on the screen.
            ・Default: 68

        date_posy
            ・Set date Y position on the screen.
            ・Default: 72

        date_format
            ・Set date format.
            ・Will be ignored if date_advformat is not empty.
            ・Available options:
             - dmy: DD/MM/YYYY date format;
             - iso: YYYY/MM/DD date format;
             - usa: MM/DD/YYYY date format;
             - smp1: DD/MM date format;
             - smp2: MM/DD date format;
            ・Default: smp2

        date_advformat
            ・Set date format using Lua's date notations.
            ・If not empty, this option will overwrite the date_format option.
            ・Check Lua's documentation to learn more: https://www.lua.org/pil/22.1.html
            ・Default:

        date_useclockopt
            ・Use the same configuration as the clock for the date.
            ・All date options bellow will be ignored if enabled.
            ・Default: no

        date_font
            ・Set the date font.
            ・If set to default, the font from mpv osd will be used.
            ・Default: default

        date_fontsize
            ・Set the date font size.
            ・Default: 30

        date_fontbold
            ・Set the date font bold.
            ・Default: yes

        date_fontitalic
            ・Set the date font italic.
            ・Default: no

        date_fontcolor
            ・Set the date font color.
            ・Uses the RRGGBB format.
            ・Default: FFFFFF

        date_fontalpha
            ・Set the date font alpha transparency.
            ・Available values: 0 (Full opaque) - 255 (Full transparent).
            ・Default: 0

        date_bordersize
            ・Set the date border size.
            ・Set 0 to disable the border.
            ・Default: 2

        date_bordercolor
            ・Set the date border color.
            ・Uses the RRGGBB color format.
            ・Default: 000000

        date_borderalpha
            ・Set the date border alpha transparency.
            ・Available values: 0 (Full opaque) - 255 (Full transparent).
            ・Default: 0

        date_shadowdist
            ・Set the date shadow distance.
            ・Set 0 to disable the shadow.
            ・Default: 0

        date_shadowcolor
            ・Set the date shadow color.
            ・Uses the RRGGBB color format.
            ・Default: 000000

        date_shadowalpha
            ・Set the date shadow alpha transparency.
            ・Available values: 0 (Full opaque) - 255 (Full transparent).
            ・Default: 0

        date_textspacing
            ・Set spacing between individual characters.
            ・Default: 4

        date_edgeblur
            ・Set date text edge blur.
            ・Set 0 to disable the edge blur.
            ・Default: 1

    ◎General options
        duration
            ・Set how many seconds the clock should be displayed before auto-hiding.
            ・Default: 5

        showosdmsg
            ・Toggle OSD messages.
            ・Default: yes

        fade
            ・Turn the clock transparent with a keybind.
            ・Set 0 to disable it.
            ・Available values: 0 (Full opaque) - 255 (Full transparent).
            ・Default: 80

        locale
            ・Set your prefered locale.
            ・By default it uses Lua's default locale (English).
            ・Uses language tags, ex.:
                - en-GB (Windows) / en_GB.UTF-8 (Linux) for British English;
                - zh-CN (Windows) / zh_CN.UTF-8 (Linux) for Simplified Chinese;
            ・Default:

        autoenable
            ・Set if the clock should be toggled automatically by default.
            ・Default: no
            ・Available options:
                - no: Disable
                - yes: Enable
                - onlyfs: Enable only in fullscreen
                - bylang: Enable via an audio track language specified by the user (only works if the audio track has a language metadata)
            ・Default: no

        autoenable_langs
            ・Set if the clock should be toggled automatically by default.
            ・Only works if autoenable option is set to bylang.
            ・Default: jpn, jp, kor, ko

    ◎Keybinds
        tempkey
            ・Set keybind to toggle the clock for a brief time.
            ・Default: c

        permakey
            ・Set keybind to toggle the clock permanently.
            ・Default: C

        fadekey
            ・Set keybind to make the clock translucid.
            ・Default: ;


■ 5. Credits
    The font "FO-TVASAHI-GMorning.otf" and the other fonts found in
  "TV-TIMER-FONT-V1.zip" was made by @tvoped on Twitter

    ----------------------------------------------------------------------------
    ◎Twitter archive link: https://web.archive.org/web/20220320123906/https://twitter.com/tvoped/status/1466992257962487811

    ◎Source (Dead): https://www.dropbox.com/scl/fi/3lir00hds4o3xqr6hdwea/TV-TIMER-FONT-V1.zip?rlkey=xgnqhdotec8a9kf25nck7azg7&e=1&dl=0
    ----------------------------------------------------------------------------


■ 6. Changelog
    2026/07/06 ver 4.00
        Features:
            ・A new default look of the clock to make it less distracting, using the mpv osd font and is set to use a 24h time format
            ・The old "clock_formatsmp" is now "clock_format" and has a various options to set a time format easily with a more clear documentation, is the same for setting the date format with the "date_format" option (you can still set the time and date format manually using the "clock_advformat" and "date_advformat")
            ・"clock_font" and "date_font" now has a new option called "default", if set, it will use the mpv osd font
            ・The customization documentation was rewritten to make it much more clear to read and to know about the various options of this plugin

    2026/05/25 ver 3.02
        Bugfixes:
            ・Small fixes for the "showosdmsg" option

    2026/04/10 ver 3.01
        Bugfixes:
            ・Fix for the "showosdmsg" which couldn't disable OSD messages related to enabling or disabling the "fade" feature

    2026/04/09 ver 3.00
        Features:
            ・"onbydefault" option was renamed to "autoenable"
            ・"autoenable" has now has a new option to toggle the clock only if detects a audio track language specified by the user ("bylang")
                ・ To specify the languages, use the "autoenable_langs" option
                ・This feature only works if the audio track has a language metadata
            ・It's now possible to make the clock transparent with a hotkey using the new "fade" option
                ・By default it uses the ; key, but it's customizable with the "fadekey" option
            ・There is a new "locale" option to set your prefered language locale
                ・By default it set to english, but you can set your own locale by using the language tag of your language (ex.: "en_GB.UTF-8" for British English or "zh_CN.UTF-8" for Simplified Chinese)
        Bugfixes:
            ・Fix "clock_fontalpha", "clock_borderalpha", "clock_shadowalpha", "date_fontalpha", "date_borderalpha", "date_shadowalpha" which couldn't be set above 99

    2025/10/20 ver 2.01
        Features:
            ・When enabling or disabling the clock, a message will be display on the OSD
                ・You can disable or re-enable it with the "showosdmsg" option

    2025/08/15 ver 2.00
        Features:
            ・You can now customize the style of the date just like the clock
                ・Because of this, the "date_useclockopt" option was added to make the date use the same configuration as the clock
                ・WARNING: this change also renames all clock and date related options, check Clock Customization docs for more information
            ・"onbydefault" has now has a new option to toggle the clock only when the player goes fullscreen ("onlyfs")
            ・Releases now ship with README.txt

    2025/08/14 ver 1.02
        Features:
            ・Added option to set font italic through the "fontitalic" option
            ・Source code improvements
        Bugfixes:
            ・Fix "onbydefault" option, which was non-functional in previous releases

    2025/07/31 ver 1.01
        Features:
            ・Added option to set border transparency through the "borderalpha" option
            ・Added option to set spacing between individual characters through the "textspacing" option
            ・"fontcolor", "bordercolor" and "shadowcolor" now uses the RRGGBB format instead of BBGGRR
            ・"blur" option was renamed to "edgeblur"

    2025/06/20 ver 1.00
        ・First stable release
