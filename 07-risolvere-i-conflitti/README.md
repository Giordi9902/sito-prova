# Lezione 07 — Risolvere i conflitti

Articolo: [Risolvere i conflitti](https://www.giorgiodifusco.it/guide/git-da-zero/risolvere-i-conflitti-di-merge-in-git)

Questa cartella mostra il repository `sito-prova` alla fine della lezione. La cartella
[`sito-prova/`](sito-prova/) contiene i file del branch `main` in quel momento.

Il colore del titolo provoca un conflitto, risolto con il colore teal. Il secondo conflitto, sulla pagina dei contatti, viene annullato con `git merge --abort`: su `main` resta il commit "Testo dei contatti".

## Ritrovare questo stato con Git

```bash
git clone https://github.com/Giordi9902/sito-prova.git
cd sito-prova
git switch --detach lezione-07
```

## Commit aggiunti a `main` in questa lezione

```
3409e5e Titolo verde
d375973 Titolo rosso
a43e4cf Merge branch 'titolo-verde'
41ddd3c Testo dei contatti
```

## La storia completa

```
$ git log --oneline --graph --decorate --all
* 41ddd3c (HEAD -> main) Testo dei contatti
*   a43e4cf Merge branch 'titolo-verde'
|\  
| * 3409e5e Titolo verde
* | d375973 Titolo rosso
|/  
*   eb54b08 Merge branch 'galleria'
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
* main 41ddd3c Testo dei contatti
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
