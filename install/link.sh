#!/bin/bash
TFILES=$HOME/dotfiles


echo "\n\ninstalling to ~/.config"
echo "======================="
if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi

# Ruta del directorio .config relativo al home del usuario
CONFIG_DIR=".config"

# Obtiene la ruta completa del directorio .config
CONFIG_PATH=$TFILES/$CONFIG_DIR

# Función recursiva para crear symlinks
function symlink_files {
  # Itera sobre cada archivo o carpeta en el directorio dado
  for file in "$1"/*; do
    # Obtiene el nombre del archivo o carpeta
    filename=$(basename "$file")
    # Si es un directorio, crea el directorio en el mismo árbol de directorios en el home
    if [[ -d "$file" ]]; then
      mkdir -p "$HOME/.config/${file#$CONFIG_PATH}/"
      # Llama a la función recursivamente para crear symlinks dentro del directorio
      symlink_files "$file"
    # Si es un archivo, crea el symlink en la misma ruta relativa dentro del home
    elif [[ -f "$file" ]]; then
      ln -sf "$file" "$HOME/.config/${file#$CONFIG_PATH}"
    fi
  done
}

# Llama a la función recursiva con el directorio .config como argumento
symlink_files "$CONFIG_PATH"