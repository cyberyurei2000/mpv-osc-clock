-----------------------------------------------
    mpv-osc-clock
    Copyright (c) cyberyurei2000 2024-2026

    README                         ver 3.00
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
    2. Place "FO-TVASAHI-GMorning.otf" (or any font of your choosing) inside your mpv fonts directory.

    ----------------------------------------------------------------------------
    Windows:   C:\Users\%username%\AppData\Roaming\mpv\
    Linux/BSD: ~/.config/mpv/
    MacOS:     ~/Library/Application Support/mpv/
    ----------------------------------------------------------------------------
    ◎Folder structure
        mpv/
        ├── fonts/
        │   └── FO-TVASAHI-GMorning.otf
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
            ・Set font name
            ・Default: FO-TVASAHI-GMorning

        clock_fontsize
            ・Set font size
            ・Default: 48

        clock_fontbold
            ・Set font bold
            ・Default: no

        clock_fontitalic
            ・Set font italic
            ・Default: no

        clock_fontcolor
            ・Set font color
            ・Default: FFFFFF
            ・Uses the RRGGBB format

        clock_fontalpha
            ・Set font transparency
            ・Default: 0
            ・Available options: 0 - 255

        clock_bordersize
            ・Set border size
            ・Default: 4
            ・Set it 0 to disable the border

        clock_bordercolor
            ・Set border color
            ・Default: 000000
            ・Uses the RRGGBB format

        clock_borderalpha
            ・Set border transparency
            ・Default: 0
            ・Available values: 0 - 255

        clock_shadowdist
            ・Set shadow distance
            ・Default: 0
            ・Set it 0 to disable the shadow

        clock_shadowcolor
            ・Set shadow color
            ・Default: 000000
            ・Uses the RRGGBB format

        clock_shadowalpha
            ・Set shadow transparency
            ・Default: 0
            ・Available values: 0 - 255

        clock_textspacing
            ・Set spacing between individual characters
            ・Default: 4

        clock_edgeblur
            ・Set text edge blur
            ・Default: 1
            ・Set it 0 to disable it

        clock_posx
            ・Set X position on screen
            ・Default: 32

        clock_posy
            ・Set Y position on screen
            ・Default: 28

        clock_format
            ・Set time format
            ・Default: %H:%M
            ・Learn more at https://www.lua.org/pil/22.1.html
            ・Will be ignored if "clock_formatsmp" is set

        clock_formatsmp
            ・Toggle between a simplified 12h format
            ・Default: 2
            ・Available options:
                - 0: Disable
                - 1: No blank space
                - 2: Add blank space

    ◎Date options
        date_enable
            ・Toggle date
            ・Default: no

        date_posx
            ・Set X position on screen
            ・Default: 82

        date_posy
            ・Set Y position on screen
            ・Deault: 88

        date_format
            ・Set date format
            ・Default: %Y/%m/%d
            ・Learn more at https://www.lua.org/pil/22.1.html

        date_useclockopt
            ・Use the same configuration as the clock
            ・Default: no
            ・All date options bellow will be ignored if enabled

        date_font
            ・Set font name
            ・Default:

        date_fontsize
            ・Set font size
            ・Default: 30

        date_fontbold
            ・Set font bold
            ・Default: yes

        date_fontitalic
            ・Set font italic
            ・Default: no

        date_fontcolor
            ・Set font color
            ・Default: FFFFFF
            ・Uses the RRGGBB format

        date_fontalpha
            ・Set font transparency
            ・Default: 0
            ・Available options: 0 - 255

        date_bordersize
            ・Set border size
            ・Default: 1
            ・Set it 0 to disable the border

        date_bordercolor
            ・Set border color
            ・Default: 000000
            ・Uses the RRGGBB format

        date_borderalpha
            ・Set border transparency
            ・Default: 0
            ・Available values: 0 - 255

        date_shadowdist
            ・Set shadow distance
            ・Default: 0
            ・Set it 0 to disable the shadow

        date_shadowcolor
            ・Set shadow color
            ・Default: 000000
            ・Uses the RRGGBB format

        date_shadowalpha
            ・Set shadow transparency
            ・Default: 0
            ・Available values: 0 - 255

        date_textspacing
            ・Set spacing between individual characters
            ・Default: 4

        date_edgeblur
            ・Set text edge blur
            ・Default: 1
            ・Set it 0 to disable it

    ◎General options
        duration
            ・Set how many seconds the clock should be displayed before auto-hiding
            ・Default: 5

        showosdmsg
            ・Toggle OSD messages
            ・Default: yes

        fade
            ・Turn the clock transparent with a hotkey
            ・Default: 80
            ・Set 0 to disable it. Available values: 0 - 255

        locale
            ・Set your prefered locale, by default it uses lua's default (english)
            ・Default:
            ・Uses language tags, ex.: "en_GB.UTF8" for British English or "zh_CN.UTF8" for Simplified Chinese

        autoenable
            ・Set if the clock should be toggled automatically by default
            ・Default: no
            ・Available options:
                - no: Disable
                - yes: Enable
                - onlyfs: Enable only in fullscreen
                - bylang: Enable via an audio track language specified by the user (only works if the audio track has a language metadata)

        autoenable_langs
            ・List languages for the clock to autoenable it
            ・Default: jpn, jp, kor, ko
            ・Only works if "autoenable" is set to "bylang"

        tempkey
            ・Set key to toggle the clock for a brief time
            ・Default: c

        permakey
            ・Set key to toggle the clock permanently
            ・Default: C

        fadekey
            ・Set key for the fade clock feature
            ・Default: ;


■ 5. Credits
    The font "FO-TVASAHI-GMorning.otf" and the other fonts found in
  "TV-TIMER-FONT-V1.zip" was made by @tvoped on Twitter

    ----------------------------------------------------------------------------
    ◎Twitter archive link: https://web.archive.org/web/20220320123906/https://twitter.com/tvoped/status/1466992257962487811

    ◎Source (Dead): https://www.dropbox.com/scl/fi/3lir00hds4o3xqr6hdwea/TV-TIMER-FONT-V1.zip?rlkey=xgnqhdotec8a9kf25nck7azg7&e=1&dl=0
    ----------------------------------------------------------------------------


■ 6. Changelog
    2026/04/09 ver 3.00
        Features:
            ・"onbydefault" option was renamed to "autoenable"
            ・"autoenable" has now has a new option to toggle the clock only if detects a audio track language specified by the user ("bylang")
                ・ To specify the languages, check the "autoenable_langs" option
                ・This feature only works if the audio track has a language metadata
            ・It's now possible to make the clock transparent with a hotkey using the new "fade" option
                ・By default it uses the ; key, but it's customizable with the "fadekey" option
            ・There is a new "locale" option to set your prefered language locale
                ・By default it set to english, but you can set your own locale by using the language tag of your language (ex.: "en_GB.UTF8" for British English or "zh_CN.UTF8" for Simplified Chinese)
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
