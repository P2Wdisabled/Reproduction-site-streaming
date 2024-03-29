let getProfilList = async function(){
    let response = await fetch("../server/script.php?action=getProfiles");
    let data = await response.json();
    Profile.render('.list-profils', data);
}
let getListCategorie = async function(){
  let response = await fetch("../server/script.php?action=getCategories");
  let data = await response.json();
  Categorie.render('.categorie-containers', data);
}
let getListFilms = async function(){
  let response = await fetch("../server/script.php?action=getmovies");
  let data = await response.json();
  Priorite.render('.list-films', data);
  Priorite.render('.list-films2', data);
}



setTimeout(() => {
  getProfilList();
  getListCategorie();
  getListFilms();
}, 500);
