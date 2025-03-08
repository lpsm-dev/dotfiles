<!-- BEGIN_DOCS -->

[◀ Voltar](README.md)

<div align="center">

<a name="readme-top"></a>

Hello Human 👽! Welcome to my repository 👋

<img src="https://github.com/lpsm-dev/lpsm-dev/blob/63ad476e77006a2924e16622bd005f4784ab9fb4/.github/assets/dotfiles-new.png" width="350"/>

Here you'll find **my personal configurations** for **setting up my development environment**. Feel free to explore, collaborate, and share 🚀

[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](https://www.conventionalcommits.org/en/v1.0.0/)
[![Semantic Release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://semantic-release.gitbook.io/semantic-release/usage/configuration)
[![Built with Devbox](https://jetpack.io/img/devbox/shield_galaxy.svg)](https://jetpack.io/devbox/docs/contributor-quickstart/)

📌 Star this repository to follow updates and news ( ≖‿ ≖ )

</div>

> [!NOTE]
>
> **WARNING**: This repository is constantly evolving. If you find any issues or have suggestions, please open an [issue](https://github.com/lpsm-dev/dotfiles/issues/new/choose) or submit a [pull request](https://github.com/lpsm-dev/dotfiles/pulls).

# Table of Contents

<details>
  <summary><strong>Expand</strong></summary>

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Disclaimer](#disclaimer)
- [Overview](#overview)
- [Features](#features)
- [Implementation](#implementation)
- [References](#references)
- [Contribution](#contribution)
- [Versioning](#versioning)
- [Troubleshooting](#troubleshooting)
- [Show your support](#show-your-support)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

</details>

# Disclaimer

> [!CAUTION]
> If you want to try these dotfiles, you should first fork this repository, review the code, and remove what you don't need. Do not blindly use my configurations unless you understand the implications. Use at your own risk!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Overview

## Objective

The goal of this repository is to share and document my personal configurations for setting up my development environment, including dotfiles, scripts, and automation tools used to install and configure necessary dependencies and tools for my daily workflow.

- **Automate development environment setup**: Use scripts and automation tools to install and configure dependencies and tools required for software development.
- **Version and sync dotfiles**: Use a version control system (Git) to version and sync configuration files across different machines and operating systems.
- **Document and share configurations**: Use a README.md to document and share configurations and best practices adopted in the development environment.
- **Facilitate collaboration and learning**: Share dotfiles with others to collaborate and learn with the community, while promoting useful practices and configurations.

Key benefits of using dotfiles include:

- **Customization and Control**: Dotfiles allow you to personalize and control your workspace, ensuring it meets your individual needs and preferences, regardless of the OS or machine you use.
- **Portability and Backup**: Keeping dotfiles versioned in a Git repository simplifies portability and backup, enabling easy synchronization across machines and OSes.
- **Collaboration and Sharing**: Sharing your dotfiles fosters collaboration and knowledge exchange within the community, spreading useful practices and configurations.

## Context and Motivation

When switching machines or operating systems, reconfiguring your workspace can be tedious. The concept of **dotfiles**—user-defined configuration files that store preferences for programs like shells, text editors, and package managers—helps address this.

The challenge that motivated this repository was: "How can I manage and automate the lifecycle of these configuration files, ensuring easy synchronization across machines, versioning, and adaptability to different operating systems?"

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Features

- Symlink dotfiles from this repository to your home directory
- Install apps, fonts, and tools using Homebrew, uv, and the Mac App Store
- Set up straightforward Python configuration using uv
- Set up macOS Dock with most used apps

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Implementation

## Prerequisites

- Internet connection.
- Open `System Preferences` and log into iCloud (which will sign you into the App Store for `mas` to work).
- Open `Terminal.app` to run the installation script.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Installation

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/lpsm-dev/dotfiles/main/bootstrap.sh)
```

or

```bash
gh api repos/lpsm-dev/dotfiles/contents/bootstrap.sh | jq -r '.content' | base64 --decode > /tmp/bootstrap-dotfiles.sh && chmod +x /tmp/bootstrap-dotfiles.sh && bash /tmp/bootstrap-dotfiles.sh
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# References

Relevant links for this documentation:

**Articles**

- [Awesome MacOs Command Line](https://git.herrbischoff.com/awesome-macos-command-line/about/)
- [MacOs Security-Privacy](https://github.com/drduh/macOS-Security-and-Privacy-Guide)
- [MacOs Hardening](https://www.bejarano.io/hardening-macos/)

**Forums**:

- https://apple.stackexchange.com/questions/376916/cannot-ls-trash-in-the-terminal-in-catalina-operation-not-permitted
- https://superuser.com/questions/89556/how-to-disable-creating-spotlight-v100-and-trash-folders-on-external-drive

**Tools**:

- https://starship.rs/
- https://zed.dev/
- https://www.chezmoi.io/

**URLs**:

- https://dotfiles.io/aliases/
- https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Contribution

Want to contribute? That's great! We have a contribution guide to help you. Click [here](CONTRIBUTING.md) to read it.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Versioning

To view the change history, check the [**CHANGELOG.md**](CHANGELOG.md) file.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Troubleshooting

If you encounter any issues, open an [issue](https://github.com/lpsm-dev/dotfiles/issues/new/choose) in this project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Show your support

<div align="center">

Give a ⭐️ to this project if it helped you!

<img src="https://github.com/lpsm-dev/lpsm-dev/blob/0062b174ec9877e6dfc78817f314b4a0690f63ff/.github/assets/yoda.gif" width="225"/>

<br>
<br>

Made with 💜 by the **DevOps Team** :wave: inspired by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)

</div>

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- END_DOCS -->
```
