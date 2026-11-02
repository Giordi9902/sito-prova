#!/usr/bin/env bash
# Git 05 — i branch come puntatori (parte dallo stato finale del 04).
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/04-stato.sh"
cd "$WORK/sito-prova"

cmd git branch
cmd cat .git/HEAD
cmd cat .git/refs/heads/main
cmd git branch galleria
cmd git branch
cmd git log --oneline --decorate -1
cmd cat .git/refs/heads/galleria
cmd git switch galleria
cmd cat .git/HEAD
cmd git branch

quando "2026-10-15T18:00:00+0200"
cat > galleria.html <<'H'
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="utf-8">
  <title>Galleria</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h1>Le mie foto</h1>
</body>
</html>
H
git add galleria.html
cmd git commit -m "'Pagina galleria'"
quando "2026-10-15T18:10:00+0200"
sed -i 's#  <p><a href="contatti.html">Contatti</a></p>#  <p><a href="galleria.html">Galleria</a> · <a href="contatti.html">Contatti</a></p>#' index.html
cmd git commit -am "'Link alla galleria'"
cmd git log --oneline --decorate -4
cmd ls
cmd git switch main
cmd ls
cmd git log --oneline --decorate -1

quando "2026-10-15T18:30:00+0200"
printf '\na {\n  color: darkcyan;\n}\n' >> style.css
cmd git commit -am "'Colore dei link'"
cmd git log --oneline --decorate --graph --all

echo "=== switch con modifiche in sospeso"
sed -i 's#Contatti</a></p>#Scrivimi</a></p>#' index.html
cmd git switch galleria
cmd git restore index.html

echo "=== branch -d / -D"
cmd git switch -c prova
quando "2026-10-15T18:40:00+0200"
echo "/* prova */" >> style.css
git commit -q -am "Esperimento"
cmd git switch main
cmd git branch -d prova
cmd git branch -D prova
cmd git branch -v

echo "=== detached HEAD"
cmd git checkout 0bbb20f
cmd git branch
cmd git switch main
