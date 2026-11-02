# Lezione 04 — Annullare gli errori

Articolo: [Annullare gli errori](https://www.giorgiodifusco.it/guide/git-da-zero/annullare-gli-errori-in-git-restore-reset-e-revert)

Questa cartella mostra il repository `sito-prova` alla fine della lezione. La cartella
[`sito-prova/`](sito-prova/) contiene i file del branch `main` in quel momento.

La pagina dei contatti entra con un messaggio corretto da `git commit --amend`. Il commit "Titolo più grande" viene annullato con `git revert`. Il commit "Sfondo giallo", tolto con `git reset`, non compare nella storia.

## Ritrovare questo stato con Git

```bash
git clone https://github.com/Giordi9902/sito-prova.git
cd sito-prova
git switch --detach lezione-04
```

## Commit aggiunti a `main` in questa lezione

```
76074e4 Aggiunta pagina contatti
7e1ffb7 Titolo più grande
c9b1622 Revert "Titolo più grande"
```

## La storia completa

```
$ git log --oneline --graph --decorate --all
* c9b1622 (HEAD -> main) Revert "Titolo più grande"
* 7e1ffb7 Titolo più grande
* 76074e4 Aggiunta pagina contatti
* 823f122 Aggiunto .gitignore
* 0bbb20f Titolo in blu
* 1f4771a Aggiunta una frase di presentazione
* b0f6d1e Collegato style.css alla pagina
* 1233868 Aggiunto il foglio di stile
* 3594745 Prima pagina del sito
```

## Branch

```
$ git branch -vv
* main c9b1622 Revert "Titolo più grande"
```

## File nella cartella di lavoro

```
$ git ls-files
.gitignore
contatti.html
index.html
style.css
```
