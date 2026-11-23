# Samir FANDI  

# ------------------------------------------<Projet-ML>-----------------------------------------

# Ensembles
set PARCELLES;
set CULTURES;

# Parametres
param rendement_horaire{PARCELLES, CULTURES} ;
param cout_horaire_exploitation_parcelle {PARCELLES} ;

#variables
var heures_parcelle {PARCELLES} integer >= 0;
var est_exploitee {PARCELLES} binary;

# bénéfice
maximize benefice :
    sum {p in PARCELLES} (rendement_horaire[p, "cereales"] * heures_parcelle[p] * 0.5  
                       + rendement_horaire[p, "fruits"] * heures_parcelle[p] *2.5
                       + rendement_horaire[p, "legumes"] *heures_parcelle[p]*  5.8)
    - sum {p in PARCELLES} (cout_horaire_exploitation_parcelle[p] * heures_parcelle[p]);


#Contraintes

# limite sur le cout total d'exploitation :
subject to cout_total_exploitation :
    sum {p in  PARCELLES} cout_horaire_exploitation_parcelle[p] * heures_parcelle[p] <= 850;


# limite sur le temps de travail pour chaque parcelle :
subject to max_heures_parcelle {p in PARCELLES}:
    heures_parcelle[p] <= 80;

# limite sur le temps total d'exploitation :
subject to max_heures_parcelles :
    sum {p in PARCELLES} heures_parcelle[p] <= 300;

# limite sur la quantité de production cereales pour chaque parcelle :
subject to max_prod_cereales_parcelle {p in PARCELLES} :
    heures_parcelle[p] * rendement_horaire[p, "cereales"] <= 90;

# limite sur la quantité de production fruits pour chaque parcelle :
subject to max_prod_fruits_parcelle {p in PARCELLES} :
    heures_parcelle[p] * rendement_horaire[p, "fruits"] <= 80;

# limite sur la quantité de production legumes pour chaque parcelle :
subject to max_prod_legumes_parcelle {p in PARCELLES} :
    (heures_parcelle[p] * rendement_horaire[p, "legumes"]) <= 120;

# limite sur la quantité de production total de cereales :
subject to max_prod_cereales :
    sum {p in PARCELLES} (heures_parcelle[p] * rendement_horaire[p, "cereales"]) <= 2500;

# limite sur la quantité de production total de fruits :
subject to max_prod_fruits :
    sum {p in PARCELLES} (heures_parcelle[p] * rendement_horaire[p, "fruits"]) <= 1200;

# limite sur la quantité de production total de legumes :
subject to max_prod_legumes :
    sum {p in PARCELLES} (heures_parcelle[p] * rendement_horaire[p, "legumes"]) <= 2000;

# Q1 : solution optimal trouvée : 3816.253012
# Q2 : solution optimal trouvée :  3807.71

# les parcelles exploitees :
subject to parcelle_est_exploitee1 {p in PARCELLES}:
    heures_parcelle[p] <= 80 * est_exploitee[p];

subject to parcelle_est_exploitee2 {p in PARCELLES}:
    heures_parcelle[p] >= est_exploitee[p];

# Q5 : set {p in PARCELLES: est_exploitee[p] == 1}  := A E F G I J L;
