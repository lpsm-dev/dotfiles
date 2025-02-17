<!-- BEGIN_DOCS -->
<div align="center">

<a name="readme-top"></a>

<img src="https://github.com/lpsm-dev/lpsm-dev/blob/9b4c077dbe6d850e40b08e53264d2b9cf76d8368/.github/assets/daft-punk.gif" width="350"/>

</div>

# Sumário

<details>
  <summary><strong>Expandir</strong></summary>

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Processos](#processos)
  - [SSH](#ssh)
  - [Docker](#docker)
- [Ferramentas](#ferramentas)
  - [Latext](#latext)
  - [Nix](#nix)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

</details>

# Processos

## SSH

As chaves SSH estão sendo gerenciadas pelo [Bitwarden](https://bitwarden.com/). Para acessar as chaves, acesse o Bitwarden e procure por `SSH Key` e você encontrará as chaves.

Uma vez encontrado as chaves, para cada uma delas, você deve adicionar a chave pública ao servidor que você deseja acessar:

- gitlab.com
- github.com
- bitbucket.org

> [!NOTE]
> O Bitwarden vai solicitar que você confirme sempre que você acessar uma chave SSH. Isso é uma medida de segurança para garantir que você está ciente de que está acessando uma chave SSH.

## Docker

Abra o aplicativo Docker e termine sua configuração de forma manual.

# Ferramentas

## Browser Extensions

- Wappalyzer

## Helm

```bash
helm plugin install https://github.com/dadav/helm-schema
```

## Latext

```bash
sudo tlmgr install lastpage
sudo tlmgr update --self
```

## Nix

Setup do Nix, uma ferramenta de gerenciamento de pacotes.

Basta seguir o passo a passo do [site oficial](https://nixos.org/download.html).

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- END_DOCS -->
