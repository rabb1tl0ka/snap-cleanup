# snap-cleanup

A simple bash script to clean up old snap versions.

## Installation

No need to install. Just clone this repo and chmod +x the file.

```bash
chmod +x snap-cleanup-run.sh
```

## Usage

Use the preview flag to get a preview of what snaps the script will remove.
```bash
sudo ./snap-cleanup-run.sh preview ignore=core,gnome,snap,kf
```
Example of a preview output:
```
Preview mode: Only showing snaps to be closed and removed.
Ignoring the following snaps: core gnome snap kf
Preview: Would remove brave --revision=340
Preview: Would remove canonical-livepatch --revision=246
Skipping snap: core --revision=16202 (Ignored)
Skipping snap: core18 --revision=2796 (Ignored)
Skipping snap: core20 --revision=2105 (Ignored)
Skipping snap: core22 --revision=1033 (Ignored)
Preview: Would remove cups --revision=980
Preview: Would remove discord --revision=177
Preview: Would remove figma-linux --revision=178
Preview: Would remove fractal --revision=106
Skipping snap: gnome-3-28-1804 --revision=194 (Ignored)
Skipping snap: gnome-3-34-1804 --revision=90 (Ignored)
Skipping snap: gnome-3-38-2004 --revision=140 (Ignored)
Skipping snap: gnome-42-2204 --revision=132 (Ignored)
Preview: Would remove gtk-common-themes --revision=1534
Preview: Would remove inkscape --revision=10549
Preview: Would remove ipfs-desktop --revision=45
Preview: Would remove jabref --revision=2758
Skipping snap: kf5-5-104-qt-5-15-8-core22 --revision=7 (Ignored)
Skipping snap: kf5-5-105-qt-5-15-9-core22 --revision=9 (Ignored)
Preview: Would remove libreoffice --revision=302
Preview: Would remove node --revision=7346
Preview: Would remove okular --revision=146
Preview: Would remove pinta --revision=27
Preview: Would remove postman --revision=206
Preview: Would remove slack --revision=130
Skipping snap: snap-store --revision=638 (Ignored)
Skipping snap: snapd --revision=20290 (Ignored)
Preview: Would remove spotify --revision=73
```

To actually have the script do changes on your system, remove the preview flag.
```bash
sudo ./snap-cleanup-run.sh ignore=core,gnome,snap,kf
```

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

[MIT](https://choosealicense.com/licenses/mit/)
