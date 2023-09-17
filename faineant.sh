#!/bin/bash

# Variables
# Bien sûr, vous pouvez changer le fichier json, moi il s'appel comme ça
credentials_file="studentsToGithub.json"

# Extraire les données d'identification du fichier JSON avec jq
# brew install jq sur macOS
# sudo apt-get install jq sur Linux, pour windows, je ne sais pas
# https://stedolan.github.io/jq/ 
students=$(jq -r '.students[]' "$credentials_file")
orga=$(jq -r '.orga' "$credentials_file")
team=$(jq -r '.team' "$credentials_file")

# Générer les commandes gh pour chaque combinaison
for student in $students; do
    command="gh api -X PUT orgs/$orga/teams/$team/memberships/$student"
    echo $command
    # Exécuter la commande
    # eval permet d'exécuter une commande à partir d'une chaîne de caractères
    response=$(eval $command)
    # Afficher la réponse
    echo "Réponse: $response"
    # Afficher un séparateur
    echo "---"
done