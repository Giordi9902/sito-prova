# Lezione 08 — Rebase e cherry-pick

Articolo: [Rebase e cherry-pick](https://www.giorgiodifusco.it/guide/git-da-zero/rebase-e-cherry-pick-riscrivere-la-storia-in-git)

Questa cartella mostra il repository `sito-prova` alla fine della lezione. La cartella
[`sito-prova/`](sito-prova/) contiene i file del branch `main` in quel momento.

La pagina del blog entra con un rebase, la pagina "chi sono" viene ripulita con `git rebase -i` e il titolo della galleria arriva su `main` con `git cherry-pick`. Il branch `esperimenti` resta aperto di proposito.

## Ritrovare questo stato con Git

```bash
git clone https://github.com/Giordi9902/sito-prova.git
cd sito-prova
git switch --detach lezione-08
```

## Commit aggiunti a `main` in questa lezione

```
f009cd3 Pagina centrata
39cd4e5 Pagina del blog
91ebaa3 Primo post
23bc99f Pagina chi sono
18c0a1c Foto nella pagina chi sono
068863f Titolo della galleria
```

## La storia completa

```
$ git log --oneline --graph --decorate --all
* 068863f (HEAD -> main) Titolo della galleria
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
* main        068863f Titolo della galleria
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
