#!/usr/bin/env bash
# Git 04 — restore, amend, reset, revert (parte dallo stato finale del 03).
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/03-stato.sh"
cd "$WORK/sito-prova"

echo "=== 1. buttare una modifica: restore"
sed -i '/<p>Qui racconto/d' index.html
cmd git status -s
cmd git restore index.html
cmd git status -s

echo "=== 2. togliere dalla staging area"
echo "p { line-height: 1.6; }" >> style.css
git add style.css
cmd git status -s
cmd git restore --staged style.css
cmd git status -s
cmd git restore style.css
cmd git status -s

echo "=== 3. amend del messaggio"
quando "2026-10-14T18:00:00+0200"
cat > contatti.html <<'H'
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="utf-8">
  <title>Contatti</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h1>Contatti</h1>
  <p>Scrivimi a mario.rossi@example.com</p>
</body>
</html>
H
git add contatti.html
cmd git commit -m "'Aggiutna pagina contatti'"
quando "2026-10-14T18:02:00+0200"
cmd git commit --amend -m "'Aggiunta pagina contatti'"
cmd git log --oneline -2

echo "=== 4. amend con un file dimenticato"
sed -i 's#  <p>Qui racconto i miei esperimenti con il codice.</p>#&\n  <p><a href="contatti.html">Contatti</a></p>#' index.html
git add index.html
quando "2026-10-14T18:05:00+0200"
cmd git commit --amend --no-edit
cmd git show --stat --oneline HEAD

echo "=== 5. reset: soft, mixed, hard"
quando "2026-10-14T18:30:00+0200"
sed -i 's#  margin: 2rem;#&\n  background: lightyellow;#' style.css
git add style.css
cmd git commit -m "'Sfondo giallo'"
cmd git log --oneline -3
cmd git reset --soft HEAD~1
cmd git status -s
cmd git log --oneline -2
cmd git reset
cmd git status -s
cmd git reset --hard
cmd git status -s
cmd git log --oneline -3

echo "=== 6. revert"
quando "2026-10-14T19:00:00+0200"
sed -i 's#  color: navy;#&\n  font-size: 3rem;#' style.css
git commit -q -am "Titolo più grande"
cmd git log --oneline -2
quando "2026-10-14T19:10:00+0200"
cmd git revert --no-edit HEAD
cmd git log --oneline -3
cmd git show --stat HEAD

echo "=== 7. una versione vecchia di un file"
cmd git restore --source=HEAD~5 style.css
cmd git diff --stat
cmd git restore style.css
cmd git status -s
cmd git log --oneline
