#!/bin/bash

exec < /dev/tty

echo "Selecione o tipo de commit:"
echo "1. feat: Novo recurso ✨"
echo "2. fix: Correção de bug 🐛"
echo "3. docs: Documentação 📚"
echo "4. test: Testes 🧪"
echo "5. build: Build ➕"
echo "6. perf: Performance ⚡"
echo "7. style: Estilo de código 🎨"
echo "8. refactor: Refatoração ♻️"
echo "9. chore: Tarefas 🔧"
echo "10. ci: Integração contínua 🧱"
echo "11. raw: Dados RAW 🗃️"
echo "12. cleanup: Limpeza de código 🧹"
echo "13. remove: Remoção de arquivos 🗑️"
echo ""

read -p "Digite o número correspondente ao tipo de commit: " commit_type

case $commit_type in
  1)  type="feat";     emoji=":sparkles:";;      # ✨
  2)  type="fix";      emoji=":bug:";;           # 🐛
  3)  type="docs";     emoji=":book:";;          # 📚
  4)  type="test";     emoji=":test_tube:";;     # 🧪
  5)  type="build";    emoji=":heavy_plus_sign:";; # ➕
  6)  type="perf";     emoji=":zap:";;           # ⚡
  7)  type="style";    emoji=":art:";;           # 🎨
  8)  type="refactor"; emoji=":recycle:";;       # ♻️
  9)  type="chore";    emoji=":wrench:";;        # 🔧
  10) type="ci";       emoji=":bricks:";;        # 🧱
  11) type="raw";      emoji=":card_file_box:";; # 🗃️
  12) type="cleanup";  emoji=":broom:";;         # 🧹
  13) type="remove";   emoji=":wastebasket:";;   # 🗑️
  *)  echo "❌ Tipo de commit inválido"; exit 1;;
esac


read -p "Deseja adicionar um escopo (ex: api, ui, db)? (deixe vazio se não): " scope
read -p "Digite a mensagem do commit: " message

if [ -n "$scope" ]; then
  commit_message="$type($scope): $message $emoji"
else
  commit_message="$type: $message $emoji"
fi

echo "$commit_message" > "$1"

echo "✅ Commit formatado: $commit_message"