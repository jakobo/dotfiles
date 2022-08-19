# Dotfiles (custom)

- Uses `zsh` + `oh-my-posh` for the default shell
- Installs a ton of stuff you always install anyway
- Adds features for working in WSL/WSL2 under Windows
- Sets a bunch of normal defaults for today's code workflows where we get nice things like GUIs
- Based on the battle tested dotfiles scripts of ["Cowboy" Ben Alman](https://github.com/cowboy/dotfiles) with a few years of divergent evolution

# How the "dotfiles" command works

When [dotfiles][dotfiles] is run for the first time, it does a few things:

1. In Ubuntu, Git is installed if necessary via APT (it's already there in OSX).
2. This repo is cloned into your user directory, under `~/.dotfiles`.
3. Files in `/copy` are copied into `~/`. ([read more](#the-copy-step))
4. Files in `/link` are symlinked into `~/`. ([read more](#the-link-step))
5. You are prompted to choose scripts in `/init` to be executed. The installer attempts to only select relevant scripts, based on the detected OS and the script filename. Your chosen init scripts are executed (in alphanumeric order, hence the funky names). ([read more](#the-init-step))

On subsequent runs, step 1 is skipped, step 2 just updates the already-existing repo, and step 5 remembers what you selected the last time. The other steps are the same.

## Other subdirectories

- The `/backups` directory gets created when necessary. Any files in `~/` that would have been overwritten by files in `/copy` or `/link` get backed up there.
- The `/bin` directory contains executable shell scripts (including the [dotfiles][dotfiles] script) and symlinks to executable shell scripts. This directory is added to the path.
- The `/caches` directory contains cached files, used by some scripts or functions.
- The `/config` directory just exists. If a config file doesn't **need** to go in `~/`, reference it from the `/config` directory instead and save some linking headaches.
- The `/source` directory contains files that are sourced whenever a new shell is opened (in alphanumeric order, hence the funky names).
- The `/test` directory contains unit tests for especially complicated bash functions.
- The `/vendor` directory contains third-party libraries.

## The "copy" step

Any file or directory in the `/copy` subdirectory will be copied into `~/`. Any file that _needs_ to be modified with personal information (like [copy/.gitconfig](copy/.gitconfig) which contains an email address and private key) should be _copied_ into `~/`. Because the file you'll be editing is no longer in `~/.dotfiles`, it's less likely to be accidentally committed into your public dotfiles repo.

## The "link" step

Any file or directory in the `/link` subdirectory gets symlinked into `~/` with `ln -s`. Edit one or the other, and you change the file in both places. Don't link files containing sensitive data, or you might accidentally commit that data! If you're linking a directory that might contain sensitive data (like `~/.ssh`) add the sensitive files to your [.gitignore](.gitignore) file!

There is a dedicated `.gitignore` for the `.config` directory that ignores almost everything by default, as most tools put their config into `~/.config/<app>/*`.

## The "init" step

Scripts in the `/init` subdirectory will be executed. A whole bunch of things will be installed, but _only_ if they aren't already.

# Installation

There's a lot of stuff that requires admin access via `sudo`, so be warned that you might need to enter your password here or there.

## Ubuntu

```sh
bash -c "$(wget -qO- https://raw.github.com/jakobo/dotfiles/main/bin/dotfiles)" && source ~/.bashrc
```

The Ubuntu setup works in WSL in addition to traditional Ubuntu-land. Either way, you should at least update/upgrade APT with `sudo apt-get -qq update && sudo apt-get -qq dist-upgrade` first.

_Tested in Ubuntu 14.04 LTS_

## macOS

```sh
bash -c "$(curl -fsSL https://raw.github.com/jakobo/dotfiles/main/bin/dotfiles)" && source ~/.bashrc
```

You need to have [XCode](https://developer.apple.com/downloads/index.action?=xcode) or, at the very minimum, the [XCode Command Line Tools](https://developer.apple.com/downloads/index.action?=command%20line%20tools), which are available as a much smaller download.

The easiest way to install the XCode Command Line Tools in OSX 10.9+ is to open up a terminal, type `xcode-select --install` and [follow the prompts](http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/).

_Tested in OSX 10.15_

# Aliases and Functions

To keep things easy, the `~/.zshrc` file is extremely simple, and should never need to be modified. Instead, add your aliases, functions, settings, etc into one of the files in the `source` subdirectory, or add a new file. They're all automatically sourced when a new shell is opened. Take a look, I have [a lot of aliases and functions](source).

# Scripts

In addition to the aforementioned [dotfiles][dotfiles] script, there are a few other [bin scripts](bin).

- [dotfiles][dotfiles] - (re)initialize dotfiles. It might ask for your password (for `sudo`).
- [src](link/.zshrc) - (re)source all files in `/source` directory
- Look through the [bin](bin) subdirectory for a few more.
