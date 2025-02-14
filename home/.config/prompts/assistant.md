<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Assistant Prompt Library](#assistant-prompt-library)
  - [Create roles](#create-roles)
  - [Add metadata](#add-metadata)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Assistant Prompt Library

Prompt files in `assistant/` are created programmatically from [fabric's patterns](https://github.com/danielmiessler/fabric/tree/main/patterns).

Fabric is a tool created by [Daniel Miessler](https://github.com/danielmiessler) and fabric patterns are authored by [fabric contributors](https://github.com/danielmiessler/fabric/graphs/contributors).

## Create roles

To (re-)create prompt files:

./create_assistant

Pre-commit hooks may trim trailing spaces and empty lines on git commit.

## Add metadata

Metadata is added to describe prompt tool use etc.

./add_metadata assistant/

If file already starts with metadata section, the file is left intact.
