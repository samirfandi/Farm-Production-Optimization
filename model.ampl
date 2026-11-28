# Samir FANDI  

# ------------------------------------------<Projet-ML>-----------------------------------------

# Ensembles
set PARCELLES;
set CULTURES;

# Parametres
param rendement_horaire{PARCELLES, CULTURES} ;
param cout_horaire_exploitation_parcelle {PARCELLES} ;

param COUT_MAX_EXP;
param NB_HEURES_MAX_PARCELLE;
param NB_HEURES_MAX_EXP;


param PRIX_CEREALES := 0.5;
param PRIX_FRUITS := 2.5;
param PRIX_LEGUMES := 5.8;
param MAX_PROD_CEREALES_PARCELLE := 90;

param MAX_PROD_FRUITS_PARCELLE := 80;
param MAX_PROD_LEGUMES_PARCELLE := 120;
param MAX_PROD_CEREALES := 2500;

param MAX_PROD_FRUITS := 1200;
param MAX_PROD_LEGUMES := 2000;
param MAX_HEURES_LIAISON := 80;

#variables
var heures_parcelle {PARCELLES} integer >= 0;
var est_exploitee {PARCELLES} binary;

# bénéfice
maximize benefice :
    sum {p in PARCELLES} (rendement_horaire[p, "cereales"] * heures_parcelle[p] * PRIX_CEREALES  
                       + rendement_horaire[p, "fruits"] * heures_parcelle[p] * PRIX_FRUITS
                       + rendement_horaire[p, "legumes"] *heures_parcelle[p]*  PRIX_LEGUMES)
    - sum {p in PARCELLES} (cout_horaire_exploitation_parcelle[p] * heures_parcelle[p]);


#Contraintes

# limite sur le cout total d'exploitation :
subject to cout_total_exploitation :
    sum {p in  PARCELLES} cout_horaire_exploitation_parcelle[p] * heures_parcelle[p] <= COUT_MAX_EXP;


# limite sur le temps de travail pour chaque parcelle :
subject to max_heures_parcelle {p in PARCELLES}:
    heures_parcelle[p] <= NB_HEURES_MAX_PARCELLE;

# limite sur le temps total d'exploitation :
subject to max_heures_parcelles :
    sum {p in PARCELLES} heures_parcelle[p] <= NB_HEURES_MAX_EXP;

# limite sur la quantité de production cereales pour chaque parcelle :
subject to max_prod_cereales_parcelle {p in PARCELLES} :
    heures_parcelle[p] * rendement_horaire[p, "cereales"] <= MAX_PROD_CEREALES_PARCELLE;

# limite sur la quantité de production fruits pour chaque parcelle :
subject to max_prod_fruits_parcelle {p in PARCELLES} :
    heures_parcelle[p] * rendement_horaire[p, "fruits"] <= MAX_PROD_FRUITS_PARCELLE;

# limite sur la quantité de production legumes pour chaque parcelle :
subject to max_prod_legumes_parcelle {p in PARCELLES} :
    (heures_parcelle[p] * rendement_horaire[p, "legumes"]) <= MAX_PROD_LEGUMES_PARCELLE;

# limite sur la quantité de production total de cereales :
subject to max_prod_cereales :
    sum {p in PARCELLES} (heures_parcelle[p] * rendement_horaire[p, "cereales"]) <= MAX_PROD_CEREALES;

# limite sur la quantité de production total de fruits :
subject to max_prod_fruits :
    sum {p in PARCELLES} (heures_parcelle[p] * rendement_horaire[p, "fruits"]) <= MAX_PROD_FRUITS;

# limite sur la quantité de production total de legumes :
subject to max_prod_legumes :
    sum {p in PARCELLES} (heures_parcelle[p] * rendement_horaire[p, "legumes"]) <= MAX_PROD_LEGUMES;

# Q1 : solution optimal trouvée : 3816.253012
# Q2 : solution optimal trouvée :  3807.71

# les parcelles exploitees :
subject to parcelle_est_exploitee1 {p in PARCELLES}:
    heures_parcelle[p] <= MAX_HEURES_LIAISON * est_exploitee[p];

subject to parcelle_est_exploitee2 {p in PARCELLES}:
    heures_parcelle[p] >= est_exploitee[p];

# Q5 : set {p in PARCELLES: est_exploitee[p] == 1}  := A E F G I J L;
# Q6 : traverser des parcelles non exploitees : D, B, C, H, K