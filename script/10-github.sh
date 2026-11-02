#!/usr/bin/env bash
# Git 10 — chiave SSH, fork e pull request (parte dallo stato finale del 09).
# GitHub è simulato con repository bare: mario.git (il repository di Mario) e luca-fork.git (il fork di Luca).
# Nel testo gli indirizzi diventano git@github.com:mario/sito-prova.git e git@github.com:luca/sito-prova.git.
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/09-stato.sh"
GH="$WORK/github"; rm -rf "$GH" "$WORK/luca2"; mkdir -p "$GH" "$WORK/luca2"

echo "=== chiave SSH"
mkdir -p -m 700 "$HOME/.ssh"
cmd ssh-keygen -t ed25519 -C "mario.rossi@example.com" -f "$HOME/.ssh/id_ed25519" -N "''"
cmd cat "$HOME/.ssh/id_ed25519.pub"

echo "=== mario pubblica su GitHub"
git init -q --bare "$GH/mario.git"
cd "$WORK/sito-prova"
cmd git remote set-url origin "$GH/mario.git"
cmd git remote -v
cmd git push --progress -u origin main

echo "=== luca: fork e clone"
git clone -q --bare "$GH/mario.git" "$GH/luca-fork.git"
cd "$WORK/luca2"
cmd git clone --progress "$GH/luca-fork.git" sito-prova
cd sito-prova
export GIT_AUTHOR_NAME="Luca Bianchi" GIT_AUTHOR_EMAIL="luca.bianchi@example.com" GIT_COMMITTER_NAME="Luca Bianchi" GIT_COMMITTER_EMAIL="luca.bianchi@example.com"
cmd git remote add upstream "$GH/mario.git"
cmd git remote -v
cmd git switch -c link-blog
quando "2026-10-20T18:00:00+0200"
sed -i 's#<a href="galleria.html">Galleria</a> · #&<a href="blog.html">Blog</a> · #' index.html
cmd git commit -am "'Link al blog nella pagina principale'"
cmd git push --progress -u origin link-blog
echo "--- review: Mario chiede di aggiungere il link anche in galleria.html"
quando "2026-10-20T18:30:00+0200"
sed -i 's#  <h1>Le mie foto</h1>#&\n  <p><a href="index.html">Home</a> · <a href="blog.html">Blog</a></p>#' galleria.html
cmd git commit -am "'Link al blog anche nella galleria'"
cmd git push --progress

echo "=== Mario unisce la pull request (simulato con un merge --no-ff sul suo repository)"
export GIT_AUTHOR_NAME="Mario Rossi" GIT_AUTHOR_EMAIL="mario.rossi@example.com" GIT_COMMITTER_NAME="Mario Rossi" GIT_COMMITTER_EMAIL="mario.rossi@example.com"
cd "$WORK/sito-prova"
git fetch -q "$GH/luca-fork.git" link-blog
quando "2026-10-20T19:00:00+0200"
git merge -q --no-ff -m "Merge pull request #1 from luca/link-blog" FETCH_HEAD
git push -q
cmd git log --oneline --graph -4

echo "=== Luca sincronizza il fork"
cd "$WORK/luca2/sito-prova"
cmd git switch main
cmd git fetch --progress upstream
cmd git merge upstream/main
cmd git push --progress origin main
cmd git branch -d link-blog
cmd git push origin --delete link-blog
