/*  Composant Priorite */

/* on importe la fonction loadTemplate depuis le module /js/utils.js */
import { loadTemplate } from '../../js/utils.js';

/* on charge le template du composant Priorite */
let template = await loadTemplate('./component/priorite/template.html');

/* on crée un objet Priorite vide qui va symboliser notre composant */
let Priorite = {}; 

/*  Priorite.format
    @param obj: object, un objet JS contenant les données à injecter dans le template
    @return string, le template HTML formaté avec les données de l'objet
*/
Priorite.format =  function(obj) {
    let html = template;
    html = html.replaceAll('{{idmovie}}', obj.id_film);
    html = html.replace('{{image}}', obj.urlImage);
    html = html.replaceAll('{{titre}}', obj.titre);
    html = html.replace('{{rea}}', obj.realisateur);
    html = html.replace('{{annee}}', obj.annee);
    return html;
}

/*  Priorite.render
    @param selector: string, un sélecteur CSS pour cibler l'élément de la page où placer le composant une fois formaté
    @param data: array, un tableau d'un ou plusieurs objets javascript, chacun décrivant les données d'un Priorite.
    Le format attendu pour chaque objet est : {entree: string, plat: string, dessert: string}

    Note : pour async et await, voir les explications dans le fichier js/utils.js
*/
Priorite.render = async function(selector, data){
    // on formate un composant Priorite pour chaque objet du tableau
    let html = '';
    for(let obj of data){
        html += Priorite.format(obj); // on concatène (mettre bout à bout) les HTML des composants formatés  
    }
    // on injecte le HTML dans le DOM
    let where = document.querySelector(selector); // on cible l'élément où injecter le HTML
    where.innerHTML =  html; // on ajoute le HTML à la fin du contenu de l'élément ciblé par le sélecteur
}

// on exporte le composant Priorite pour pouvoir l'utiliser ailleurs dans un autre modules JS
export {Priorite}

// Note : seul Priorite est exporté (et donc Priorite.render et Priorite.format)
// La variable template n'est pas exportée, elle n'est donc pas accessible depuis l'extérieur (et c'est tant mieux)