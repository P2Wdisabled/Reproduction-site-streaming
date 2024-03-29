let getmovies = async function(){
  // attente de la réponse à la requête demandant les données d'une collection de Lego
  let response = await fetch("../server/script.php?action=getmovies");
  // attente de l'extration des données en format json de la réponse à la requête
  let data = await response.json();
  Films.render('.films-container', data);
}