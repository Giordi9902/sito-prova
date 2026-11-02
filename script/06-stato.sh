#!/usr/bin/env bash
# Stato finale del 06 (punto di partenza del 07), senza stampare nulla.
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/06-merge.sh" > /dev/null
