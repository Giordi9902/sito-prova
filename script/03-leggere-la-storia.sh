#!/usr/bin/env bash
# Git 03 — log, diff, show, .gitignore (parte dallo stato finale del 02).
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/02-sito-prova.sh" > /dev/null
cd "$WORK/sito-prova"
quando "2026-10-13T18:00:00+0200"

cmd git log
cmd git log --oneline
cmd git log --oneline -2
cmd git log --stat -2
cmd git log --oneline -- style.css
cmd git log --oneline --grep=stile

# una modifica: il titolo diventa blu
cat >> style.css <<'C'

h1 {
  color: navy;
}
C
cmd git diff
cmd git add style.css
cmd git diff
cmd git diff --staged
cmd git commit -m "'Titolo in blu'"
cmd git show
cmd git show HEAD~2 --stat
cmd git diff HEAD~3 HEAD --stat
cmd git log --oneline --graph

# file da non versionare
quando "2026-10-13T18:20:00+0200"
echo "idee: pagina contatti, galleria di foto" > appunti.txt
mkdir -p .vscode && echo '{}' > .vscode/settings.json
echo "GET / 200" > server.log
cmd git status
cat > .gitignore <<'G'
# appunti personali
appunti.txt

# file generati dai programmi
*.log

# impostazioni dell'editor
.vscode/
G
cmd git status
cmd git check-ignore -v server.log
cmd git add .gitignore
cmd git commit -m "'Aggiunto .gitignore'"
cmd git status --ignored
cmd git log --oneline

# la trappola: un file già tracciato non viene ignorato (repository a parte)
rm -rf "$WORK/trappola"; mkdir -p "$WORK/trappola"; cd "$WORK/trappola"
git init -q; quando "2026-10-13T18:40:00+0200"
echo "avvio" > debug.log; git add debug.log; git commit -q -m "Primo commit"
echo "*.log" > .gitignore
echo "altra riga" >> debug.log
cmd git status -s
cmd git rm --cached debug.log
cmd git status -s
