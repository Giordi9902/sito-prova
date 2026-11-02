# Ambiente comune agli esempi della rassegna "Git da zero".
# Ogni script NN-*.sh si lancia con:  bash NN-*.sh  e lavora in $WORK (cartella temporanea).
# Git in inglese, HOME isolata, autore Mario Rossi, date dei commit fissate: gli hash
# sono riproducibili e coincidono con quelli negli articoli e nelle animazioni.
set -euo pipefail
export LC_ALL=C LANG=C
GIT_ESEMPI="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORK="${WORK:-/tmp/git-da-zero}"
export HOME="$WORK/home"
export GIT_CONFIG_NOSYSTEM=1
export GIT_AUTHOR_NAME="Mario Rossi" GIT_AUTHOR_EMAIL="mario.rossi@example.com"
export GIT_COMMITTER_NAME="Mario Rossi" GIT_COMMITTER_EMAIL="mario.rossi@example.com"
# HOME nuova a ogni avvio: la configurazione globale la costruiscono gli script, in ordine
case "$WORK" in */git-da-zero*) rm -rf "$HOME" ;; esac
mkdir -p "$HOME"
git config --global user.name "Mario Rossi"
git config --global user.email "mario.rossi@example.com"
git config --global init.defaultBranch main
git config --global core.editor nano
git config --global advice.detachedHead true

# quando DATA "2026-10-12T18:30:00+0200": fissa la data dei commit successivi
quando () { export GIT_AUTHOR_DATE="$1" GIT_COMMITTER_DATE="$1"; }

# $ comando  → stampa il comando e il suo output (anche stderr), come nel terminale
cmd () { echo "\$ $*"; eval "$@" 2>&1 || true; echo; }
