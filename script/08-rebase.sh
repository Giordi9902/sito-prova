#!/usr/bin/env bash
# Git 08 — rebase, rebase -i, cherry-pick (parte dallo stato finale del 07).
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/07-stato.sh"
cd "$WORK/sito-prova"

echo "=== rebase"
cmd git switch -c blog
quando "2026-10-18T18:00:00+0200"
cat > blog.html <<'H'
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="utf-8">
  <title>Blog</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h1>Blog</h1>
</body>
</html>
H
git add blog.html
cmd git commit -m "'Pagina del blog'"
quando "2026-10-18T18:10:00+0200"
sed -i 's#  <h1>Blog</h1>#&\n  <h2>Ho imparato Git</h2>#' blog.html
cmd git commit -am "'Primo post'"
cmd git switch main
quando "2026-10-18T18:20:00+0200"
sed -i 's#  margin: 2rem;#  margin: 2rem auto;\n  max-width: 40rem;#' style.css
cmd git commit -am "'Pagina centrata'"
cmd git log --oneline --decorate --graph --all -5
cmd git switch blog
quando "2026-10-18T18:30:00+0200"
cmd git rebase main
cmd git log --oneline --decorate --graph --all -5
cmd git switch main
cmd git merge blog
cmd git branch -d blog

echo "=== rebase -i"
cmd git switch -c chi-sono
quando "2026-10-18T19:00:00+0200"
printf '<!DOCTYPE html>\n<html lang="it">\n<head>\n  <meta charset="utf-8">\n  <title>Chi sonno</title>\n  <link rel="stylesheet" href="style.css">\n</head>\n<body>\n  <h1>Chi sono</h1>\n  <p>Sono Mario e mi piace programmare.</p>\n</body>\n</html>\n' > chi-sono.html
git add chi-sono.html; git commit -q -m "Pagina chi sono"
quando "2026-10-18T19:05:00+0200"
sed -i 's#  <h1>Chi sono</h1>#&\n  <img src="mario.jpg" alt="Foto di Mario">#' chi-sono.html
git commit -q -am "Foto nella pagina chi sono"
quando "2026-10-18T19:10:00+0200"
sed -i 's#<title>Chi sonno</title>#<title>Chi sono</title>#' chi-sono.html
git commit -q -am "refuso"
cmd git log --oneline -4
# "editor" per rebase -i: salva la lista com'è, poi sposta "refuso" sotto il primo commit come fixup
cat > "$WORK/editor-rebase.sh" <<'E'
#!/bin/sh
cp "$1" "$WORK/todo-originale.txt"
python3 - "$1" <<'P'
import sys
p = sys.argv[1]
lines = open(p).read().split("\n")
pick = [l for l in lines if l.startswith("pick ")]
rest = [l for l in lines if not l.startswith("pick ")]
first, foto, refuso = pick
open(p, "w").write("\n".join([first, refuso.replace("pick", "fixup", 1), foto] + rest))
P
cp "$1" "$WORK/todo-modificato.txt"
E
chmod +x "$WORK/editor-rebase.sh"
quando "2026-10-18T19:20:00+0200"
cmd WORK="$WORK" GIT_SEQUENCE_EDITOR="$WORK/editor-rebase.sh" git rebase -i main
echo "--- lista proposta da Git:"; cat "$WORK/todo-originale.txt"
echo "--- lista modificata:"; grep -v '^#' "$WORK/todo-modificato.txt" | sed '/^$/d'
cmd git log --oneline -3
cmd git show --stat --oneline HEAD~1
cmd git switch main
cmd git merge chi-sono
cmd git branch -d chi-sono

echo "=== cherry-pick"
cmd git switch -c esperimenti
quando "2026-10-18T20:00:00+0200"
echo "/* tema scuro: da finire */" >> style.css
git commit -q -am "Bozza del tema scuro"
quando "2026-10-18T20:05:00+0200"
sed -i 's#<title>Galleria</title>#<title>Le mie foto</title>#' galleria.html
cmd git commit -am "'Titolo della galleria'"
cmd git log --oneline -2
cmd git switch main
quando "2026-10-18T20:10:00+0200"
cmd git cherry-pick 'esperimenti'
cmd git log --oneline -3
cmd git log --oneline --decorate --graph --all -4
