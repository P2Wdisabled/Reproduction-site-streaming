/*  Composant Film */


/* on charge le template du composant Film */
let template = "<option value='{{titre}}'>{{titre}}</option>";

/* on crée un objet Film vide qui va symboliser notre composant */
let Film = {}; 

/*  Film.format
    @param obj: object, un objet JS contenant les données à injecter dans le template
    @return string, le template HTML formaté avec les données de l'objet
*/
Film.format =  function(obj) {
    let html = template;
    html = html.replaceAll('{{titre}}', obj.titre);
    return html;
}

/*  Film.render
    @param selector: string, un sélecteur CSS pour cibler l'élément de la page où placer le composant une fois formaté
    @param data: array, un tableau d'un ou plusieurs objets javascript, chacun décrivant les données d'un Film.
    Le format attendu pour chaque objet est : {entree: string, plat: string, dessert: string}

    Note : pour async et await, voir les explications dans le fichier js/utils.js
*/
Film.render = async function(selector, data){
    // on formate un composant Film pour chaque objet du tableau
    let html = '';
    for(let obj of data){
        html += Film.format(obj); // on concatène (mettre bout à bout) les HTML des composants formatés  
    }
    // on injecte le HTML dans le DOM
    let where = document.querySelector(selector); // on cible l'élément où injecter le HTML
    where.innerHTML =  html; // on ajoute le HTML à la fin du contenu de l'élément ciblé par le sélecteur
}

// on exporte le composant Film pour pouvoir l'utiliser ailleurs dans un autre modules JS
export {Film}

// Note : seul Film est exporté (et donc Film.render et Film.format)
// La variable template n'est pas exportée, elle n'est donc pas accessible depuis l'extérieur (et c'est tant mieux)

/*  Composant Categorie */


/* on charge le template du composant Categorie */
let template2 = "<option value='{{id}}'>{{titre}}</option>";

/* on crée un objet Categorie vide qui va symboliser notre composant */
let Categorie = {}; 

/*  Categorie.format
    @param obj: object, un objet JS contenant les données à injecter dans le template
    @return string, le template HTML formaté avec les données de l'objet
*/
Categorie.format =  function(obj) {
    let html = template2;
    html = html.replaceAll('{{id}}', obj.id_categorie);
    html = html.replaceAll('{{titre}}', obj.labelle);
    return html;
}

/*  Categorie.render
    @param selector: string, un sélecteur CSS pour cibler l'élément de la page où placer le composant une fois formaté
    @param data: array, un tableau d'un ou plusieurs objets javascript, chacun décrivant les données d'un Categorie.
    Le format attendu pour chaque objet est : {entree: string, plat: string, dessert: string}

    Note : pour async et await, voir les explications dans le fichier js/utils.js
*/
Categorie.render = async function(selector, data){
    // on formate un composant Categorie pour chaque objet du tableau
    let html = "";
    for(let obj of data){
        html += Categorie.format(obj); // on concatène (mettre bout à bout) les HTML des composants formatés  
    }
    // on injecte le HTML dans le DOM
    let where = document.querySelector(selector); // on cible l'élément où injecter le HTML
    where.innerHTML =  html; // on ajoute le HTML à la fin du contenu de l'élément ciblé par le sélecteur
}

// on exporte le composant Categorie pour pouvoir l'utiliser ailleurs dans un autre modules JS
export {Categorie}

// Note : seul Categorie est exporté (et donc Categorie.render et Categorie.format)
// La variable 2 n'est pas exportée, elle n'est donc pas accessible depuis l'extérieur (et c'est tant mieux)