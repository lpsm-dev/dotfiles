<!-- BEGIN_DOCS -->
<div align="center">

<a name="readme-top"></a>

<img src="https://github.com/lpsm-dev/lpsm-dev/blob/894a1209815a95f8a0e6e6adc4f4739b02555b57/.github/assets/dotfiles.png" width="350"/>

[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](https://www.conventionalcommits.org/en/v1.0.0/)
[![Semantic Release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://semantic-release.gitbook.io/semantic-release/usage/configuration)
[![Built with Devbox](https://jetpack.io/img/devbox/shield_galaxy.svg)](https://jetpack.io/devbox/docs/contributor-quickstart/)

Hello Human 👽!

Bem-vindo ao meu repositório de dotfiles 👋.

Aqui você encontrará as minhas configurações pessoais para o ambiente de desenvolvimento, incluindo o shell (Zsh), editor de texto (Neovim), gerenciador de pacotes (Homebrew), entre outros. Sinta-se à vontade para explorar, colaborar e compartilhar suas próprias configurações. Que a força esteja com você! 🚀

</div>

# Sumário

- [Disclaimer](#disclaimer)
- [Motivação](#motivação)
- [Objetivo](#objetivo)
- [Benefícios](#benefícios)
- [Requisitos](#requisitos)
- [Instalação](#instalação)
- [Ferramentas](#ferramentas)
- [Processos](#processos)
- [Referências](#referências)
- [Versionamento](#versionamento)
- [Troubleshooting](#troubleshooting)
- [Show your support](#show-your-support)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Disclaimer

> [!CAUTION]
> Se quiser experimentar esses dotfiles, você deve primeiro fazer um fork deste repositório, rever o código e remover o que não quer. Não use cegamente minhas configurações a menos que saiba o que isso implica. Use por sua própria conta e risco!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Motivação

Por vezes, ao trocar de máquina ou sistema operacional, é necessário configurar novamente o seu ambiente de trabalho. Para facilitar esse processo, é possível utilizar a ideia de **dotfiles**, que são arquivos de configuração definidos pelo usuário do computador com o objetivo de armazenaf as preferências e configurações de diversos programas e ferramentas, como: shell, editor de texto, gerenciador de pacotes e entre outras.

Com esse ideia introduzida, a parte complicada e que me motivou a criar esse repositório é: "como eu posso resolver o problema de gerenciamento e automação do ciclo de vida desses arquivos de configuração, garantindo que eles sejam facilmente sincronizados entre diferentes máquinas, além de serem versionados e adaptos para outros sistemas operacionais?".

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Objetivo

Esse repositório contém os meus dotfiles pessoais, que são usados para configurar o meu ambiente de desenvolvimento em diferentes máquinas e sistemas operacionais, como macOS, Linux e Windows. Os dotfiles incluem configurações para o shell (Zsh), editor de texto (Neovim), gerenciador de pacotes (Homebrew), entre outros, e são organizados de acordo com a stack de tecnologias que eu uso no meu dia a dia.

- **Automatizar a configuração do ambiente de desenvolvimento**: Utilizando scripts e ferramentas de automação para instalar e configurar as dependências e ferramentas necessárias para o desenvolvimento de software.
- **Versionar e sincronizar os dotfiles**: Utilizando um sistema de controle de versão (Git) para versionar e sincronizar os arquivos de configuração entre diferentes máquinas e sistemas operacionais.
- **Documentar e compartilhar as configurações**: Utilizando um README.md para documentar e compartilhar as configurações e boas práticas adotadas no ambiente de desenvolvimento.
- **Facilitar a colaboração e o aprendizado**: Compartilhando os dotfiles com outras pessoas para colaborar e aprender com a comunidade, além de ajudar a disseminar boas práticas e configurações úteis.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Benefícios

Entre os principais benefícios de usar dotfiles, podemos destacar:

- **Personalização e Controle**: Os dotfiles permitem que você personalize e controle seu ambiente de trabalho, garantindo que ele atenda às suas necessidades e preferências individuais, independentemente do sistema operacional ou máquina que você esteja usando.
- **Portabilidade e Backup**: Manter os dotfiles versionados em um repositório Git facilita a portabilidade e o backup de suas configurações, permitindo que você as sincronize facilmente entre diferentes máquinas e sistemas operacionais.
- **Colaboração e Compartilhamento**: Compartilhar seus dotfiles com outras pessoas permite que você colabore e aprenda com a comunidade, além de ajudar a disseminar boas práticas e configurações úteis.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Requisitos

- Conectar-se à Internet.
- Abrir o `System Preferences` e logar no iCloud (que fará com que você entre na App Stor para o `mas` dar certo).
- Abrir o `Terminal.app` para rodar o script de instalação.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Instalação

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/lpsm-dev/dotfiles/main/bootstrap.sh)
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Ferramentas

## Productivity

- Brave
- Bitwarden
- DuckDuckGo
- SimpleLogin

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Processos

## Brave

- Bitwarden Password Manager
- JSON Formatter
- MalwareBytes
- Obsidian Web Clipper

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Features

- Symlink dotfiles from this repository to your home directory
- Install apps, fonts, and tools using Homebrew, uv, and the Mac App Store
- Set up straightforward Python configuration using uv
- Set up macOS Dock with most used apps

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Referências

Links relevantes para essa documentação:

**Artigos**

- [Awesome MacOs Command Line](https://git.herrbischoff.com/awesome-macos-command-line/about/)
- [MacOs Security-Privacy](https://github.com/drduh/macOS-Security-and-Privacy-Guide)
- [MacOs Hardening](https://www.bejarano.io/hardening-macos/)

**Fóruns**:

- https://apple.stackexchange.com/questions/376916/cannot-ls-trash-in-the-terminal-in-catalina-operation-not-permitted
- https://superuser.com/questions/89556/how-to-disable-creating-spotlight-v100-and-trash-folders-on-external-drive

**Ferramentas**:

- https://starship.rs/
- https://zed.dev/
- https://www.chezmoi.io/

**Urls**:

- https://dotfiles.io/aliases/
- https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Versionamento

Para verificar o histórico de mudanças, acesse o arquivo [**CHANGELOG.md**](CHANGELOG.md).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Troubleshooting

Se você tiver algum problema, abra uma [issue](https://github.com/lpsm-dev/dotfiles/issues/new/choose) nesse projeto.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Show your support

<div align="center">

Dê uma ⭐️ para este projeto se ele te ajudou!

<img src="https://github.com/lpsm-dev/lpsm-dev/blob/0062b174ec9877e6dfc78817f314b4a0690f63ff/.github/assets/yoda.gif" width="225"/>

<br>
<br>

Feito com 💜 pelo **Time de DevOps** :wave: inspirado no [readme-md-generator](https://github.com/kefranabg/readme-md-generator)

</div>

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- END_DOCS -->
