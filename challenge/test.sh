#!bin/hash


source challenge/functions.sh
# Ensure Script fails fast on error

set -e

#### DEBUT DU CHALLENGE #####

setup_challenge

echo

### CHALLENGE 01 - CREER UN PORTEFEUILLE POUR SUIVRE VOTRE AVENTURE ###
echo " ------------------------------------------------------"
echo "| Challenge 01 - Créez votre portefeuille d'exploration |"
echo " ------------------------------------------------------"
## Votre tâche ici est d'utiliser bitcoin-cli pour créer le portefeuille d'exploration nommé "lnbootcampctn"
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS


ensure_wallet_available "lnbootcampctn" false

echo "Créez votre portefeuille 'tresor' contenant les trésors cachés"
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS

ensure_wallet_available "tresor" false

echo "Générez une adresse dans le portefeuille tresor"
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS :tapez la commande bitcoin CLI dans la parenthèse
ADDRESS=$()

if [[ "$ADDRESS" =~ ^bcrt1[ac-hj-np-z02-9]{8,87}$ ]]; then
    echo "✅ Adresse bitcoin générée!"
else
    echo "❌ Votre adresse n'est pas valide. Vérifiez votre commande."
    exit 1
fi

echo "Adresse de minage : $ADDRESS"

mine_blocks 100 $ADDRESS

echo  "Nous venons de recharger votre portefeuille d'exploration"

## Découvrez solde de votre portefeuille d'exploration
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS
SOLDE=$()

check_cmd "Vérification de solde"

echo "Votre solde intiale est de $SOLDE btc"
echo "Vous êtes prêt pour l'aventure !"

## Générez les différents types d'adresse pour collecter vos trésors dans votre portefeuille d'exploration
echo " ------------------------------------------------------"

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

echo 
### CHALLENGE 02 - CREER UN PORTEFEUILLE POUR SUIVRE VOTRE AVENTURE ###
echo " --------------------------------------"
echo "| Challenge 02 - COllectez vos tresors |"
echo " --------------------------------------"

echo "Repartissez vos fonds dans les différents types d'adresses pour collecter vos trésors"

## 1 BTC sera envoyé à l'adresse Legacy
##  2 BTC sera envoyé à l'adresse P2SH
##  3 BTC sera envoyé à l'adresse SegWit
##  5 BTC sera envoyé à l'adresse Taproot

# ECRIVEZ VOTRE SOLUTION SUR LES LIGNES CI-DESSOUS

TXID_LEGACY=$()
check_cmd "Envoi de 1 BTC à l'adresse Legacy"


TXID_P2SH=$()
check_cmd "Envoi de 2 BTC à l'adresse P2SH"

TXID_SEGWIT=$()
check_cmd "Envoi de 3 BTC à l'adresse SegWit"

TXID_TAPROOT=$(bitcoin-cli -regtest -rpcwallet=tresor sendtoaddress $TAPROOT_ADDRESS 5)
check_cmd "Envoi de 5 BTC à l'adresse Taproot"

mine_blocks 20 $ADDRESS
echo "Vous avez découvert de nouveaux tresors" 
echo "Calculez le solde de votre portefeuille d'exploration"
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS

NEW_BALANCE=$(bitcoin-cli -regtest -rpcwallet=lnbootcampctn getbalance)

check_cmd "Vérification de solde après minage"
echo "Votre solde est maintenant de $NEW_BALANCE btc"


echo "Combien de de nouveaux BTC avez-vous collecté dans votre portefeuille d'exploration ?"
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS
COLLECTED=$(echo "$NEW_BALANCE - $SOLDE" | bc )

check_cmd "Calcul du montant collecté"

if [ "$(echo $COLLECTED == 0 | bc -l)" -eq 1 ]; then
    echo "❌ Vous n'avez pas collecté de BTC. Vérifiez vos transactions."
    exit 1
fi

echo " Youpi ! Vous avez collecté $COLLECTED BTC dans votre portefeuille d'exploration !"

echo " ✅ Vous êtes prêt pour la suite de l'aventure !"

echo 

### CHALLENGE 03 - UTXO et TRANSACTIONS ###
echo " --------------------------------------------"
echo "| Challenge 03 - MODELE UTXO et TRANSACTIONS | "
echo " --------------------------------------------"

## Ci dessous, retrouvez une transaction qu'un ancien explorateur a réalisé
# Vous devez la décoder pour comprendre comment elle fonctionne
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS


RAW_TX="01000000000101c8b0928edebbec5e698d5f86d0474595d9f6a5b2e4e3772cd9d1005f23bdef772500000000ffffffff0276b4fa0000000000160014f848fe5267491a8a5d32423de4b0a24d1065c6030e9c6e000000000016001434d14a23d2ba08d3e3edee9172f0c97f046266fb0247304402205fee57960883f6d69acf283192785f1147a3e11b97cf01a210cf7e9916500c040220483de1c51af5027440565caead6c1064bac92cb477b536e060f004c733c45128012102d12b6b907c5a1ef025d0924a29e354f6d7b1b11b5a7ddff94710d6f0042f3da800000000"


## Combien de sorties (outputs) cette transaction a-t-elle ?
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS
OUTPUTS=$()

check_cmd "Nombre de sorties de la transaction"


echo "Cette transaction a $OUTPUTS sorties"

## Quelle est la valeur de la première sortie (output) ?
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS
FIRST_OUTPUT_VALUE=$()
check_cmd "Valeur de la première sortie"
echo "La valeur de la première sortie est de $FIRST_OUTPUT_VALUE BTC"

## A quelle adresse la deuxième sortie a t-elle été envoyée ?
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS
SECOND_OUTPUT_ADDRESS=$()

check_cmd "Adresse de la deuxième sortie"
echo "La deuxième sortie a été envoyée à l'adresse : $SECOND_OUTPUT_ADDRESS"

## Construisez une transaction qui envoie 2100000 satoshis à cette adresse : 2MvLcssW49n9atmksjwg2ZCMsEMsoj3pzUP

# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS
RAW_TX_DECODED=$()

RAW_TXID=$(echo "$RAW_TX_DECODED" | jq -r '.txid')

VOUT_1=$(echo "$RAW_TX_DECODED" | jq -r '.vout[0].n')
VOUT_2=$(echo "$RAW_TX_DECODED" | jq -r '.vout[1].n')
TX=$()


check_cmd "Construction de la transaction"


## Signez la transaction avec votre portefeuille d'exploration
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS
SIGNED_TX=$()

check_cmd "Signature de la transaction"

## Quelle est l'ID de la transaction signée ?
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS

TXID=$()

check_cmd "ID de la transaction signée"
echo 
echo "L'ID de la transaction signée est : $TXID"

echo "Vous avez réussi à décoder la transaction et à en créer une nouvelle !"


echo 


### CHALLENGE 04 - BLOCKCHAIN ###
echo " ---------------------------"
echo "| Challenge 03 - BLOCKCHAIN |"
echo " ---------------------------"

## Quelle est la hauteur du dernier bloc de la blockchain ?
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS
LAST_BLOCK_HEIGHT=$()
check_cmd "Hauteur du dernier bloc"
echo "La hauteur du dernier bloc est : $LAST_BLOCK_HEIGHT"

## Quelle est la taille du dernier bloc de la blockchain ?
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS
LAST_BLOCK_SIZE=$()
check_cmd "Taille du dernier bloc"
echo "  La taille du dernier bloc est : $LAST_BLOCK_SIZE octets"

## Quelle est la difficulté du dernier bloc de la blockchain ?
# ECRIVEZ VOTRE SOLUTION SUR LA LIGNE CI-DESSOUS
LAST_BLOCK_DIFFICULTY=$()
check_cmd "Difficulté du dernier bloc"
echo "La difficulté du dernier bloc est : $LAST_BLOCK_DIFFICULTY"



