
# Domino English Translation

[![GitHub Actions build status](https://img.shields.io/github/actions/workflow/status/Hans5958/Domino-English-Translation/PushCheck.yml?style=flat-square)](https://github.com/Hans5958/Domino-English-Translation/actions/)
[![GitHub Actions site build status](https://img.shields.io/github/actions/workflow/status/Hans5958/Domino-English-Translation/SiteDeploy.yml?style=flat-square&label=site)](https://github.com/Hans5958/Domino-English-Translation/actions/)
[![Version number](https://img.shields.io/github/v/release/Hans5958/Domino-English-Translation?style=flat-square)](https://github.com/Hans5958/Domino-English-Translation/releases/)
[![Download counter](https://img.shields.io/github/downloads/Hans5958/Domino-English-Translation/total.svg?style=flat-square)](https://github.com/Hans5958/Domino-English-Translation/releases/)
![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)
<!-- [![Discord](https://img.shields.io/discord/139268201803546624.svg?color=7289DA&style=flat-square)](https://discord.gg/s42aft8) -->

Domino is a Japanese MIDI editor used for creating MIDI songs and compositions. This project translates it into English.

Domino is a lightweight, free MIDI editor for Windows, originally written in Japanese. In the Black MIDI community, it is a popular choice alongside FL Studio, though it is widely used for MIDI composition in general. It is so popular among non-Japanese users that it led several people to translate it with resource-editing tools, but many of those translations are now outdated or incomplete.

This repository brings those community translations together, but the combined result is still incomplete and somewhat out of date. The project continues to fill in the gaps with new translations and keep up with new versions of Domino, and contributions are welcome.

## Usage

1. Download either the Domino `.zip` or the `.exe`.  
	- The `.zip` contains everything you need to run Domino. __Download this if you are not sure or this is your first time using this program.__  
	- You can also download the `.exe` if you want to use your configured settings. Place it directly inside your Domino folder, where `Domino.exe` is located.

	| Type | Download |
	| - | - |
	| Stable (Release) | [![Download the latest stable release](https://img.shields.io/github/v/release/Hans5958/Domino-English-Translation?label=download&style=flat-square)](https://github.com/Hans5958/Domino-English-Translation/releases/latest)
	| Nightly (Pre-Release) | [![Download the latest nightly release](https://img.shields.io/github/v/release/Hans5958/Domino-English-Translation?include_prereleases&label=download&style=flat-square)](https://github.com/Hans5958/Domino-English-Translation/releases)

2. Recommended: Download the [dominohook](https://github.com/khang06/dominohook/releases) .dll file and bind it to the executable.
   Read how to bind it [here](https://github.com/khang06/dominohook/blob/master/README.md#usage). In the future, I will find a way so I can distribute it with the hook.

3. Run the executable.
	- If you downloaded the .zip, just run `Domino.exe`.
	- If you downloaded the .exe, after placing it in the directory, run `Domino_Translated.exe` (make sure you rename it so you know which one's the new version!).

4. Optional: Read the manual from https://hans5958.github.io/Domino-English-Translation or the supplied manual.

## Building

### Requirements

- Windows operating system. This is a Windows application.
- Windows Subsystem for Linux (WSL) (tested in Ubuntu 24.04)
- Resource Hacker
- Python 3 (on WSL, tested in Python 3.10)
- 7zip (on WSL)
- jq (on WSL)

```bash
choco install reshack
sudo apt install p7zip-full jq python3.10
```

### Instructions

Just run either `build-*.sh` inside the `_script` folder. The binaries (the `.exe` files) will be compiled and placed inside the `_script/dist` folder.

## Contributing

Contributions are welcome. You can contribute by translating various files. The `.rc` files contain most of the program's strings. There are also `.html` files for the manuals, `.xml` for the modules, and some `.txt` files.

Read [Building](#building) to get the binary files.

For starters, you can make a pull request from your fork, and I'll check and merge it. If you don't know how to do it, make sure to read one of these guides.
- [How to Contribute to Open Source | Open Source Guides](https://opensource.guide/how-to-contribute/#opening-a-pull-request)
- [How to create a pull request in GitHub | Opensource.com](https://opensource.com/article/19/7/create-pull-request-github)
- [Creating a pull request - GitHub Help](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)

TL;DR, here's how.
1. Fork this repository by clicking the "Fork" button above.
2. Make a branch in your fork. (optional)
3. Do your edits there and commit (and push) the changes.
4. Create a pull request by clicking the "New pull request" button.

If you are still confused, or you don't want to tinker with the technicalities, you can [write an issue](https://github.com/Hans5958/Domino-English-Translation/issues) or ask me on Discord (`hans5958`).

You are also welcome to use or fork this project to translate Domino to your own language, as this repository only hosts the English translation.

## Completion Checklist

> [!NOTE]
> This section has been moved to [the wiki](https://github.com/Hans5958/Domino-English-Translation/wiki/Completion-Checklist).

## License

[Domino](https://takabosoft.com/domino) is developed by Tabako Soft and is in no way affiliated with this translation project.

This translation project is licensed under the terms of [MIT license](LICENSE), except contributions made by outside contributors before the licensing (10/09/2022). Permission has been granted for the use of their code on this repository, but not under the license.

Translations are made with reference to previous translations. These are used in good faith, but no permissions have been given by the translators. The list of previously used translations can be viewed [in this page](https://hans5958.github.io/Black-MIDI-Meta/domino-translations/).
