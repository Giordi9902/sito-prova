# Lezione 09 — Repository remoti

Articolo: [Repository remoti](https://www.giorgiodifusco.it/guide/git-da-zero/repository-remoti-in-git-clone-fetch-pull-e-push)

Questa cartella mostra il repository `sito-prova` alla fine della lezione. La cartella
[`sito-prova/`](sito-prova/) contiene i file del branch `main` in quel momento.

Il repository viene pubblicato su un server (`origin`). Luca Bianchi aggiunge il telefono e i margini più ampi; Mario integra il proprio lavoro con `git pull --rebase`.

## Ritrovare questo stato con Git

```bash
git clone https://github.com/Giordi9902/sito-prova.git
cd sito-prova
git switch --detach lezione-09
```

## Commit aggiunti a `main` in questa lezione

```
8a31f17 Telefono nella pagina contatti
7335989 Margini più ampi
bdf991a Titolo del blog
```

## La storia completa

```
$ git log --oneline --graph --decorate --all
* bdf991a (HEAD -> main, origin/main) Titolo del blog
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
* 3594745 Prima pagina del sito
```

## Branch

```
$ git branch -vv
  esperimenti 71378ff Titolo della galleria
* main        bdf991a [origin/main] Titolo del blog
```

## Remoti

```
$ git remote -v
origin	/home/mario/server/sito-prova.git (fetch)
origin	/home/mario/server/sito-prova.git (push)
```

## File nella cartella di lavoro

```
$ git ls-files
.gitignore
blog.html
chi-sono.html
contatti.html
galleria.html
index.html
style.css
```
