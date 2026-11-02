# Lezione 06 — Unire i branch: merge

Articolo: [Unire i branch: merge](https://www.giorgiodifusco.it/guide/git-da-zero/unire-i-branch-con-git-merge-fast-forward-e-three-way)

Questa cartella mostra il repository `sito-prova` alla fine della lezione. La cartella
[`sito-prova/`](sito-prova/) contiene i file del branch `main` in quel momento.

Il nuovo titolo della pagina entra in `main` con un fast-forward, il branch `galleria` con un merge a tre vie.

## Ritrovare questo stato con Git

```bash
git clone https://github.com/Giordi9902/sito-prova.git
cd sito-prova
git switch --detach lezione-06
```

## Commit aggiunti a `main` in questa lezione

```
2a62713 Pagina galleria
4b4bdd2 Link alla galleria
83e9011 Titolo della pagina più chiaro
eb54b08 Merge branch 'galleria'
```

## La storia completa

```
$ git log --oneline --graph --decorate --all
*   eb54b08 (HEAD -> main) Merge branch 'galleria'
|\  
| * 4b4bdd2 Link alla galleria
| * 2a62713 Pagina galleria
* | 83e9011 Titolo della pagina più chiaro
* | 1e64d8e Colore dei link
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
* main eb54b08 Merge branch 'galleria'
```

## File nella cartella di lavoro

```
$ git ls-files
.gitignore
contatti.html
galleria.html
index.html
style.css
```
