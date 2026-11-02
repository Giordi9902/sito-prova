# Lezione 05 — I branch: puntatori, non copie

Articolo: [I branch: puntatori, non copie](https://www.giorgiodifusco.it/guide/git-da-zero/i-branch-di-git-puntatori-non-copie)

Questa cartella mostra il repository `sito-prova` alla fine della lezione. La cartella
[`sito-prova/`](sito-prova/) contiene i file del branch `main` in quel momento.

Il branch `galleria` porta la pagina delle foto e il link nel menu. Nel frattempo, su `main`, cambia il colore dei link.

## Ritrovare questo stato con Git

```bash
git clone https://github.com/Giordi9902/sito-prova.git
cd sito-prova
git switch --detach lezione-05
```

## Commit aggiunti a `main` in questa lezione

```
1e64d8e Colore dei link
```

## La storia completa

```
$ git log --oneline --graph --decorate --all
* 1e64d8e (HEAD -> main) Colore dei link
| * 4b4bdd2 (galleria) Link alla galleria
| * 2a62713 Pagina galleria
|/  
* c9b1622 Revert "Titolo più grande"
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
  galleria 4b4bdd2 Link alla galleria
* main     1e64d8e Colore dei link
```

## File nella cartella di lavoro

```
$ git ls-files
.gitignore
contatti.html
index.html
style.css
```
