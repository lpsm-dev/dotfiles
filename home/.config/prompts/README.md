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

- [Prompts](#prompts)
  - [Assistant](#assistant)
  - [Developer](#developer)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

</details>

# Prompts

## Assistant

Prompt files in assistant/ are created programmatically from fabric's patterns.

Fabric is a tool created by Daniel Miessler and fabric patterns are authored by fabric contributors.

**Create roles**

To (re-)create prompt files:

```bash
bash create_assistant.sh assistant
```

Pre-commit hooks may trim trailing spaces and empty lines on git commit.

**Add metadata**

Metadata is added to describe prompt tool use etc.

```bash
bash add_metadata.sh assistant
```

If file already starts with metadata section, the file is left intact.

## Developer

Prompt files in developer/ are originally forked from codebase-digest's prompt library.

The codebase-digest and its prompts are created by Kamil Stanuch.

```bash
pip install codebase-digest
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- END_DOCS -->
