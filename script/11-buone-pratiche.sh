#!/usr/bin/env bash
# Git 11 — messaggi di commit, git add -p (parte dallo stato finale del 10).
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/10-stato.sh"
cd "$WORK/sito-prova"

echo "=== una storia illeggibile (repository a parte)"
rm -rf "$WORK/brutto"; mkdir -p "$WORK/brutto"; cd "$WORK/brutto"; git init -q
quando "2026-10-21T17:00:00+0200"
for m in "modifiche" "fix" "fix 2" "asdf" "ora funziona" "wip" "aggiornamento"; do echo "$m" >> f.txt; git add f.txt; git commit -q -m "$m"; done
cmd git log --oneline
cd "$WORK/sito-prova"

echo "=== git add -p"
cmd git switch -c stile-link
sed -i 's#  color: darkcyan;#  color: darkcyan;\n  text-decoration: none;#' style.css
sed -i 's#  margin: 3rem auto;#  margin: 3rem auto;\n  line-height: 1.6;#' style.css
cmd git diff
cmd 'printf "n\ny\n" | git add -p'
cmd git status -s
cmd git diff --staged

echo "=== messaggio con corpo"
quando "2026-10-21T18:00:00+0200"
cat > "$WORK/messaggio.txt" <<'M'
Link senza sottolineatura

Nel menu della pagina principale i link sottolineati appesantivano
la riga. Il colore darkcyan basta a riconoscerli come link.
M
cmd git commit -F "$WORK/messaggio.txt"
cmd git log -1
cmd git commit -am "'Interlinea più ampia per il testo'"
cmd git log --oneline -3

echo "=== chiusura: il branch entra in main"
cmd git switch main
cmd git merge stile-link
cmd git branch -d stile-link
