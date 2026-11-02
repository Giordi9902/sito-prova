#!/usr/bin/env bash
# Stato finale del 10 (punto di partenza dell'11), senza stampare nulla.
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/10-github.sh" > /dev/null 2>&1
