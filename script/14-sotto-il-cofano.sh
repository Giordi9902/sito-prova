#!/usr/bin/env bash
# Git 14 — oggetti e SHA-1 (parte dallo stato finale del 13).
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/13-produttivita.sh" > /dev/null 2>&1
cd "$WORK/sito-prova"

echo "=== la cartella .git"
cmd ls -F .git
cmd cat .git/HEAD
cmd ls .git/refs/heads .git/refs/tags .git/refs/remotes/origin

echo "=== dentro un commit: il primo del sito"
cmd git cat-file -t 3594745
cmd git cat-file -p 3594745
TREE1=$(git rev-parse '3594745^{tree}')
cmd git cat-file -t "$TREE1"
cmd git cat-file -p "$TREE1"
BLOB1=$(git rev-parse '3594745:index.html')
cmd git cat-file -t "$BLOB1"
cmd git cat-file -p "$BLOB1"
cmd git cat-file -s "$BLOB1"

echo "=== il secondo commit: il blob di index.html è lo stesso"
cmd git cat-file -p 1233868
TREE2=$(git rev-parse '1233868^{tree}')
cmd git cat-file -p "$TREE2"

echo "=== l'ultimo commit"
cmd git cat-file -p HEAD
cmd git cat-file -p 'HEAD^{tree}'

echo "=== un tag annotato"
cmd git cat-file -t v1.0
cmd git cat-file -p v1.0

echo "=== l'hash si calcola"
cmd git hash-object index.html
cmd 'git show 3594745:index.html > /tmp/git-da-zero/index-v1.html'
cmd git hash-object /tmp/git-da-zero/index-v1.html
cmd "printf 'blob 159\\0' | cat - /tmp/git-da-zero/index-v1.html | sha1sum"
cmd echo "'ciao'" '|' git hash-object --stdin
cmd "printf 'blob 5\\0ciao\\n' | sha1sum"

echo "=== l'oggetto sul disco"
cmd ls .git/objects/"${BLOB1:0:2}"/
cmd file .git/objects/"${BLOB1:0:2}"/"${BLOB1:2}"
cmd "python3 -c \"import zlib,sys; d=zlib.decompress(open(sys.argv[1],'rb').read()); print(repr(d[:60]))\" .git/objects/${BLOB1:0:2}/${BLOB1:2}"

echo "=== quanti oggetti, e i pacchetti"
cmd git count-objects -v
cmd git gc --quiet
cmd git count-objects -v
cmd ls .git/objects/pack
