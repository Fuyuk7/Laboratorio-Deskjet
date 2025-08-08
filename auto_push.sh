#!/bin/bash

echo "Monitorando alterações e atualizando GitHub Pages..."

while true; do
  # Aguarda até detectar mudança em qualquer arquivo dentro da pasta atual e subpastas
  inotifywait -e modify,create,delete -r .

  # Adiciona todas as mudanças
  git add .

  # Commit com mensagem padrão (data e hora)
  git commit -m "Atualização automática em $(date +"%Y-%m-%d %H:%M:%S")"

  # Envia para o GitHub
  git push origin main

  echo "Atualizações enviadas! Continuando monitoramento..."
done
