let getProfilList = async function(){
    let response = await fetch("../server/script.php?action=getProfiles");
    let data = await response.json();
    console.log(data)
    Profile.render('.list-profils', data);
}
let getListCategorie = async function(){
  let response = await fetch("../server/script.php?action=getCategories");
  let data = await response.json();
  Categorie.render('.categorie-containers', data);
}


setTimeout(() => {
  getProfilList();
  getListCategorie();
}, 500);
