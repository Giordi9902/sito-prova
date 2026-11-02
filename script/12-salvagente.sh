#!/usr/bin/env bash
# Git 12 — stash, tag, reflog (parte dallo stato finale dell'11).
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/11-stato.sh"
cd "$WORK/sito-prova"

echo "=== stash"
cmd git switch -c novita
sed -i 's#  <p>Qui racconto i miei esperimenti con il codice.</p>#&\n  <h2>Novità</h2>\n  <ul>\n    <li>La galleria è online</li>#' index.html
echo "Bozza: elenco delle novità" > novita.txt
cmd git status -s
cmd git stash
cmd git status -s
cmd git stash list
cmd git switch main
quando "2026-10-22T18:00:00+0200"
sed -i 's#<h2>Ho imparato Git</h2>#<h2>Sto imparando Git</h2>#' blog.html
cmd git commit -am "'Titolo del post più onesto'"
cmd git switch novita
cmd git stash pop
cmd git status -s
echo "--- stash -u"
cmd git stash push -u -m "'Sezione novità a metà'"
cmd git status -s
cmd git stash list
cmd git stash show -p --include-untracked "'stash@{0}'"
cmd git stash pop
cmd git status -s
git stash -q -u
git switch -q main
git branch -q -D novita
git stash drop -q

echo "=== tag"
cmd git tag v1.0
cmd git tag
cmd git show v1.0 --stat --oneline
cmd git tag -d v1.0
quando "2026-10-22T18:30:00+0200"
cmd git tag -a v1.0 -m "'Prima versione del sito'"
cmd git show v1.0 --stat
cmd git tag -a v0.1 3594745 -m "'La prima pagina'"
cmd git tag -l "'v*'"
cmd git log --oneline --decorate -3
cmd git push --progress origin main
cmd git push origin v1.0
cmd git push origin --tags

echo "=== reflog"
quando "2026-10-22T19:00:00+0200"
printf '<!DOCTYPE html>\n<html lang="it">\n<head>\n  <meta charset="utf-8">\n  <title>Eventi</title>\n</head>\n<body>\n  <h1>Eventi</h1>\n</body>\n</html>\n' > eventi.html
git add eventi.html
cmd git commit -m "'Pagina eventi'"
cmd git reset --hard HEAD~1
cmd git log --oneline -2
cmd git reflog -5
cmd git show --stat --oneline "'HEAD@{1}'"
cmd git reset --hard "'HEAD@{1}'"
cmd git log --oneline -2
echo "--- branch cancellato"
cmd git switch -c prova-colori
quando "2026-10-22T19:30:00+0200"
sed -i 's#  color: teal;#  color: purple;#' style.css
cmd git commit -am "'Titolo viola'"
cmd git switch main
cmd git branch -D prova-colori
cmd git reflog -3
cmd git branch prova-colori 'HEAD@{1}'
cmd git log --oneline -1 prova-colori
cmd git branch -D prova-colori
