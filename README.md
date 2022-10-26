# Proposition du choix des données

Après avoir effectué nos recherches de datasets chacun de notre côté et comparé nos centres d'intéret, nous nous sommes arrêté sur un sujet : les inégalités dans le monde.
Nous allons présenter ici les données choisies et notre plan d'analyse.


# World Inequality Database
***

## Sommaire 

- [Présentation des données](#présentation-des-données)
  1. [Aperçu des données](#aperçu-des-données)
  2. [Les variables](#les-variables)
  3. [Un exemple de données](#un-exemple-de-données)

- [Plan d'analyse](#plan-d-analyse)
  1. [Nos interrogations](#nos-interrogations)
  2. [Limites du dataset](#limites-du-dataset)

***
## Présentation des données 
***

### Aperçu des données

Les données correspondent à une combinaison de plusieurs sources de données sur les inégalités dans le monde : comptes nationaux, enquêtes, données fiscales et classements de richesse. D'après les chercheurs à l'origine de ce dataset, cela permet d'avoir un suivi de l'évolution plus précis et à tout les niveaux des richesses dans le monde.

Les données sont accessibles sur le site [WID](https://wid.world/data/).

#### Le dataset complet
Le dataset complet est composé de nombreux fichiers.

Le fichier WID_countries.csv qui contient 5 variables et 346 observations (une par pays) :

* alpha2: le code à 2 lettres du pays/région

* titlename: le nom du pays/région

* shortname: le nom du pays/région (plus court)

* region: région du monde à laquelle le pays appartient

* region2: région plus précise du monde à laquelle le pays appartient

Les fichers WID_data_XX.csv pour chaque pays qui contiennent chacun 7 variables et un nombre d'observations très variable en fonction des pays:

* country: code pays/region (voir WID_countries.csv)

* variable: WID code pour les variables (détaillés plus loin)

* percentile: WID code pour les pourcentages (détaillés plus loin)

* year: l'année de cette donnée (de 1800 à 2019)

* value: la valeur de cette donnée

* age: code indiquant le groupe d'âge auquel la donnée fait référence

* pop: code indiquant l'unité de population auquel la donnée fait référence

Les fichiers WID_metadata_XX.csv qui contiennent chacun 17 variables précisant pour chaque fichier des descriptions précises de chaque variable du dataset,l'unités, la source et la méthode utilisée pour chaque observation.

La signification de chaque variable est donc décrite dans les fichers metadata. Le code WID pour les variables répond à la logique suivante:

* la première lettre indique le type de variable (ex: "s" pour share)

* les 5 lettres suivantes indiquent le type revenu/richesse/autre (ex: "ptinc" pour pre-tax national income)

* les 3 nombres suivants indiquent le groupe d'âge (ex: "992" pour adultes)

* la dernière lettre indique l'unité de population 

Il y a 2 types de pourcentages utilisés par WID.world : (1) pourcentages de groupe et (2) pourcentages généraux. L'interprétation du revenu (ou richesse) va dépendre de ces pourcentages.

Les pourcentages de groupe sont définis ainsi : p0p50 (bottom 50% of the population), p50p90 (next 40%), p90p100 (top 10%), p99p100 (top 1%), p0p10 (bottom 10% of the population, i.e. first decile), p10p20 (next 10%, i.e. second decile), p20p30 (next 10%, i.e. third decile), p30p40 (next 10%, i.e. fourth decile), p40p50 (next 10%, i.e. fifth decile), p50p60 (next 10%, i.e. sixth decile), p60p70 (next 10%, i.e. seventh decile), p70p80 (next 10%, i.e. eighth decile), p80p90 (next 10%, i.e. ninth decile), p0p90 (bottom 90%), p0p99 (bottom 99% of the population), p99.9p100 (top 0.1%), p99.99p100 (top 0.01%).

Les pourcentages généraux sont définis ainsi: p0, p1, p2, ..., p99.99, p99.991, p99.992 ,..., p99.999. Il y a 197 pourcentages au total.

#### Le dataset prétraité
Comme on peut le constater, le dataset complet contient beaucoup de données très précises mais difficiles à analyser sans prétraitement.

Cependant WID.world met à disposition un outil permettant d'obtenir des datasets personnalisés en choisissant les variables, pays/région ou années qui nous intéressent.
Nous avons testé cet outil avec un premier dataset contenant toutes les données sur la France.

### Les variables

Les pricipales variables par pays et par année sont :

**Per adult national income** (Decimal) : Le revenu national vise à mesurer le revenu total dont disposent les résidents d'un pays donné. Il est égal au produit intérieur brut, moins le capital fixe utilisé dans les processus de production, plus le revenu étranger net gagné par les résidents dans le reste du monde. L'économie nationale - au sens de la comptabilité nationale - comprend tous les secteurs domestiques, c'est-à-dire toutes les entités qui résident dans un pays donné (au sens de leur activité économique), qu'elles appartiennent au secteur privé, au secteur des entreprises, au secteur des administrations publiques. La population est composée des individus âgés de plus de 20 ans. L'unité de base est l'individu (plutôt que le ménage). Cela revient à supposer qu'il n'y a pas de partage des ressources au sein des couples.

**Per adult GDP** (Decimal) : Le produit intérieur brut est la valeur totale des biens et services produits par l'économie nationale. L'économie nationale - au sens de la comptabilité nationale - comprend tous les secteurs intérieurs, c'est-à-dire toutes les entités qui résident dans un pays donné (au sens de leur activité économique), qu'elles appartiennent au secteur privé, au secteur des entreprises, au secteur des administrations publiques. La population est composée des individus âgés de plus de 20 ans. L'unité de base est l'individu (plutôt que le ménage). Cela revient à supposer qu'il n'y a pas de partage des ressources au sein des couples.

**Income Inequality** (Decimal) : Le revenu national avant impôt est la somme de tous les flux de revenu personnel avant impôt revenant aux propriétaires des moyens de production, à savoir le travail et le capital, avant de prendre en compte le fonctionnement du système d'imposition/transfert, mais après avoir pris en compte le fonctionnement du système de retraite. La différence centrale entre le revenu personnel des facteurs et le revenu avant impôt est le traitement des pensions, qui sont comptabilisées sur une base de contribution par source de  revenu et sur une base de distribution par le revenu avant impôt. La population est constituée des individus âgés de plus de 20 ans. L'unité de base est l'unité fiscale définie par les administrations fiscales nationales pour mesurer l'impôt sur le revenu des personnes physiques.

- Top 10% share : Part des 10% supérieurs
- Middle 40% share : Part des 40% du milieu
- Bottom 50% share : Part des 50% inférieurs 
- Top 1% share : Part des 1% supérieurs

**Per adult national wealth** (Decimal) : La richesse nationale nette est la valeur totale des actifs (liquidités, logements, obligations, actions, etc.) détenus par l'économie nationale, moins ses dettes. L'économie nationale - au sens de la comptabilité nationale - comprend tous les secteurs domestiques, c'est-à-dire toutes les entités qui résident dans un pays donné (au sens de leur activité économique), qu'elles appartiennent au secteur privé, au secteur des entreprises, au secteur des administrations publiques. La population est composée des individus âgés de plus de 20 ans. L'unité de base est l'individu (plutôt que le ménage). Cela revient à supposer qu'il n'y a pas de partage des ressources au sein des couples.

**Wealth-income ratio** (Decimal) : Le rapport richesse-revenu est la division de la richesse nationale par le revenu national.

**Wealth Inequality** (Decimal) : Le patrimoine personnel net est la valeur totale des actifs non financiers et financiers (logement, terrains, dépôts, obligations, actions, etc.) détenus par les ménages, moins leurs dettes. . Le secteur des particuliers ou des ménages - au sens de la comptabilité nationale - comprend tous les ménages et les particuliers (y compris ceux vivant en institution), ainsi que les entreprises non constituées en société dont les comptes ne sont pas séparés de ceux des ménages qui les possèdent. La population est composée des individus âgés de plus de 20 ans. L'unité de base est l'individu (plutôt que le ménage) mais les ressources sont réparties de manière égale au sein des couples.

- Top 10% share : Part des 10% supérieurs
- Middle 40% share : Part des 40% du milieu
- Bottom 50% share : Part des 50% inférieurs 
- Top 1% share : Part des 1% supérieurs

### Un exemple de données (Pour la France)

**Year** (Année étudiée) : 2014

1. **Per adult national income** : 206741.8612 (EUR)
2. **Per adult GDP** : 40031.5172 (EUR)
3. **Income Inequality** (Top 10% share) : 0.3109 (part)
4. **Income Inequality** (Middle 40% share) : 0.4649 (part)
5. **Income Inequality** (Bottom 50% share) : 0.2243 (part)
6. **Income Inequality** (Top 1% share) : 0.0925 (part)
7. **Per adult national wealth** : 35541.7993 (EUR)
8. **Wealth-income ratio** : 5.8168702126 (ratio)
9. **Wealth Inequality** (Top 10% share) : 0.5528 (part)
10. **Wealth Inequality** (Middle 40% share) : 0.3838 (part)
11. **Wealth Inequality** (Bottom 50% share) : 0.0634 (part)
12. **Wealth Inequality** (Top 1% share) : 0.2338 (part)


## Plan d'analyse 
***

### Nos interrogations générales
* Y a-t-il une classe sociale parmis laquelle les inégalités de richesse et de revenus sont plus présentes ?
* Quels sont les pays qui comportent le moins/le plus d'inégalités parmi leur population ?
* Y a-t-il des régions du monde où les inégalités sont globalement plus/moins présentes que les autres ?
* Quels sont les pays qui ont le meilleur/le pire rapport richesse-revenu ?
* Y a-t-il une similitude entre les pays qui comportent le plus/le moins d'inégalités ?
* Certains pays ont-ils connu une augmentation/diminution significative de leurs richesses et leurs revenus ? 
* Certains pays ont-ils connu une baisse/une hausse conséquente des inégalités d'une certaine classe sociale ? Si oui, pourquoi ?
* D'une manière générale, comment ont évolué les inégalités et les richesses dans le monde depuis 1800 ? Voit-on des augmentations importantes aux années correspondantes aux révolution industrielles ?
* Comment les richesses des pays ont-elles évolués entre 1800 et 1900 ?
* Comment les richesses des pays ont-elles évolués entre 1900 et 2000 ?
* Comment les richesses des pays ont-elles évolués entre 2000 et 2019 ?

### Les interrogations en comparant plusieurs variables
* Comment évolue la corrélation entre les revenus des populations du monde (income) avec leur richesse (wealth) ?
* A quel degré sont corrélés ces deux indicateurs en fonction des groupes de populations sélectionnés ?
* Comment peut-on interpréter le PIB et le revenu national et comment évolue leur lien ?
* En choisissant deux pays diamétralement opposés sur UN critère, quelle est leur situation sur d'autres critères ?
* En ajoutant d'autres variables tel que la taille de la population, la part de la population salariée etc, comment interpréter les résultats de la confrontation avec les richesses du pays etc.

### Limites du dataset 
Notre dataset se résume à des données concernant les richesses et les revenus des populations du monde. Cependant, les inégalités se mesurent au moyen de nombreux autres facteurs de conditions de vie. Parmis elles, nous pouvont citer l'accès à l'eau potable, à l'alimentation, à l'éducation, à la santé, au logement et aux nouvelles technologies.
L'Indice de Développement Humain (IDH) mesure ces facteurs, et il pourrait être intéressant de le confronter aux indicateurs présents dans notre dataset, toujours dans le cadre de nos recherches sur les inégalités dans le monde. En effet, pays riche n'est pas toujours synonyme de pays développé.
Enfin, il faudra savoir tirer des conclusions quant aux causes de ces inégalités, qui peuvent être de natures différentes que celles exposées dans notre dataset : raisons historiques, environnementales, politiques etc.
