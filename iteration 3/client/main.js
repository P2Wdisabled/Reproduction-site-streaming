let getmovies = async function(){
  let option = document.querySelector('.categorie-containers').value
  if (option == "all") {
    // attente de la réponse à la requête demandant les données d'une collection de Lego
    let response = await fetch("../server/script.php?action=getmovies");
    // attente de l'extration des données en format json de la réponse à la requête
    let data = await response.json();
    Films.render('.films-container', data);
  }else{
    // attente de la réponse à la requête demandant les données d'une collection de Lego
    let response = await fetch("../server/script.php?action=getmoviesbyid&idcategorie="+option);
    // attente de l'extration des données en format json de la réponse à la requête
    let data = await response.json();
    Films.render('.films-container', data);
  }
  
}


let showmovie = async function(idmovie){
  let response = await fetch("../server/script.php?action=getMovie&idmovie="+idmovie);
  // attente de l'extration des données en format json de la réponse à la requête
  let data = await response.json();
  Film.render('.films-container', data);
}


let getListCategorie = async function(){
  let response = await fetch("../server/script.php?action=getCategories");
  let data = await response.json();
  Categorie.render('.categorie-containers', data);
}

setTimeout(() => {
  getListCategorie();
}, 500);