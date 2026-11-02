#!/usr/bin/env bash
# Stato finale del 05 (punto di partenza del 06), senza stampare nulla.
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/05-branch.sh" > /dev/null
