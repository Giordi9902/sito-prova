#!/usr/bin/env bash
# Stato finale del 09 (punto di partenza del 10), senza stampare nulla.
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/09-remoti.sh" > /dev/null 2>&1
