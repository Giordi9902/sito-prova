#!/usr/bin/env bash
# Stato finale del 07 (punto di partenza del 08), senza stampare nulla.
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/07-conflitti.sh" > /dev/null
