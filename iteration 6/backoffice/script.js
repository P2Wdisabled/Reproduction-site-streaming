let getFilmList = async function(){
    let response = await fetch("../server/script.php?action=getmovies");
    let data = await response.json();
    console.log(data)
    Film.render('.list-films', data);
}
let getListCategorie = async function(){
  let response = await fetch("../server/script.php?action=getCategories");
  let data = await response.json();
  Categorie.render('.categorie-containers', data);
}


setTimeout(() => {
  getFilmList();
  getListCategorie();
}, 500);
