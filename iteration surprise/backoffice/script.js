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
}

let getListPriorite = async function(){
  let response = await fetch("../server/script.php?action=getPriorite");
  let data = await response.json();
  Priorite.render('.list-priorite', data);
}

let getListComments = async function(){
  let response = await fetch("../server/script.php?action=getListComments");
  let data = await response.json();
  Commentaire.render('.list-comments', data);
}
let getListPending = async function(){
  let response = await fetch("../server/script.php?action=getListPending");
  let data = await response.json();
  Commentaire.render('.list-pending', data);
}

// Sélection des cases à cocher
const filmCheckbox = document.querySelector('.gestionnaire__film-box');
const profilCheckbox = document.querySelector('.gestionnaire__profil-box');
const commentaireCheckbox = document.querySelector('.gestionnaire__commentaire-box');

// Fonction pour désélectionner une case à cocher
function uncheckCheckbox(checkbox) {
    checkbox.checked = false;
}

// Écoute des événements de changement pour chaque case à cocher
filmCheckbox.addEventListener('change', function() {
  if (this.checked) {
      // Si la case à cocher du film est cochée, désélectionner les autres
      uncheckCheckbox(profilCheckbox);
      uncheckCheckbox(commentaireCheckbox);
  }
});

profilCheckbox.addEventListener('change', function() {
    if (this.checked) {
        // Si la case à cocher du profil est cochée, désélectionner les autres
        uncheckCheckbox(filmCheckbox);
        uncheckCheckbox(commentaireCheckbox);
    }
});

commentaireCheckbox.addEventListener('change', function() {
    if (this.checked) {
        // Si la case à cocher du commentaire est cochée, désélectionner les autres
        uncheckCheckbox(filmCheckbox);
        uncheckCheckbox(profilCheckbox);
    }
});


// Écoute des événements de changement pour chaque case à cocher
filmCheckbox.addEventListener('change', function() {
  if (this.checked) {
      // Si la case à cocher du film est cochée, désélectionner les autres
      uncheckCheckbox(profilCheckbox);
      uncheckCheckbox(commentaireCheckbox);
  }
});

profilCheckbox.addEventListener('change', function() {
    if (this.checked) {
        // Si la case à cocher du profil est cochée, désélectionner les autres
        uncheckCheckbox(filmCheckbox);
        uncheckCheckbox(commentaireCheckbox);
    }
});

commentaireCheckbox.addEventListener('change', function() {
    if (this.checked) {
        // Si la case à cocher du commentaire est cochée, désélectionner les autres
        uncheckCheckbox(filmCheckbox);
        uncheckCheckbox(profilCheckbox);
    }
});

// Sélection de toutes les cases à cocher
const checkboxes = document.querySelectorAll('.gestionnaire__film-box, .gestionnaire__profil-box, .gestionnaire__commentaire-box');

// Fonction pour vérifier si aucune case à cocher n'est cochée
function noCheckboxChecked() {
  return !Array.from(checkboxes).some(checkbox => checkbox.checked);
}

// Vérification initiale
if (noCheckboxChecked()) {
  checkboxes[0].checked = true; // Coche la première checkbox si aucune n'est cochée initialement
}

// Fonction pour empêcher le décochage de toutes les cases à cocher
function preventUnchecked(event) {
  if (noCheckboxChecked() && !event.target.checked) {
    event.preventDefault();
    event.target.checked = true; // Coche à nouveau la checkbox
  }
}

// Écoute des événements de changement pour toutes les cases à cocher
checkboxes.forEach(checkbox => {
  checkbox.addEventListener('change', preventUnchecked);
});
