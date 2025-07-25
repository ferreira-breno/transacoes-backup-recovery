#!/bin/bash

# Script para backup e restauração do banco de dados e_commerce

# Realiza backup completo (dados, rotinas, triggers e eventos)
backup() {
  echo "Iniciando backup do banco e_commerce..."
  mysqldump -u $USER -p --routines --events --triggers e_commerce > backup_e_commerce.sql
  echo "Backup concluído e salvo em backup_e_commerce.sql"
}

# Restaura banco a partir do arquivo backup
restore() {
  echo "Iniciando restauração do banco e_commerce..."
  mysql -u $USER -p e_commerce < backup_e_commerce.sql
  echo "Restauração concluída."
}

# Menu simples
echo "Escolha a operação:"
echo "1 - Backup"
echo "2 - Restore"
read -p "Opção: " opt

case $opt in
  1) backup ;;
  2) restore ;;
  *) echo "Opção inválida"; exit 1 ;;
esac
