<!-- BEGIN_DOCS -->
<div align="center">

[🇺🇸 English Version](README_en.md)

<a name="readme-top"></a>

Hello Human 👽! Bem-vindo ao meu repositório 👋

<img src="https://github.com/lpsm-dev/lpsm-dev/blob/63ad476e77006a2924e16622bd005f4784ab9fb4/.github/assets/dotfiles-new.png" width="350"/>

Aqui você vai encontrar tudo o que precisa para entender como eu configuro **meu ambiente de desenvolvimento**. Sinta-se à vontade para explorar,
contribuir e compartilhar suas ideias 🚀

[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](https://www.conventionalcommits.org/en/v1.0.0/)
[![Semantic Release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://semantic-release.gitbook.io/semantic-release/usage/configuration)
[![Built with Devbox](https://jetpack.io/img/devbox/shield_galaxy.svg)](https://jetpack.io/devbox/docs/contributor-quickstart/)

📌 Curta esse repositório para acompanhar atualizações e novidades ( ≖‿ ≖ )

</div>

> [!NOTE]
>
> **AVISO**: Esse repositório está em constante evolução. Se você encontrar algum erro ou tiver sugestões, por favor, abra uma [issue](https://github.com/lpsm-dev/dotfiles/issues/new/choose) ou envie um [pull request](https://github.com/lpsm-dev/dotfiles/pulls).

# Sumário

<details>
  <summary><strong>Expandir</strong></summary>

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Disclaimer](#disclaimer)
- [Visão Geral](#vis%C3%A3o-geral)
  - [Objetivo](#objetivo)
  - [Contexto e Motivação](#contexto-e-motiva%C3%A7%C3%A3o)
- [Benefícios](#benef%C3%ADcios)
- [Features](#features)
- [Implementação](#implementa%C3%A7%C3%A3o)
  - [Pré-requisitos](#pr%C3%A9-requisitos)
  - [Instalação](#instala%C3%A7%C3%A3o)
- [Referências](#refer%C3%AAncias)
- [Contribuição](#contribui%C3%A7%C3%A3o)
- [Versionamento](#versionamento)
- [Troubleshooting](#troubleshooting)
- [Show your support](#show-your-support)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

</details>

# Disclaimer

> [!CAUTION]
> Caso queira experimentar esses dotfiles, primeiro faça um fork desse repositório, reveja o código e remova o que entender não necessário.
> Não use cegamente minhas configurações, a menos que saiba o que isso implica.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Visão Geral

## Objetivo

Meu objetivo com esse repositório é compartilhar e documentar minhas configurações pessoais para o setup do meu ambiente de desenvolvimento com as ferramentas necessárias para o meu fluxo de trabalho no dia a dia.

## Contexto e Motivação

Quem atua na área de tecnologia sabe como é uma merda configurar um novo ambiente de trabalho com todas as configurações que você precisa para um fluxo de trabalho descente. A instalação de todas as ferramentas, scripts e configurações geralmente é um processo longo, chato e frustrante ☠️. É aí que entram os **dotfiles**! Dotfiles são arquivos de configuração especiais criados pelos usuários para salvar suas preferências e configurações de vários programas e ferramentas, como o shell, editores de texto ou gerenciadores de pacotes.

Isso traz à tona o desafio que me inspirou a criar esse repositório: _Como posso facilitar o gerenciamento e a automação desses arquivos de configuração, garantindo que eles possam ser sincronizados em diferentes computadores,
controlados por versão e compatíveis com vários sistemas operacionais?_

Sendo assim, sejam muito bem-vindos a este repositório 🚀

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Metas

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

# Features

- Symlink dotfiles from this repository to your home directory
- Install apps, fonts, and tools using Homebrew, uv, and the Mac App Store
- Set up straightforward Python configuration using uv
- Set up macOS Dock with most used apps

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Implementação

## Pré-requisitos

- Conectar-se à Internet.
- Abrir o `System Preferences` e logar no iCloud (que fará com que você entre na App Stor para o `mas` dar certo).
- Abrir o `Terminal.app` para rodar o script de instalação.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Instalação

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/lpsm-dev/dotfiles/main/bootstrap.sh)
```

ou

```bash
gh api repos/lpsm-dev/dotfiles/contents/bootstrap.sh | jq -r '.content' | base64 --decode > /tmp/bootstrap-dotfiles.sh && chmod +x /tmp/bootstrap-dotfiles.sh && bash /tmp/bootstrap-dotfiles.sh
```

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

# Contribuição

Gostaria de contribuir? Isso é ótimo! Temos um guia de contribuição para te ajudar. Clique [aqui](CONTRIBUTING.md) para lê-lo.

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
