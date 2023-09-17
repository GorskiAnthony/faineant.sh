<h1 align="center">Welcome to faineant.sh 👋</h1>
<p>
  <a href="https://twitter.com/Gorski_anthony" target="_blank">
    <img alt="Twitter: Gorski_anthony" src="https://img.shields.io/twitter/follow/Gorski_anthony.svg?style=social" />
  </a>
</p>

> Permet via la CLI de github (gh) d'envoyer toutes les demandes d'ajout d'élèves dans une team

## Prérequis

Il vous faut absolument :

-   [gh](https://cli.github.com/)
-   [jq](https://stedolan.github.io/jq/) (pour parser le json)
    -   Vous avez les instructions d'installation dans le fichier faineant.sh

## Usage

```sh
gh repo clone GorskiAnthony/faineant.sh
cd faineant.sh
```

Il faut modifier le fichier team.json et remplacer les valeurs par les votres

```json
{
	"orga": "", // ex: "WildCodeSchool-2023-09"
	"team": "", // ex: "JS-Remote-SACOD"
	"students": [] // ex: ["GorskiAnthony", "samuelfaberdev", ...]
}
```

Il faut rendre le script executable

```sh
chmod +x faineant.sh
```

Ensuite, il suffit de lancer le script

```sh
./faineant.sh
```

Et voilà ! Vous avez envoyé toutes les demandes d'ajout d'élèves dans la team !

## Author

👤 **Anthony Gorski**

-   Twitter: [@Gorski_Anthony](https://twitter.com/Gorski_Anthony)
-   GitHub: [@GorskiAnthony](https://github.com/GorskiAnthony)

## Show your support

Give a ⭐️ if this project helped you!

---

👋 Qui suis-je ?
Je suis **Anthony Gorski**, développeur web et formateur à la [Wild Code School](https://www.wildcodeschool.com/fr-FR).
