
# Domino English Translation

<a href="https://github.com/Hans5958/Domino-English-Translation/actions/"><img src="https://img.shields.io/github/workflow/status/Hans5958/Domino-English-Translation/Deploy?style=flat-square" alt="GitHub Actions build status"></a> <a href="https://github.com/Hans5958/Domino-English-Translation/releases/"><img src="https://img.shields.io/github/v/release/Hans5958/Domino-English-Translation?style=flat-square" alt="Version number"></a> <a href="https://github.com/Hans5958/Domino-English-Translation/releases/"><img src="https://img.shields.io/github/downloads/Hans5958/Domino-English-Translation/total.svg?style=flat-square" alt="Download counter"></a> <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square" alt="PRs Welcome"> <a href="https://discord.gg/s42aft8"><img src="https://img.shields.io/discord/139268201803546624.svg?color=7289DA&style=flat-square" alt="Discord"></a>

Domino is a MIDI editor that is used for creating MIDI songs/musics. Domino is used by various blackers in the Black MIDI ecosystem.

Since Domino is an abandonware, and it's original language is Japanese, many people tried to translate it using resource editing tools. Some of it are outdated, while others are incomplete.

This repository is made to unify the translations made by community, while trying to complete it for easier usage.

## Usage

1. Download either the Domino `.zip` or the `.exe`.  
    - The `.zip` contains everything you need to run Domino. __Download this if you are not sure or this is your first time using this program.__  
    - You can also download the `.exe` if you want to use your configured settings. Place it inside your Domino directly, where "`Domino.exe`" placed.

    <a href="https://github.com/Hans5958/Domino-English-Translation/releases/latest"><img src="https://img.shields.io/github/v/release/Hans5958/Domino-English-Translation?label=download&style=flat-square" alt="Download the latest stable release"></a> <a href="https://github.com/Hans5958/Domino-English-Translation/releases"><img src="https://img.shields.io/github/v/release/Hans5958/Domino-English-Translation?include_prereleases&label=download&style=flat-square" alt="Download the latest nightly release"></a>

2. Recommended: Download the [dominohook](https://github.com/khang06/dominohook/releases) .dll file and bind it to the executable.
   Read how to bind it [here](https://github.com/khang06/dominohook/blob/master/README.md#usage). In the future, I will find a way so I could distribute it with the hook.

3. Run the executable.
    - If you downloaded the .zip, just run `Domino.exe`.
    - If you downloaded the .exe, after placing it on the directory, run `Domino_Translated.exe` (make sure you rename it so you know which one's the new version!).

## Building

### Requirements

- Windows operating system. This is a Win32 application.
- Windows Subsystem for Linux (WSL)
- Resource Hacker
- Python 3

### Howto

Just run `compile.sh`, and the binaries (the `.exe` files) will be compiled and placed inside the `_compile` folder.

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

### [x] Dialog

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

### [x] Menu

<details><summary>Expand to view the checklist.</summary>

- [x] 128
- [x] 130

</details>

### [x] String Tables

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

### [ ] Manual

<details><summary>Expand to view the checklist.</summary>

- [ ] index.html
- [ ] install.html
- [ ] module.html
- [ ] other.html
- [ ] use.html
- [ ] assets...

</details>

### [ ] Module

<details><summary>Expand to view the checklist.</summary>

- [x] GMLevel1.xml
- [ ] ok_GSm.xml
- [ ] ok_XG2k.xml
- [ ] ok_XGb.xml
- [ ] SC-88Pro.xml
- [ ] SC-8850.xml

</details>

### [x] System

<details><summary>Expand to view the checklist.</summary>

- [x] CurveCustom.txt
- [x] Exclusive.txt
- [x] Formula.txt
- [x] ParamMap.txt

</details>

### [x] 240

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

### [x] Other

<details><summary>Expand to view the checklist.</summary>

- [x] readme.txt

</details>