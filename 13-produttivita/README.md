# Lezione 13 — Produttività: bisect, alias, hook, .gitattributes

Articolo: [Produttività: bisect, alias, hook, .gitattributes](https://www.giorgiodifusco.it/guide/git-da-zero/produttivita-con-git-bisect-alias-hook-e-gitattributes)

Questa cartella mostra il repository `sito-prova` alla fine della lezione. La cartella
[`sito-prova/`](sito-prova/) contiene i file del branch `main` in quel momento.

Il file `.gitattributes` fissa le regole per i file di testo e per le immagini. Gli esempi di `git bisect` usano un progetto a parte e non toccano `sito-prova`.

## Ritrovare questo stato con Git

```bash
git clone https://github.com/Giordi9902/sito-prova.git
cd sito-prova
git switch --detach lezione-13
```

## Commit aggiunti a `main` in questa lezione

```
e2efe0f Regole per i file in .gitattributes
```

## La storia completa

```
$ git log --oneline --graph --decorate --all
* e2efe0f (HEAD -> main) Regole per i file in .gitattributes
* f63c29b Pagina eventi
* 24b279d (tag: v1.0, origin/main) Titolo del post più onesto
* b8ce1a8 Interlinea più ampia per il testo
* 9074ae1 Link senza sottolineatura
*   ebda84e Merge pull request #1 from luca/link-blog
|\  
| * 5e80b96 Link al blog anche nella galleria
| * 1f111a2 Link al blog nella pagina principale
|/  
* bdf991a Titolo del blog
* 7335989 Margini più ampi
* 8a31f17 Telefono nella pagina contatti
* 068863f Titolo della galleria
| * 71378ff (esperimenti) Titolo della galleria
| * b6f7322 Bozza del tema scuro
|/  
* 18c0a1c Foto nella pagina chi sono
* 23bc99f Pagina chi sono
* 91ebaa3 Primo post
* 39cd4e5 Pagina del blog
* f009cd3 Pagina centrata
* 41ddd3c Testo dei contatti
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
* 3594745 (tag: v0.1) Prima pagina del sito
```

## Branch

```
$ git branch -vv
  esperimenti 71378ff Titolo della galleria
* main        e2efe0f [origin/main: dopo 2] Regole per i file in .gitattributes
```

## Tag

```
$ git tag -n
v0.1            La prima pagina
v1.0            Prima versione del sito
```

## Remoti

```
$ git remote -v
origin	git@github.com:mario/sito-prova.git (fetch)
origin	git@github.com:mario/sito-prova.git (push)
```

## File nella cartella di lavoro

```
$ git ls-files
.gitattributes
.gitignore
blog.html
chi-sono.html
contatti.html
eventi.html
galleria.html
index.html
style.css
```
