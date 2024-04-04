let getmovies = async function(starting=true){
  if (starting) {
    // attente de la réponse à la requête demandant les données d'une collection de Lego
    let response = await fetch("../server/script.php?action=getmovies");
    // attente de l'extration des données en format json de la réponse à la requête
    let data = await response.json();
    Films.render('.films-container', data);
  }else{
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
}


let showmovie = async function(idmovie){
  let response = await fetch("../server/script.php?action=getMovie&idmovie="+idmovie);
  // attente de l'extration des données en format json de la réponse à la requête
  let data = await response.json();
  Film.render('.films-container', data);
}

let addtoplaylist = async function(idmovie){
  let idprofile = document.querySelector(".profiles-containers").value
  await fetch("../server/script.php?action=addtoplaylist&idmovie="+idmovie+"&idprofile="+idprofile);
  // attente de l'extration des données en format json de la réponse à la requête
}

let deletefromplaylist = async function(idmovie){
  let idprofile = document.querySelector(".profiles-containers").value
  await fetch("../server/script.php?action=removefromplaylist&idmovie="+idmovie+"&idprofile="+idprofile);
  // attente de l'extration des données en format json de la réponse à la requête
}

let editnote = async function(idmovie){
  let note = document.querySelector(".film__note"+idmovie).value
  let idprofile = document.querySelector(".profiles-containers").value
  await fetch("../server/script.php?action=editNote&idmovie="+idmovie+"&idprofile="+idprofile+"&note="+note);
  // attente de l'extration des données en format json de la réponse à la requête
}

let addComment = async function(idmovie){
  let comment = document.querySelector(".commentaire").value
  console.log(comment)
  let idprofile = document.querySelector(".profiles-containers").value
  await fetch("../server/script.php?action=addComment&idmovie="+idmovie+"&idprofile="+idprofile+"&commentaire="+comment);
  // attente de l'extration des données en format json de la réponse à la requête
}

let getplaylist = async function(){
  let idprofile = document.querySelector(".profiles-containers").value
  let response = await fetch("../server/script.php?action=getplaylist&idprofile="+idprofile);
  // attente de l'extration des données en format json de la réponse à la requête
  let data = await response.json();
  Playlist.render('.films-container', data);
}

let getListCategorie = async function(){
  let response = await fetch("../server/script.php?action=getCategories");
  let data = await response.json();
  Categorie.render('.categorie-containers', data);
}

let getListProfil = async function(){
  let response = await fetch("../server/script.php?action=getProfiles");
  let data = await response.json();
  Profiles.render('.profiles-containers', data);
}

let getPriorite = async function(){
  let response = await fetch("../server/script.php?action=getPriorite");
  let data = await response.json();
  Priorite.render('.caroussel', data);
}

let getFilmbyName = async function() {
  let idprofile = document.querySelector(".searchbar").value
  let response = await fetch("../server/script.php?action=getMovieByName&idmovie="+idprofile);
  let data = await response.json();
  Films.render('.films-container', data);
}
