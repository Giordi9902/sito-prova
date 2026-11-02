# sito-prova — il repository della guida «Git da zero»

Questo è il repository di prova che cresce lezione dopo lezione nella guida
[Git da zero](https://www.giorgiodifusco.it/guide/git-da-zero) di [giorgiodifusco.it](https://www.giorgiodifusco.it).
Il sito è volutamente minimo: qualche pagina HTML e un foglio di stile. Conta la storia, non il codice.

## Com'è fatto il repository

- Il branch **`main`** contiene la storia vera di `sito-prova`. Gli hash dei commit coincidono con quelli
  stampati negli articoli, perché autori (Mario Rossi e Luca Bianchi, personaggi di fantasia) e date sono fissati.
- I tag **`lezione-02`** … **`lezione-14`** segnano lo stato di `main` alla fine di ogni lezione.
- I tag `v0.1` e `v1.0` e il branch `esperimenti` sono quelli creati negli articoli.
- Il branch **`passo-passo`** (questo) contiene una cartella per lezione con i file del sito e lo stato del
  repository in quel momento: storia, branch, tag e remoti. Ogni cartella è stata aggiunta con un commit a sé.

## Le lezioni

| # | Lezione | Stato del repository | Commit |
|---|---|---|---|
| 01 | [Cos'è Git e perché usarlo](https://www.giorgiodifusco.it/guide/git-da-zero/cos-e-git-e-perche-usarlo-guida-da-zero-per-principianti) | il repository non esiste ancora | — |
| 02 | [Il primo repository](https://www.giorgiodifusco.it/guide/git-da-zero/il-primo-repository-git-init-status-add-commit-e-le-tre-aree) | [`02-il-primo-repository/`](02-il-primo-repository/) | [`1f4771a`](https://github.com/Giordi9902/sito-prova/tree/lezione-02) |
| 03 | [Leggere la storia](https://www.giorgiodifusco.it/guide/git-da-zero/leggere-la-storia-di-git-log-diff-show-e-gitignore) | [`03-leggere-la-storia/`](03-leggere-la-storia/) | [`823f122`](https://github.com/Giordi9902/sito-prova/tree/lezione-03) |
| 04 | [Annullare gli errori](https://www.giorgiodifusco.it/guide/git-da-zero/annullare-gli-errori-in-git-restore-reset-e-revert) | [`04-annullare-gli-errori/`](04-annullare-gli-errori/) | [`c9b1622`](https://github.com/Giordi9902/sito-prova/tree/lezione-04) |
| 05 | [I branch: puntatori, non copie](https://www.giorgiodifusco.it/guide/git-da-zero/i-branch-di-git-puntatori-non-copie) | [`05-i-branch/`](05-i-branch/) | [`1e64d8e`](https://github.com/Giordi9902/sito-prova/tree/lezione-05) |
| 06 | [Unire i branch: merge](https://www.giorgiodifusco.it/guide/git-da-zero/unire-i-branch-con-git-merge-fast-forward-e-three-way) | [`06-unire-i-branch-merge/`](06-unire-i-branch-merge/) | [`eb54b08`](https://github.com/Giordi9902/sito-prova/tree/lezione-06) |
| 07 | [Risolvere i conflitti](https://www.giorgiodifusco.it/guide/git-da-zero/risolvere-i-conflitti-di-merge-in-git) | [`07-risolvere-i-conflitti/`](07-risolvere-i-conflitti/) | [`41ddd3c`](https://github.com/Giordi9902/sito-prova/tree/lezione-07) |
| 08 | [Rebase e cherry-pick](https://www.giorgiodifusco.it/guide/git-da-zero/rebase-e-cherry-pick-riscrivere-la-storia-in-git) | [`08-rebase-e-cherry-pick/`](08-rebase-e-cherry-pick/) | [`068863f`](https://github.com/Giordi9902/sito-prova/tree/lezione-08) |
| 09 | [Repository remoti](https://www.giorgiodifusco.it/guide/git-da-zero/repository-remoti-in-git-clone-fetch-pull-e-push) | [`09-repository-remoti/`](09-repository-remoti/) | [`bdf991a`](https://github.com/Giordi9902/sito-prova/tree/lezione-09) |
| 10 | [GitHub: chiavi SSH, fork e pull request](https://www.giorgiodifusco.it/guide/git-da-zero/github-chiavi-ssh-fork-e-pull-request) | [`10-github/`](10-github/) | [`ebda84e`](https://github.com/Giordi9902/sito-prova/tree/lezione-10) |
| 11 | [Workflow e buone pratiche](https://www.giorgiodifusco.it/guide/git-da-zero/workflow-git-e-buone-pratiche-branch-commit-e-pull-request) | [`11-workflow-e-buone-pratiche/`](11-workflow-e-buone-pratiche/) | [`b8ce1a8`](https://github.com/Giordi9902/sito-prova/tree/lezione-11) |
| 12 | [Stash, tag e reflog: il salvagente](https://www.giorgiodifusco.it/guide/git-da-zero/stash-tag-e-reflog-il-salvagente-di-git) | [`12-stash-tag-reflog/`](12-stash-tag-reflog/) | [`f63c29b`](https://github.com/Giordi9902/sito-prova/tree/lezione-12) |
| 13 | [Produttività: bisect, alias, hook, .gitattributes](https://www.giorgiodifusco.it/guide/git-da-zero/produttivita-con-git-bisect-alias-hook-e-gitattributes) | [`13-produttivita/`](13-produttivita/) | [`e2efe0f`](https://github.com/Giordi9902/sito-prova/tree/lezione-13) |
| 14 | [Sotto il cofano: oggetti e SHA-1](https://www.giorgiodifusco.it/guide/git-da-zero/git-sotto-il-cofano-blob-tree-commit-e-sha-1) | [`14-sotto-il-cofano/`](14-sotto-il-cofano/) | [`e2efe0f`](https://github.com/Giordi9902/sito-prova/tree/lezione-14) |

## Usare il repository

```bash
git clone https://github.com/Giordi9902/sito-prova.git
cd sito-prova
git switch main                       # la storia completa
git log --oneline --graph --all       # il grafo dei commit
git switch --detach lezione-06        # lo stato alla fine della lezione 6
git diff lezione-05 lezione-06        # cosa cambia tra due lezioni
```

Alcuni commit degli articoli non compaiono in `main`: sono quelli cancellati apposta con `git reset`,
`git commit --amend` o `git rebase`, oppure creati in repository a parte (la trappola del `.gitignore`
nella lezione 3, la storia illeggibile nella lezione 11, il progetto di `git bisect` nella lezione 13).
Nelle lezioni 9 e 10 il server e GitHub sono simulati con repository locali: per questo i commit di Luca
compaiono in `main`, ma il suo fork non esiste come repository a parte.

## Ricostruire tutto da zero

La cartella [`script/`](script/) contiene gli script che eseguono i comandi di ogni articolo.
Ogni script lavora in `/tmp/git-da-zero` e ricrea lo stato della lezione con gli stessi hash:

```bash
bash script/02-sito-prova.sh   # i quattro commit della lezione 2
bash script/08-stato.sh        # lo stato alla fine della lezione 8, senza output
```
