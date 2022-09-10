
# Domino English Translation

[![GitHub Actions build status](https://img.shields.io/github/workflow/status/Hans5958/Domino-English-Translation/Deploy?style=flat-square)](https://github.com/Hans5958/Domino-English-Translation/actions/)
[![GitHub Actions site build status](https://img.shields.io/github/workflow/status/Hans5958/Domino-English-Translation/Site%20Deployment?style=flat-square&label=site)](https://github.com/Hans5958/Domino-English-Translation/actions/)
[![Version number](https://img.shields.io/github/v/release/Hans5958/Domino-English-Translation?style=flat-square)](https://github.com/Hans5958/Domino-English-Translation/releases/)
[![Download counter](https://img.shields.io/github/downloads/Hans5958/Domino-English-Translation/total.svg?style=flat-square)](https://github.com/Hans5958/Domino-English-Translation/releases/)
![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)
<!-- [![Discord](https://img.shields.io/discord/139268201803546624.svg?color=7289DA&style=flat-square)](https://discord.gg/s42aft8) -->

Domino is a MIDI editor that is used for creating MIDI songs/musics. Domino is used by various blackers in the Black MIDI ecosystem.

Since Domino is an abandonware, and it's original language is Japanese, many people tried to translate it using resource editing tools. Some of it are outdated, while others are incomplete.

This repository is made to unify the translations made by community, while trying to complete it for easier usage.

## Usage

1. Download either the Domino `.zip` or the `.exe`.  
	- The `.zip` contains everything you need to run Domino. __Download this if you are not sure or this is your first time using this program.__  
	- You can also download the `.exe` if you want to use your configured settings. Place it inside your Domino directly, where "`Domino.exe`" placed.

	| Type | Download |
	| - | - |
	| Stable (Release) | [![Download the latest stable release](https://img.shields.io/github/v/release/Hans5958/Domino-English-Translation?label=download&style=flat-square)](https://github.com/Hans5958/Domino-English-Translation/releases/latest)
	| Nightly (Pre-Release) | [![Download the latest nightly release](https://img.shields.io/github/v/release/Hans5958/Domino-English-Translation?include_prereleases&label=download&style=flat-square)](https://github.com/Hans5958/Domino-English-Translation/releases)

2. Recommended: Download the [dominohook](https://github.com/khang06/dominohook/releases) .dll file and bind it to the executable.
   Read how to bind it [here](https://github.com/khang06/dominohook/blob/master/README.md#usage). In the future, I will find a way so I could distribute it with the hook.

3. Run the executable.
	- If you downloaded the .zip, just run `Domino.exe`.
	- If you downloaded the .exe, after placing it on the directory, run `Domino_Translated.exe` (make sure you rename it so you know which one's the new version!).

4. Optional: Read the manual from https://hans5958.github.io/Domino-English-Translation or the supplied manual.

## Building

### Requirements

- Windows operating system. This is a Win32 application.
- Windows Subsystem for Linux (WSL)
- Resource Hacker
- Python 3 (on WSL)
- 7zip (on WSL)
- jq (on WSL)

```bash
choco install reshack
sudo apt install p7zip-full jq python3.10
```

### Howto

Just run either `build-1.43.sh` or `build-1.44.sh` inside the `_script` folder. The binaries (the `.exe` files) will be compiled and placed inside the `_script/dist` folder.

## Contributing

You can contribute by translating various files. The `.rc` files contains the most of the program's strings. There is also `.html` files for the manuals, `.xml` for the modules, and some `.txt`'s.

Read [Building](#building) to get the binary files.

For starters, you can make a pull request from your fork, and the I'll check and merge it. If you don't know how to do it, make sure to read one of this guides.
- [How to Contribute to Open Source | Open Source Guides](https://opensource.guide/how-to-contribute/#opening-a-pull-request)
- [How to create a pull request in GitHub | Opensource.com](https://opensource.com/article/19/7/create-pull-request-github)
- [Creating a pull request - GitHub Help](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)

TL;DR, here's how.
1. Fork this repository by clicking the "Fork" button above.
2. Make a branch in your fork. (optional)
3. Do your edits there and commit (and push) the changes.
4. Create a pull request by clicking the "New pull request" button.

If you are still confused, you can ask me on [the issue board](https://github.com/Hans5958/Domino-English-Translation/issues) or on Discord (`Hans5958#0969`). 
<!-- You can contribute by following these steps.

1. Fork the master repository.  
You can do this by visit [the repository](https://github.com/Hans5958/Domino-English-Translation/) and click the "Fork" button.

2. Do the edits on the forked repository.  
After you forked the repository, you can edit whatever you want. Don't forget to commit it, of course.

3. Create a pull request.  
After that, you can create a pull request by clicking the "New pull request" button. Follow the steps and we will review it. -->

## Completion Checklist

### ✅ Dialog

<details><summary>Expand to view the checklist.</summary>

- [x] 100
- [x] 131
- [x] 132
- [x] 133
- [x] 134
- [x] 135
- [x] 136
- [x] 137
- [x] 138
- [x] 139
- [x] 144
- [x] 145
- [x] 146
- [x] 148
- [x] 149
- [x] 150
- [x] 151
- [x] 152
- [x] 153
- [x] 154
- [x] 155
- [x] 156
- [x] 157
- [x] 158
- [x] 159
- [x] 160
- [x] 161
- [x] 162
- [x] 163
- [x] 164
- [x] 165
- [x] 166
- [x] 167
- [x] 168
- [x] 169
- [x] 170
- [x] 171
- [x] 172
- [x] 173
- [x] 174
- [x] 187
- [x] 188
- [x] 213
- [x] 216
- [x] 217
- [x] 219
- [x] 240
- [x] 266
- [x] 267
- [x] 268
- [x] 269
- [x] 270
- [x] 272
- [x] 273
- [x] 275
- [x] 276
- [x] 277
- [x] 278
- [x] 279
- [x] 280
- [x] 281
- [x] 282
- [x] 283
- [x] 284
- [x] 285
- [x] 286
- [x] 288
- [x] 289
- [x] 290
- [x] 291
- [x] 292
- [x] 293
- [x] 294
- [x] 295
- [x] 296
- [x] 297
- [x] 298
- [x] 299
- [x] 300
- [x] 301
- [x] 302
- [x] 303
- [x] 304
- [x] 305
- [x] 306
- [x] 307
- [x] 308
- [x] 309
- [x] 310
- [x] 311
- [x] 312
- [x] 313
- [x] 314
- [x] 315
- [x] 316
- [x] 317
- [x] 318
- [x] 319
- [x] 320
- [x] 321
- [x] 322
- [x] 323
- [x] 324
- [x] 325
- [x] 326
- [x] 327

</details>

### ✅ Menu

<details><summary>Expand to view the checklist.</summary>

- [x] 128
- [x] 130

</details>

### ✅ String Tables

<details><summary>Expand to view the checklist.</summary>

- [x] 1
- [x] 2
- [x] 3
- [x] 4
- [x] 5
- [x] 6
- [x] 7
- [x] 8
- [x] 9
- [x] 10
- [x] 11
- [x] 12
- [x] 13
- [x] 14
- [x] 15
- [x] 16
- [x] 17
- [x] 18
- [x] 19
- [x] 20
- [x] 21
- [x] 22
- [x] 23
- [x] 24
- [x] 25
- [x] 26
- [x] 27
- [x] 28
- [x] 29
- [x] 30
- [x] 31
- [x] 32
- [x] 33
- [x] 34
- [x] 35
- [x] 36
- [x] 37
- [x] 38
- [x] 39
- [x] 40
- [x] 41
- [x] 42
- [x] 43
- [x] 44
- [x] 45
- [x] 46
- [x] 47
- [x] 48
- [x] 49
- [x] 50
- [x] 51
- [x] 52
- [x] 53

</details>

### ⬜️ Manual

<details><summary>Expand to view the checklist.</summary>

- [x] Index (index.html)
- [x] Installation (install.html)
	- [x] System Requirements
	- [x] License
	- [x] Installing
	- [x] Updating
	- [x] Uninstalling
	- [x] Port Settings (important)
- [ ] Usage (use.html)
	- [ ] Area Names
	- [ ] Previewing Notes
	- [ ] Placing a Note
	- [ ] Playing
	- [ ] Playing in the Middle
	- [ ] Changing Note Length (Gate)
	- [ ] Changing Note Strength (Velocity)
	- [ ] Moving a Note
	- [ ] Undoing
	- [ ] Adjusting Snapping
	- [ ] Removing a Note
	- [ ] Changing Initial Gate and Velocity Values
	- [ ] Changing Initial Gate and Velocity Values Based on Other Notes
	- [ ] Moving Multiple Notes
	- [ ] Removing Multiple Notes
	- [ ] Duplicating Multiple Notes (Copy/Paste)
	- [ ] Duplicating Multiple Notes (Move Duplicate)
	- [ ] Changing Velocity Values of Multiple Notes
	- [ ] Changing Gate and Velocity Values of Multiple Notes
	- [ ] Slicing a Note
	- [ ] Gradually Shifting the Timing of Multiple Notes (Stroke)
	- [ ] Filtering Selection
	- [ ] Transposing Between Octaves
	- [ ] Switching Between Pen and Select Tools
	- [ ] Changing Instrument
	- [ ] Changing Volume and Pan of a Part
	- [ ] Changing Volume and Pan Live
	- [ ] Changing Pitch Bend and Expression Continuously (Mouse)
	- [ ] Changing Pitch Bend and Expression Continuously (Selection)
	- [ ] Copying Pitch Bend and Expression Curves
	- [ ] Changing Current Track
	- [ ] Displaying Notes Other Tracks at the Same Time (Onion Skin)
	- [ ] Changing Tempo
	- [ ] Editing Rhythm Track
	- [ ] Changing Note Strength on Rhythm Track
	- [ ] Converting a Track to a Rhythm Track
	- [ ] Naming a Track
	- [ ] Adding a Track
	- [ ] Adding a Track Set for a Port
	- [ ] Removing a Track
	- [ ] Rearranging a Track
	- [ ] Editing Multiple Tracks
	- [ ] Playing a Specific Track
	- [ ] Setting a Marker
	- [ ] Setting the Time Signature
	- [ ] Setting the Title and Other Project Properties
	- [ ] Inserting a Comment Event
	- [ ] Inserting an Exclusive Event
	- [ ] Inserting a Control Change Event
	- [ ] Inserting Multiple Control Change Events
	- [ ] Playing in a Loop
	- [ ] Syncing Playback Position with MIDI Devices
	- [ ] Using Variables
	- [ ] Recording in Real Time
	- [ ] Recording in Steps
	- [ ] Receiving Exclusive Events
	- [ ] Saving a Project
	- [ ] Opening a Project
	- [ ] Adjusting End of Track
	- [ ] Exporting as a MIDI File
	- [ ] Backing Up
	- [ ] Customizing Shortcut Keys
	- [ ] Customizing the Toolbar
	- [ ] Customizing Mouse Operations
	- [ ] Customizing Curves and Lines
- [ ] Sound Source Definition File Specifications (module.html)
	- [ ] Overview
	- [ ] Main Structure
	- [ ] Sound Source Basic Information
	- [ ] Option
	- [ ] Instrument List Information
	- [ ] Drum Set List Information
	- [ ] Control Change Macro List Information
	- [ ] Template List Information
	- [ ] Default Data Information
- [ ] Other (other.html)
	- [ ] Bug Report
	- [ ] Feature Request
	- [ ] Acknowledgments
	- [ ] FAQ
- [ ] assets...

</details>

### ⬜️ Module

<details><summary>Expand to view the checklist.</summary>

- [x] GMLevel1.xml
- [ ] ok_GSm.xml
- [ ] ok_XG2k.xml
- [ ] ok_XGb.xml
- [ ] SC-88Pro.xml
- [ ] SC-8850.xml

</details>

### ✅ System

<details><summary>Expand to view the checklist.</summary>

- [x] CurveCustom.txt
- [x] Exclusive.txt
- [x] Formula.txt
- [x] ParamMap.txt

</details>

### ✅ 240

<details><summary>Expand to view the checklist.</summary>

- [x] 134
- [x] 136
- [x] 156
- [x] 165
- [x] 174
- [x] 217
- [x] 275
- [x] 277
- [x] 279
- [x] 280
- [x] 281
- [x] 290
- [x] 293
- [x] 295
- [x] 297
- [x] 299
- [x] 300
- [x] 301
- [x] 306
- [x] 307
- [x] 319
- [x] 322

</details>

### ✅ Other

<details><summary>Expand to view the checklist.</summary>

- [x] readme.txt

</details>

## License

This project is licensed under the terms of [MIT license](LICENSE), except contributions made by outside contributors before the licensing (10/09/2022). Permission have been granted for the usage of their code on this repository, but not under the license.

Translations are made with reference of previous translations. These are used under good faith, but no permissions have been given by the translators. The list of the used previous translations can be viewed [in this page](https://hans5958.github.io/Black-MIDI-Meta/domino-translations/). 