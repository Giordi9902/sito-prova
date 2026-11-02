#!/usr/bin/env bash
# Git 02 — ricrea sito-prova con i 4 commit dell'articolo (punto di partenza del 03).
source "$(dirname "$0")/lib.sh"
rm -rf "$WORK/sito-prova"; mkdir -p "$WORK/sito-prova"; cd "$WORK/sito-prova"
git init -q
quando "2026-10-12T18:30:00+0200"
cat > index.html <<'H'
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="utf-8">
  <title>Il mio sito</title>
</head>
<body>
  <h1>Benvenuto nel mio sito</h1>
</body>
</html>
H
git add index.html; git commit -q -m "Prima pagina del sito"
printf 'body {\n  font-family: sans-serif;\n  margin: 2rem;\n}\n' > style.css
sed -i 's#  <title>Il mio sito</title>#&\n  <link rel="stylesheet" href="style.css">#' index.html
git add style.css; git commit -q -m "Aggiunto il foglio di stile"
git add index.html; git commit -q -m "Collegato style.css alla pagina"
sed -i 's#  <h1>Benvenuto nel mio sito</h1>#&\n  <p>Qui racconto i miei esperimenti con il codice.</p>#' index.html
git add index.html; git commit -q -m "Aggiunta una frase di presentazione"
git log --oneline
