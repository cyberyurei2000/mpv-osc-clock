# mpv-osc-clock

Displays the system clock as an on-screen clock in mpv.

![Screenshot1](/docs/assets/screenshot1.png)

## How to use?

By default, press the `c` key to display the clock for a brief time.

To toggle it permanently, press the `C` key.

## Setup

* Place the file `osc-clock.lua` inside your mpv `scripts` directory.
* Place `FO-TVASAHI-GMorning.otf` (or any font of your choosing) inside your mpv `fonts` directory.

```
• Windows:    C:\Users\%username%\AppData\Roaming\mpv\
• Linux/BSD:  ~/.config/mpv/
• MacOS:      ~/Library/Application Support/mpv/
```

### Folder Structure
```
mpv/
├── fonts/
│   └── FO-TVASAHI-GMorning.otf
├── script-opts/
│   └── osc-clock.conf
└── scripts/
	└── osc-clock.lua
```

For more information, access the [mpv documentation](https://mpv.io/manual/master/#files).

## Customization

You can customize any aspect of the clock. For more information, check [Clock Customization](/docs/CUSTOMIZATION.md).

## Credits

The font `FO-TVASAHI-GMorning.otf` and the other fonts found in `TV-TIMER-FONT-V1.zip` in the releases page was made by user [@tvoped](https://web.archive.org/web/20220320123906/https://twitter.com/tvoped/status/1466992257962487811) on Twitter.

You can get the fonts in the releases page or from the original [source (dead)](https://www.dropbox.com/scl/fi/3lir00hds4o3xqr6hdwea/TV-TIMER-FONT-V1.zip?rlkey=xgnqhdotec8a9kf25nck7azg7&e=1&dl=0).

## License

This project is licensed under the __BSD 3-Clause License__ - See the [LICENSE](./LICENSE) file for more details.
