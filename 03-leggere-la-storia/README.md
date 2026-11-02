# Lezione 03 — Leggere la storia

Articolo: [Leggere la storia](https://www.giorgiodifusco.it/guide/git-da-zero/leggere-la-storia-di-git-log-diff-show-e-gitignore)

Questa cartella mostra il repository `sito-prova` alla fine della lezione. La cartella
[`sito-prova/`](sito-prova/) contiene i file del branch `main` in quel momento.

Il titolo diventa blu e il file `.gitignore` esclude appunti, log e impostazioni dell'editor.

## Ritrovare questo stato con Git

```bash
git clone https://github.com/Giordi9902/sito-prova.git
cd sito-prova
git switch --detach lezione-03
```

## Commit aggiunti a `main` in questa lezione

```
0bbb20f Titolo in blu
823f122 Aggiunto .gitignore
```

## La storia completa

```
$ git log --oneline --graph --decorate --all
* 823f122 (HEAD -> main) Aggiunto .gitignore
* 0bbb20f Titolo in blu
* 1f4771a Aggiunta una frase di presentazione
* b0f6d1e Collegato style.css alla pagina
* 1233868 Aggiunto il foglio di stile
* 3594745 Prima pagina del sito
```

## Branch

```
$ git branch -vv
* main 823f122 Aggiunto .gitignore
```

## File nella cartella di lavoro

```
$ git ls-files
.gitignore
index.html
style.css
```
