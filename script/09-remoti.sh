#!/usr/bin/env bash
# Git 09 — remoti: push, clone, fetch, pull (parte dallo stato finale del 08).
# Il "server" è un repository bare in $WORK/server: i comandi sono gli stessi che con GitHub.
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/08-stato.sh"
SERVER="$WORK/server/sito-prova.git"
rm -rf "$WORK/server" "$WORK/luca"; mkdir -p "$WORK/server" "$WORK/luca"
luca () { ( cd "$WORK/luca/sito-prova" && GIT_AUTHOR_NAME="Luca Bianchi" GIT_AUTHOR_EMAIL="luca.bianchi@example.com" \
  GIT_COMMITTER_NAME="Luca Bianchi" GIT_COMMITTER_EMAIL="luca.bianchi@example.com" eval "$@" ); }

echo "=== il server"
cmd git init --bare "$SERVER"

echo "=== mario pubblica"
cd "$WORK/sito-prova"
cmd git remote add origin "$SERVER"
cmd git remote -v
cmd git push --progress -u origin main
cmd git branch -vv
cmd git status

echo "=== luca clona"
cd "$WORK/luca"
cmd git clone --progress "$SERVER"
cd sito-prova
cmd git log --oneline -3
cmd git branch -a
quando "2026-10-19T18:00:00+0200"
luca "sed -i 's#  <p>Per lavoro: mario.rossi@example.com</p>#&\n  <p>Telefono: 000 000 0000</p>#' contatti.html"
luca "git commit -q -am 'Telefono nella pagina contatti'"
cmd git log --oneline -1 --format="'%h %an: %s'"
cmd git push --progress

echo "=== mario si aggiorna"
cd "$WORK/sito-prova"
cmd git status
cmd git fetch --progress
cmd git status
cmd git log --oneline main..origin/main
cmd git diff --stat main origin/main
cmd git merge origin/main

echo "=== storie divergenti"
quando "2026-10-19T18:30:00+0200"
sed -i 's#<title>Blog</title>#<title>Il blog di Mario</title>#' blog.html
cmd git commit -am "'Titolo del blog'"
cd "$WORK/luca/sito-prova"
quando "2026-10-19T18:40:00+0200"
git pull -q
luca "sed -i 's#  margin: 2rem auto;#  margin: 3rem auto;#' style.css"
luca "git commit -q -am 'Margini più ampi'"
git push -q
cd "$WORK/sito-prova"
cmd git push
cmd git pull
quando "2026-10-19T18:50:00+0200"
cmd git pull --rebase
cmd git log --oneline --graph -4 --format="'%h %an: %s'"
cmd git push --progress
cmd git status
cmd git config --global pull.rebase true
