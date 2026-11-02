#!/usr/bin/env bash
# Git 13 — bisect, blame, alias, hook, .gitattributes.
# bisect lavora su un piccolo progetto a parte (negozio/); il resto su sito-prova (stato finale del 12).
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/12-salvagente.sh" > /dev/null 2>&1

echo "=== bisect: un progetto con 16 commit e un bug in mezzo"
rm -rf "$WORK/negozio"; mkdir -p "$WORK/negozio"; cd "$WORK/negozio"
git init -q
cat > calcola.py <<'P'
def totale(prezzi, sconto):
    """Somma dei prezzi con lo sconto in percentuale."""
    return round(sum(prezzi) * (1 - sconto / 100), 2)
P
cat > test.sh <<'T'
#!/bin/sh
# 30 euro di spesa con il 10% di sconto: 27 euro
python3 -c "from calcola import totale; assert totale([10, 20], 10) == 27, totale([10, 20], 10)"
T
chmod +x test.sh
touch prodotti.txt
git add .
quando "2026-10-23T09:00:00+0200"; git commit -q -m "Prima versione del calcolo"
prodotti=(pane latte uova farina zucchero burro miele caffè tè riso pasta olio sale pepe aceto)
for i in "${!prodotti[@]}"; do
  p="${prodotti[$i]}"
  quando "2026-10-23T$(printf '%02d' $((10 + i / 2))):$(printf '%02d' $(( (i % 2) * 30 ))):00+0200"
  echo "$p" >> prodotti.txt
  if [ "$p" = "caffè" ]; then
    # il bug: lo sconto viene diviso per 10 invece che per 100
    sed -i 's#(1 - sconto / 100)#(1 - sconto / 10)#' calcola.py
    git commit -q -am "Aggiunto il caffè e semplificato il calcolo"
  else
    git commit -q -am "Aggiunto $p"
  fi
done
cmd git log --oneline
cmd ./test.sh
cmd git bisect start
cmd git bisect bad
cmd git bisect good HEAD~15
cmd ./test.sh
cmd git bisect good
cmd ./test.sh
cmd git bisect bad
cmd ./test.sh
cmd git bisect bad
cmd ./test.sh
cmd git bisect bad
cmd git bisect reset
echo "--- bisect run"
cmd git bisect start HEAD HEAD~15
cmd git bisect run ./test.sh
cmd git bisect reset

echo "=== blame"
cd "$WORK/sito-prova"
cmd git blame style.css
cmd git blame -L 1,6 style.css

echo "=== alias"
cmd git config --global alias.st "'status -s'"
cmd git config --global alias.lg "'log --oneline --graph --decorate --all'"
cmd git st
cmd git lg -6

echo "=== hook pre-commit"
cat > .git/hooks/pre-commit <<'H'
#!/bin/sh
# Blocca il commit se un file in staging contiene ancora i marcatori di un conflitto.
if git diff --cached --name-only -z | xargs -0 -r grep -n -E '^(<<<<<<<|>>>>>>>)' ; then
  echo "Commit bloccato: ci sono marcatori di conflitto nei file qui sopra." >&2
  exit 1
fi
H
chmod +x .git/hooks/pre-commit
cmd ls .git/hooks
printf '<<<<<<< HEAD\nprova\n=======\naltro\n>>>>>>> ramo\n' >> eventi.html
git add eventi.html
quando "2026-10-23T18:00:00+0200"
cmd git commit -m "'Eventi aggiornati'"
cmd git log --oneline -1
git restore --staged eventi.html; git restore eventi.html

echo "=== .gitattributes"
cat > .gitattributes <<'A'
# fine riga LF per tutti i file di testo, qualunque sistema usi chi li salva
* text=auto eol=lf

# le immagini sono binarie: niente conversioni, niente diff riga per riga
*.png binary
*.jpg binary
A
cmd git check-attr -a index.html
cmd git check-attr -a foto.jpg
git add .gitattributes
quando "2026-10-23T18:30:00+0200"
cmd git commit -m "'Regole per i file in .gitattributes'"
