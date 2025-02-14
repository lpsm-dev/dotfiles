#!/usr/bin/env bash

set -e  # Para interromper a execução em caso de erro

# Verifica se o diretório de destino foi informado
if [ -z "$1" ]; then
  echo "Uso: $0 <diretorio_destino>"
  exit 1
fi

TARGET_DIR="$1"

# Obtém o diretório do script atual
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
FABRIC_DIR="$SCRIPT_DIR/fabric"

# Clona ou atualiza o repositório do Fabric
if [ -d "$FABRIC_DIR/.git" ]; then
  git -C "$FABRIC_DIR" pull --no-autostash --rebase
else
  git clone --depth 1 https://github.com/danielmiessler/fabric.git "$FABRIC_DIR"
fi

# Garante que o diretório de destino exista
mkdir -p "$TARGET_DIR"

# Encontra e processa os arquivos system.md dentro de fabric/patterns
find "$FABRIC_DIR/patterns" -name system.md -print0 | while IFS= read -r -d '' pattern_file; do
  PATTERN_DIR=$(dirname "$pattern_file")
  PATTERN_NAME=$(basename "$PATTERN_DIR")
  OUTPUT_FILE="$TARGET_DIR/${PATTERN_NAME}.md"

  # Copia o arquivo para o diretório de destino
  cp "$pattern_file" "$OUTPUT_FILE"

  # Remove linhas em branco no final do arquivo
  sed -i '' -e :a -e '/^\n*$/{$d;N;ba' -e '}' "$OUTPUT_FILE" 2>/dev/null || sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' "$OUTPUT_FILE"

  # Converte CRLF para LF
  sed -i '' 's/\r$//' "$OUTPUT_FILE" 2>/dev/null || sed -i 's/\r$//' "$OUTPUT_FILE"

  # Remove espaços em branco no final das linhas
  sed -i '' 's/[[:space:]]\+$//' "$OUTPUT_FILE" 2>/dev/null || sed -i 's/[[:space:]]\+$//' "$OUTPUT_FILE"

  echo "Criado: $OUTPUT_FILE"
done

echo "Processamento concluído."
