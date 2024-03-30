/*  Composant Commentaire */

/* on importe la fonction loadTemplate depuis le module /js/utils.js */
import { loadTemplate } from '../../js/utils.js';

/* on charge le template du composant Commentaire */
let template = await loadTemplate('./component/commentaires/template.html');

/* on crée un objet Commentaire vide qui va symboliser notre composant */
let Commentaire = {}; 

/*  Commentaire.format
    @param obj: object, un objet JS contenant les données à injecter dans le template
    @return string, le template HTML formaté avec les données de l'objet


    {{trailer}}
    <span>Titre : {{titre}}</span><br>
    <span>Réalisation {{rea}}</span><br>
    <span>date de sortie : {{annee}}</span><br>
*/
Commentaire.format =  function(obj) {
    let html = template;
    html = html.replace('{{date}}', obj.date);
    html = html.replaceAll('{{username}}', obj.nom);
    html = html.replace('{{commentaire}}', obj.commentaire);
    html = html.replace('{{note}}', obj.note);
    return html;
}

/*  Commentaire.render
    @param selector: string, un sélecteur CSS pour cibler l'élément de la page où placer le composant une fois formaté
    @param data: array, un tableau d'un ou plusieurs objets javascript, chacun décrivant les données d'un Commentaire.
    Le format attendu pour chaque objet est : {entree: string, plat: string, dessert: string}

    Note : pour async et await, voir les explications dans le fichier js/utils.js
*/
Commentaire.render = async function(data){
    // on formate un composant Commentaire pour chaque objet du tableau
    let html = '';
    if (data.length > 0) {
        for(let obj of data){
            html += Commentaire.format(obj); // on concatène (mettre bout à bout) les HTML des composants formatés  
        }   
    }
    // on injecte le HTML dans le DOM
    return html// on ajoute le HTML à la fin du contenu de l'élément ciblé par le sélecteur
}

// on exporte le composant Commentaire pour pouvoir l'utiliser ailleurs dans un autre modules JS
export {Commentaire}

// Note : seul Commentaire est exporté (et donc Commentaire.render et Commentaire.format)
// La variable template n'est pas exportée, elle n'est donc pas accessible depuis l'extérieur (et c'est tant mieux)