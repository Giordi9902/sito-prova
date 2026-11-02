#!/usr/bin/env bash
# Stato finale del 08 (punto di partenza del 09), senza stampare nulla.
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/08-rebase.sh" > /dev/null 2>&1
