#!/usr/bin/env zsh

#
# ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
# ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
# █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
# ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
# ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
# ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
#

_aichat_setup_functions() {
  git clone "$FUNCTIONS_REPO_URL" "$AICHAT_FUNCTIONS_DIR" &&
    (cd "$AICHAT_FUNCTIONS_DIR" >/dev/null && argc build)
}

_aichat_build_agents() {
  local agent="$1"
  local context="$2"
  [ ! -d "$AICHAT_FUNCTIONS_DIR" ] && _aichat_setup_functions
  (
    cd "$AICHAT_FUNCTIONS_DIR" >/dev/null 2>&1 &&
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      if [ -n "$(git status --porcelain)" ]; then
        if [ -n "$agent" ]; then
          argc build@agent "$agent"
          if [ -n "$context" ]; then
            ctx_path="$AICHAT_CONFIG_DIR/agents/$agent/sessions/$context.yaml"
            [ -e "$ctx_path" ] && mv -fv "$ctx_path" "$ctx_path.old"
          fi
        else
          argc build@agent
        fi
      fi
    fi
  )
}

_aichat_build_tools() {
  [ ! -d "$AICHAT_FUNCTIONS_DIR" ] && _aichat_setup_functions
  (
    cd "$AICHAT_FUNCTIONS_DIR" >/dev/null 2>&1 &&
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      if [ -n "$(git status --porcelain)" ]; then
        argc build@tool
      fi
    fi
  )
}

ai() {
  local role="$1"
  local category="general"
  local context="${PWD##*/}"
  _aichat_build_tools

  if [ -z "$role" ]; then
    role="chat"
  else
    if AICHAT_ROLES_DIR="$HOME/.config/prompts/developer" aichat --list-roles | grep -Fx -q "$role"; then
      category="developer"
    elif AICHAT_ROLES_DIR="$HOME/.config/prompts/assistant" aichat --list-roles | grep -Fx -q "$role"; then
      category="assistant"
    else
      role="chat#$role"
    fi
    shift
  fi

  echo "[ai] using $category prompts"
  AICHAT_ROLES_DIR="$HOME/.config/prompts/$category" \
    aichat --role "$role" --session "$role@$context" "$@"
}

ai_assistant() {
  local agent="assistant"
  local context="${PWD##*/}"
  _aichat_build_agents "$agent" "$context"
  aichat --agent "$agent" --session "$context" --save-session "$@"
}

ai_up() {
  aichat --sync-models
}
