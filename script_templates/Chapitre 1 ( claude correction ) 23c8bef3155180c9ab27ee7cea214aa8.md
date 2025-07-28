# Chapitre 1 ( claude correction )

# Chapitre 1 : Le Bosquet - Structure des séquences

## Tableau général des séquences

| Ordre | Nom de la séquence | Type | Déclencheur | Instinct dominant | PV impact | Mutations possibles | Objets/Infos |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | **Réveil dans le bosquet** | Exploration | Obligatoire (début) | Intuition | Aucun | Aucune | Découverte du monde |
| 2 | **Rencontre avec l'animal** | Social | Si Lien ≥ X succès lors séq. 1 | Lien | +1 si réussi | Lien → Séduisant | Petit singe compagnon |
| 3 | **Église abandonnée** | Exploration | Si Intuition ≥ X succès lors séq. 1 | Intuition | Aucun | Intuition → Aventurière | Indices sur l'histoire |
| 4 | **Soldat déserteur (Algor)** | Combat/Social (choix) | Obligatoire | Adversité OU Lien | -2 à -4 selon choix | Adversité → Protecteur OU Lien → Séduisant | Arme de fortune |
| 5 | **Maison et affiche du monstre** | Exploration | Obligatoire (fin de zone) | Intuition | Aucun | **Crise d'Identité** obligatoire | Révélation sur soi |

---

## Séquence 1 : Réveil dans le bosquet

### Informations générales

- **Type :** Exploration
- **Déclencheur :** Début automatique du jeu
- **Instinct dominant :** Intuition
- **Objectif :** Découvrir l'environnement et s'orienter
- **PV Impact :** Aucun
- **Durée estimée :** 3-5 actions

### Actions disponibles selon les paliers

| Palier | Succès requis | Actions débloquées | Effets |
| --- | --- | --- | --- |
| **1 (Primitif)** | 1-2 succès | Observer, Fouiller | Descriptions basiques, 1 indice |
| **2 (Éveillé)** | **Exactement 3 ou 4 succès** | Observer, Fouiller, Analyser | Descriptions détaillées, 2-3 indices, déblocage séquences conditionnelles |
| **3 (Transcendé)** | **Exactement 5 ou 6 succès** | Toutes + Pressentir | Descriptions complètes, tous indices, vision prophétique, **RISQUE de crise de transcendance** |

### Tableau des interactions détaillées

| Action choisie | Palier requis | Texte déclenché | Conséquences | Déblocage |
| --- | --- | --- | --- | --- |
| **Observer** (environnement) | 1+ | "Tu te réveilles dans..." | Orientation de base | Toujours disponible |
| **Observer** (détails) | **Exactement 3+ succès** | "Tes sens aiguisés remarquent..." | +1 indice sur l'animal proche | **Débloque séquence 2** |
| **Fouiller** (sol) | **1+ succès** | "Tes mains cherchent..." | Trouve des baies, +1 PV | Aucun |
| **Fouiller** (arbres) | **Exactement 3+ succès** | "Les branches révèlent..." | Trouve traces de passage vers l'église | **Débloque séquence 3** |
| **Analyser** (traces) | **Exactement 3+ succès** | "Ces marques suggèrent..." | Comprend la géographie locale | Bonus pour séquence 4 |
| **Pressentir** (danger) | **Exactement 5+ succès** | "Une tension dans l'air..." | Vision d'Algor qui approche | Avantage dans séquence 4 |

### Conditions de sortie

- **Minimum :** 1 action réussie (Observer environnement)
- **Optimal :** 3+ actions pour débloquer séquences conditionnelles
- **Maximum :** Toutes actions + Pressentir

### Crises possibles

- **0 succès :** Crise d'incompétence → Mini-jeu "Retrouver ses sens"
- **6+ succès :** Crise de transcendance → Mini-jeu "Visions écrasantes"

---

## Séquence 2 : Rencontre avec l'animal

### Informations générales

- **Type :** Social
- **Déclencheur :** Avoir observé les détails (**3+ succès**) dans séquence 1
- **Instinct dominant :** Lien
- **Objectif :** Apprivoiser le petit singe à pique
- **PV Impact :** +1 si succès, -1 si échec critique
- **Durée estimée :** 2-4 actions

### Actions disponibles selon les paliers

| Palier | Succès requis | Actions débloquées | Effets |
| --- | --- | --- | --- |
| **1 (Primitif)** | 1-2 succès | Écouter, Questionner | Communication basique |
| **2 (Éveillé)** | 3-4 succès | Écouter, Questionner, Apaiser | Le singe comprend tes intentions |
| **3 (Transcendé)** | 5-6 succès | Toutes + Séduire | Le singe devient dévoué, **RISQUE de manipulation** |

### Tableau des interactions détaillées

| Action choisie | Palier requis | Texte déclenché | Conséquences | Notes |
| --- | --- | --- | --- | --- |
| **Écouter** | 1+ | "Le petit singe émet..." | Comprend qu'il a faim | Ouvre l'action Nourrir |
| **Questionner** (gestes) | 1+ | "Tu mimes tes questions..." | Apprend où trouver de la nourriture | Déblocage nourriture |
| **Apaiser** | 2+ | "Tes gestes doux..." | Le singe s'approche | Réduction de la méfiance |
| **Nourrir** | Avoir nourriture | "Tu partages tes baies..." | Le singe te rejoint définitivement | Compagnon acquis |
| **Séduire** | 3+ | "Ton charisme naturel..." | Le singe devient obsédé par toi | Bonus dégâts mais dépendance |

### Conditions de sortie

- **Échec :** Le singe s'enfuit, pas de compagnon
- **Succès minimal :** Le singe reste neutre
- **Succès optimal :** Le singe devient compagnon (+1 dégât en combat)
- **Succès transcendé :** Compagnon dévoué mais dépendant

### Mutations possibles (peuvent se cumuler)

- **Si exactement 5+ succès en séquence 2 :** Lien → "Séduisant"
    - **Nouvelles actions :** "Charmer" (fascine l'adversaire pour 1 tour), "Flatter" (boost temporaire allié)
    - **Actions modifiées :** "Questionner" → "Interroger avec charme" (+informations)
    - **Effet passif :** Premier contact social toujours favorable
- **Si séquence 2 + séquence 4 social (cumul 8+ succès Lien) :** Lien → "Manipulateur"
    - **Remplace "Séduisant"**
    - **Nouvelles actions :** "Manipuler émotions" (contrôle temporaire), "Chantage affectif"
    - **Actions modifiées :** Toutes les actions sociales gagnent une option "manipulatrice"
    - **Effet passif :** Peut forcer 1 choix par chapitre chez un PNJ
    - **Malédiction :** -1 PV si refuse de manipuler quand l'option est disponible

---

## Séquence 3 : Église abandonnée

### Informations générales

- **Type :** Exploration
- **Déclencheur :** Avoir fouillé les arbres (**3+ succès**) dans séquence 1
- **Instinct dominant :** Intuition
- **Objectif :** Explorer l'église et découvrir son histoire
- **PV Impact :** Aucun direct, mais peut donner des bonus
- **Durée estimée :** 4-6 actions

### Actions disponibles selon les paliers

| Palier | Succès requis | Actions débloquées | Effets |
| --- | --- | --- | --- |
| **1 (Primitif)** | 1-2 succès | Observer, Fouiller | Exploration de surface |
| **2 (Éveillé)** | 3-4 succès | Observer, Fouiller, Analyser | Découvertes historiques |
| **3 (Transcendé)** | 5-6 succès | Toutes + Laisser une trace | Compréhension profonde + marquer le lieu |

### Tableau des interactions détaillées

| Action choisie | Palier requis | Texte déclenché | Conséquences | Objets/Infos |
| --- | --- | --- | --- | --- |
| **Observer** (architecture) | 1+ | "Les pierres usées racontent..." | Comprend l'âge du lieu | Info : Ancien culte |
| **Fouiller** (autel) | 1+ | "Sous la poussière, tu trouves..." | Découvre un symbole étrange | Indice sur la prophétie |
| **Fouiller** (crypte) | 2+ | "Les marches mènent vers..." | Accès à la crypte souterraine | Zone secrète |
| **Analyser** (symboles) | 2+ | "Ces marques signifient..." | Décrypte partiellement la prophétie | Info : Ton rôle |
| **Analyser** (architecture) | 2+ | "La construction révèle..." | Comprend les techniques anciennes | Bonus pour séquences futures |
| **Laisser une trace** | 3+ | "Tu graves tes cornes dans..." | Marque ton passage | Effet sur chapitres futurs |

### Conditions de sortie

- **Minimum :** 1 action d'observation
- **Complet :** Toutes les zones explorées + symboles analysés

### Mutations possibles

- **Si exactement 4+ succès :** Intuition → "Aventurière"
    - **Nouvelles actions :** "Explorer zone cachée" (accès à des lieux secrets), "Pister" (suivre des traces anciennes)
    - **Actions modifiées :** "Fouiller" devient "Fouille experte" (trouve toujours quelque chose d'utile)
    - **Effet passif :** Déblocage automatique de 1 séquence optionnelle par chapitre

---

## Séquence 4 : Soldat déserteur (Algor)

### Informations générales

- **Type :** Combat OU Social (choix du joueur)
- **Déclencheur :** Obligatoire après séquences précédentes
- **Instinct dominant :** Adversité (combat) OU Lien (social)
- **Objectif :** Survivre à la rencontre avec Algor
- **PV Impact :** -2 à -4 selon approche
- **Durée estimée :** 3-5 actions

### Choix d'approche initial

| Approche choisie | Instinct utilisé | Avantages | Risques |
| --- | --- | --- | --- |
| **Combat** | Adversité | Résolution rapide, gain d'arme | Perte de PV importante, Algor meurt |
| **Social** | Lien | Préserve les PV, informations obtenues | Plus long, risque de basculement en combat |

### Branch Combat - Actions disponibles

| Palier | Succès requis | Actions débloquées | Effets |
| --- | --- | --- | --- |
| **1 (Primitif)** | 1-2 succès | Attaquer, Se défendre | Combat basique |
| **2 (Éveillé)** | 3-4 succès | Attaquer, Se défendre, Intimider | Démoralise Algor |
| **3 (Transcendé)** | 5-6 succès | Toutes + Furie | Combat écrasant mais **RISQUE de perte de contrôle** |

### Branch Social - Actions disponibles

| Palier | Succès requis | Actions débloquées | Effets |
| --- | --- | --- | --- |
| **1 (Primitif)** | 1-2 succès | Écouter, Questionner | Communication difficile |
| **2 (Éveillé)** | 3-4 succès | Écouter, Questionner, Apaiser | Algor se confie |
| **3 (Transcendé)** | 5-6 succès | Toutes + Manipuler | Contrôle total d'Algor mais **RISQUE de corruption** |

### Tableau des interactions - Combat

| Action choisie | Palier requis | Texte déclenché | Dégâts infligés | Dégâts reçus | Notes |
| --- | --- | --- | --- | --- | --- |
| **Attaquer** (basique) | 1+ | "Tes griffes trouvent..." | 3 PV | 2 PV | Algor : 8 PV → 5 PV |
| **Se défendre** | 1+ | "Tu pares le coup..." | 0 PV | 1 PV | Réduit les dégâts |
| **Intimider** | 2+ | "Ton regard féroce..." | 0 PV | 0 PV | Algor perd 1 action |
| **Attaquer** (combo) | 2+ | "Tu enchaînes sauvagement..." | 5 PV | 1 PV | Plus efficace |
| **Furie** | 3+ | "La rage t'envahit..." | 8 PV | 0 PV | Algor meurt, **CRISE possible** |

### Tableau des interactions - Social

| Action choisie | Palier requis | Texte déclenché | Effet sur Algor | Infos obtenues | Notes |
| --- | --- | --- | --- | --- | --- |
| **Écouter** | 1+ | "Tu perçois sa fatigue..." | +1 confiance | Sa désertion | Ouvre Questionner |
| **Questionner** (guerre) | 1+ | "Tu demandes pourquoi..." | +0 confiance | Infos sur le conflit | Contexte général |
| **Questionner** (monstre) | 2+ | "Tu l'interroges sur la prophétie..." | -1 confiance | Infos sur ta nature | Révélation importante |
| **Apaiser** | 2+ | "Tes mots le calment..." | +2 confiance | Sa blessure | Algor révèle sa faiblesse |
| **Manipuler** | 3+ | "Tu exploites sa culpabilité..." | +3 confiance | Tout | Algor devient allié, **CRISE morale possible** |

### Conditions de sortie

### Combat

- **Algor à 0 PV :** Victoire, gain d'arme de fortune (+1 dégât)
- **Joueur à ≤2 PV :** **CRISE de survie** déclenchée

### Social

- **Confiance ≥3 :** Algor part en paix, donne des informations
- **Confiance ≤-2 :** Bascule en combat forcé
- **Confiance entre -1 et 2 :** Fin neutre

### Mutations possibles

- **Combat + exactement 4+ succès :** Adversité → "Protecteur"
    - **Nouvelles actions :** "Protéger autrui" (réduit dégâts d'un allié), "Sacrifice héroïque" (prendre les dégâts à la place d'un autre)
    - **Actions modifiées :** "Se défendre" devient "Défense absolue" (+50% efficacité)
    - **Effet passif :** +1 PV quand un allié est menacé
- **Social + exactement 4+ succès :** Lien → "Séduisant"
    - **Nouvelles actions :** "Charmer" (fascinant l'adversaire pour 1 tour), "Flatter" (augmente temporairement les stats d'un allié)
    - **Actions modifiées :** "Questionner" devient "Interroger avec charme" (obtient plus d'informations)
    - **Effet passif :** Premier contact social toujours favorable

---

## Séquence 5 : La maison et l'affiche du monstre

### Informations générales

- **Type :** Exploration + Crise narrative obligatoire
- **Déclencheur :** Obligatoire (fin de chapitre)
- **Instinct dominant :** Intuition
- **Objectif :** Découvrir l'affiche et déclencher la crise d'identité
- **PV Impact :** Selon résultat de la crise
- **Durée estimée :** Actions libres + Mini-jeu de crise

### Phase d'exploration libre

- **Actions disponibles :** Toutes actions d'Intuition selon palier
- **Objectif :** Explorer la maison jusqu'à trouver l'affiche
- **Fin automatique :** Quand l'affiche est découverte

### **CRISE D'IDENTITÉ** (Mini-jeu obligatoire)

### Déclencheur

- Automatique lors de la découverte de l'affiche du monstre

### Mini-jeu : "Assembler des fragments de mémoire"

- **Mécanisme :** Glisser-déposer des fragments d'images/texte pour reconstituer des souvenirs
- **Temps limité :** 60 secondes
- **Difficulté :** Adaptée aux succès obtenus dans les séquences précédentes

### Résultats possibles

| Performance | Condition | Gain | Perte | Effet narratif |
| --- | --- | --- | --- | --- |
| **Échec critique** | 0 fragments | +0 instinct | -2 PV | Vision traumatisante, rejet de l'identité |
| **Échec** | 1-2 fragments | +0 instinct | -1 PV | Confusion, déni partiel |
| **Succès minimal** | 3-4 fragments | +1 instinct au choix | 0 PV | Acceptation difficile |
| **Succès** | 5-6 fragments | +1 instinct au choix | +1 PV | Compréhension et acceptation |
| **Succès parfait** | 7+ fragments | +2 instincts au choix | +2 PV | Révélation libératrice, vision prophétique |

### Fin du chapitre

- **Dialogue avec Élise :** Apparition automatique après la crise
- **Transition :** Élise commente les choix du joueur et introduit le chapitre 2

---

## Récapitulatif - États finaux possibles

### Statistiques de fin de chapitre

| Élément | Minimum | Maximum | Notes |
| --- | --- | --- | --- |
| **PV** | 2 (plusieurs échecs) | 11 (tous succès) | Base 8 +/- actions |
| **Instincts** | 5d6 de base | 7d6 (crise parfaite) | Répartition variable |
| **Compagnons** | 0 | 1 (petit singe) | Si séquence 2 réussie |
| **Objets** | 0 | 2 (arme + traces église) | Selon parcours |
| **Mutations** | 0 | 2 (Lien + autre) | Selon performances |

### Branching vers Chapitre 2

- **Compagnon :** Affecte les séquences sociales
- **Mutations :** Ouvrent de nouvelles options
- **PV bas :** Démarrage difficile au village
- **Informations obtenues :** Modifient les dialogues disponibles