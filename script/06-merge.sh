#!/usr/bin/env bash
# Git 06 — fast-forward e three-way merge (parte dallo stato finale del 05).
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/05-stato.sh"
cd "$WORK/sito-prova"

echo "=== fast-forward"
cmd git switch -c titolo
quando "2026-10-16T18:00:00+0200"
sed -i 's#<title>Il mio sito</title>#<title>Il sito di Mario</title>#' index.html
cmd git commit -am "'Titolo della pagina più chiaro'"
cmd git switch main
cmd git log --oneline --decorate --graph --all -6
cmd git merge titolo
cmd git log --oneline --decorate -3
cmd git branch -d titolo

echo "=== three-way"
cmd git branch --no-merged
quando "2026-10-16T18:30:00+0200"
cmd git merge --no-edit galleria
cmd git log --oneline --decorate --graph -7
cmd git show --stat HEAD
cmd git log --oneline -1 HEAD^1
cmd git log --oneline -1 HEAD^2
cmd git branch --merged
cmd git branch -d galleria
cmd git status
cmd grep -n "title\|href" index.html

echo "=== già aggiornato"
cmd git merge main
