# Lezione 02 — Il primo repository

Articolo: [Il primo repository](https://www.giorgiodifusco.it/guide/git-da-zero/il-primo-repository-git-init-status-add-commit-e-le-tre-aree)

Questa cartella mostra il repository `sito-prova` alla fine della lezione. La cartella
[`sito-prova/`](sito-prova/) contiene i file del branch `main` in quel momento.

Il repository nasce con `git init` e riceve i primi quattro commit: la pagina, il foglio di stile, il collegamento tra i due e una frase di presentazione.

## Ritrovare questo stato con Git

```bash
git clone https://github.com/Giordi9902/sito-prova.git
cd sito-prova
git switch --detach lezione-02
```

## Commit aggiunti a `main` in questa lezione

```
3594745 Prima pagina del sito
1233868 Aggiunto il foglio di stile
b0f6d1e Collegato style.css alla pagina
1f4771a Aggiunta una frase di presentazione
```

## La storia completa

```
$ git log --oneline --graph --decorate --all
* 1f4771a (HEAD -> main) Aggiunta una frase di presentazione
* b0f6d1e Collegato style.css alla pagina
* 1233868 Aggiunto il foglio di stile
* 3594745 Prima pagina del sito
```

## Branch

```
$ git branch -vv
* main 1f4771a Aggiunta una frase di presentazione
```

## File nella cartella di lavoro

```
$ git ls-files
index.html
style.css
```
