#!bin/hash


source challenge/functions.sh
# Ensure Script fails fast on error

set -e

#### DEBUT DU CHALLENGE #####

setup_challenge

### CHALLENGE 01 - CREER UN PORTEFEUILLE POUR SUIVRE VOTRE AVENTURE ###
echo "Challenge 01 - Créez votre portefeuille d'exploration"

## Votre tâche ici est d'utiliser bitcoin-cli pour créer le portefeuille d'exploration nommé "lnbootcampctn"
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS


echo "Créez votre portefeuille 'tresor' pour collecter vos trésors"
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS


echo "Générez une adresse dans votre portefeuille d'exploration"
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS :tapez la commande bitcoin CLI dans la parenthèse
ADDRESS=$()


echo "Adresse de minage : $ADDRESS"

mine_blocks 100 $ADDRESS

echo  "Nous venons de recharger votre portefeuille d'exploration"

## Découvrez le nouveau solde de votre portefeuille d'exploration
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS
SOLDE=$()

check_cmd "Vérification de solde"

echo "Votre solde intiale est de $SOLDE btc"

### CHALLENGE 02 - TRANSACTION ###

## Générez les différents types d'adresse pour collecter vos trésors

# ECRIVEZ VOS SOLUTIONS SUR LES LIGNES CI-DESSOUS : 

LEGACY_ADDRESS=$()

check_cmd "Legacy address" 

P2SH_ADDRESS=$()

check_cmd "P2SH address" 

SEGWIT_ADDRESS=$()

check_cmd "SEGWIT address" 

TAPROOT_ADDRESS=$()

check_cmd "TAPROOT address" 

echo "Vos adresses de collecte de votre trésor : "

echo " Legacy : $LEGACY_ADDRESS"
echo " P2SH : $P2SH_ADDRESS"
echo "SEGWIT : $SEGWIT_ADDRESS"
echo "TAPROOT: $TAPROOT_ADDRESS"

