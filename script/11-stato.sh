#!/usr/bin/env bash
# Stato finale dell'11 (punto di partenza del 12), senza stampare nulla.
source "$(dirname "$0")/lib.sh"
bash "$GIT_ESEMPI/11-buone-pratiche.sh" > /dev/null 2>&1
