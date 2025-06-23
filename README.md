# Bitcoin Treasure Hunt Challenge 🏴‍☠️

Une aventure interactive pour maîtriser les commandes Bitcoin Core CLI.

## 🎯 Objectifs

Ce challenge vous guide à travers les concepts fondamentaux de Bitcoin via une série d'exercices pratiques:

- Gestion des portefeuilles Bitcoin
- Manipulation des différents types d'adresses
- Création et analyse de transactions
- Exploration de la blockchain

## 🛠️ Prérequis

- Bitcoin Core v28.0
- Ubuntu/Linux environment
- `jq` for JSON parsing
- `bc` for calculations

## 📥 Installation

1. Cloner le repo
2. Installer les dépendances:
```sh
sudo apt-get update && sudo apt-get install -y jq bc
```

3. Run the setup script:
```sh
sudo bash .github/setup.sh
```

##  Structure du Challenge

Le challenge est divisé en 4 parties:

### 1️⃣ Création de Portefeuilles

- Configuration du portefeuille "lnbootcampctn"
- Création du portefeuille "tresor"
- Génération des premières adresses


### 2️⃣ Chasse aux Trésors 
- Création d'adresses de différents types:
    - Legacy (P2PKH)
    - P2SH
    - SegWit (P2WPKH)
    - Taproot
- Transferts de BTC entre adresses

### 3️⃣  UTXO & Transactions
- Analyse de transactions brutes
- Construction de nouvelles transactions
- Gestion des UTXO


### 4️⃣ Blockchain Exploration
- Analyse des blocs
- Vérification des propriétés blockchain
- Étude de la difficulté

## Running the Challenge

Execute the challenge script:

```sh
bash challenge/test.sh
```

Le script vous indiquera les directives et vérifiera vos solutions tout au long de votre aventure.

## GitHub Actions

Ce repo inclus une pipeline CI/CD qui :
- Met en place un noeud Bitcoin Core
- Exécute votre script automatiquement à chaque push sur votre branche `main`
- Vérifie automatiquement vos solutions 
- Et vous génère le log de votre parcours pour narrer votre aventure.


## License

MIT License