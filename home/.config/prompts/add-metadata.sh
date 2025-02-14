#!/usr/bin/env bash

set -e  # Para interromper a execução em caso de erro

# Verifica se o caminho foi fornecido
if [[ -z "$1" ]]; then
  echo "Uso: $0 <caminho_para_prompts>"
  exit 1
fi

SEARCH_PATH="$1"

# Percorre todos os arquivos .md dentro do diretório especificado
find "$SEARCH_PATH" -name "*.md" -print0 | while IFS= read -r -d '' file; do
  # Obtém a primeira linha não vazia, removendo espaços à esquerda
  first_non_empty_line=$(sed 's/^[[:space:]]*//; /^$/d; q' "$file")

  # Adiciona metadados apenas se a primeira linha não for "---"
  if [[ "$first_non_empty_line" != "---" ]]; then
    echo "Adicionando metadados a: $file"
    {
      echo "---"
      echo "use_tools: all"
      echo "---"
      cat "$file"
    } > "$file.tmp" && mv "$file.tmp" "$file"
  fi
done

echo "Processamento concluído."
