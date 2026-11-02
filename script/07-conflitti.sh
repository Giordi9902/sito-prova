#!/usr/bin/env bash
# Git 07 — conflitti di merge (parte dallo stato finale del 06).
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/06-stato.sh"
cd "$WORK/sito-prova"

cmd git switch -c titolo-verde
quando "2026-10-17T18:00:00+0200"
sed -i 's#  color: navy;#  color: darkgreen;#' style.css
cmd git commit -am "'Titolo verde'"
cmd git switch main
quando "2026-10-17T18:10:00+0200"
sed -i 's#  color: navy;#  color: darkred;#' style.css
cmd git commit -am "'Titolo rosso'"

cmd git merge titolo-verde
cmd git status
cmd cat style.css
cmd git diff
cmd git log --oneline --merge

# risoluzione: un terzo colore che mette d'accordo tutti
cat > style.css <<'C'
body {
  font-family: sans-serif;
  margin: 2rem;
}

h1 {
  color: teal;
}

a {
  color: darkcyan;
}
C
cmd git diff
cmd git add style.css
cmd git status
quando "2026-10-17T18:20:00+0200"
cmd git commit --no-edit
cmd git log --oneline --graph -5
cmd git branch -d titolo-verde

echo "=== zdiff3 e merge --abort"
cmd git switch -c contatti-mail
quando "2026-10-17T18:40:00+0200"
sed -i 's#  <p>Scrivimi a mario.rossi@example.com</p>#  <p>Scrivimi a <a href="mailto:mario.rossi@example.com">mario.rossi@example.com</a></p>#' contatti.html
git commit -q -am "Indirizzo cliccabile"
git switch -q main
sed -i 's#  <p>Scrivimi a mario.rossi@example.com</p>#  <p>Per lavoro: mario.rossi@example.com</p>#' contatti.html
git commit -q -am "Testo dei contatti"
cmd git config --global merge.conflictStyle zdiff3
cmd git merge contatti-mail
cmd sed -n "'8,16p'" contatti.html
cmd git merge --abort
cmd git status
cmd git log --oneline -3
cmd git branch -D contatti-mail
