<?php


require("model.php");

if (isset($_REQUEST['action']) && $_REQUEST['action']=='addFilm'){
  $film = $_REQUEST['titre'];
  $rea = $_REQUEST['realisateur'];
  $annee = $_REQUEST['annee'];
  $img = $_REQUEST['urlImg'];
  $trailer = $_REQUEST['trailer'];
  $categorie = htmlspecialchars($_GET['categorie']);
  $ok = addFilm($film, $rea, $annee, $img, $trailer, $categorie);
  if ($ok>0){
    echo "Le Film $film a été ajouté";
  }
  else{
    echo "Un problème est survenu";
  }
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}

if (isset($_REQUEST['action']) && $_REQUEST['action']=='addprofile'){
  $name = $_REQUEST['name'];
  $ok = addprofile($name);
  if ($ok>0){
    echo "Le Profil $name a été ajouté";
  }
  else{
    echo "Un problème est survenu";
  }
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}

if (isset($_REQUEST['action']) && $_REQUEST['action']=='Delete'){
  $profil = $_REQUEST['profile'];
  $ok = deleteProfile($profil);
  if ($ok>0){
    echo "Le Profil à été supprimé.";
  }
  else{
    echo "Pas de profil supprimé (il n'existe peut être pas dans la BDD).";
  }
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}

if ( isset($_REQUEST['action']) && $_REQUEST['action']=='Priorite' ){
  $ok = setPriorite($_REQUEST['priorite']);
  if ($ok>0){
    echo "Le film à été mis en avant.";
  }
  else{
    echo "Pas de mis en avant (une erreur est survenu).";
  }
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}
if ( isset($_REQUEST['action']) && $_REQUEST['action']=='DelPriorite' ){
  $ok = removePriorite($_REQUEST['priorite']);
  if ($ok>0){
    echo "Le film à été retiré de la mis en avant.";
  }
  else{
    echo "Pas d'action effectué' (une erreur est survenu).";
  }
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}

if ( isset($_REQUEST['action']) && $_REQUEST['action']=='getmovies' ){
  $movies_list = getMovies();
  echo json_encode($movies_list);
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}

if ( isset($_REQUEST['action']) && $_REQUEST['action']=='getProfiles' ){
  $profiles_list = getProfiles();
  echo json_encode($profiles_list);
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}

if ( isset($_REQUEST['action']) && $_REQUEST['action']=='getmoviesbyid' ){
  $movies_list = getMoviesbyid($_REQUEST['idcategorie']);
  echo json_encode($movies_list);
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}

if ( isset($_REQUEST['action']) && $_REQUEST['action']=='getCategories' ){
  $categorie_list = getCategories();
  echo json_encode($categorie_list);
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}

if ( isset($_REQUEST['action']) && $_REQUEST['action']=='getProfiles' ){
  $profile_list = getProfiles();
  echo json_encode($profile_list);
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}

if ( isset($_REQUEST['action']) && $_REQUEST['action']=='getPriorite' ){
  $priorite = getPriorite();
  echo json_encode($priorite);
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}

if ( isset($_REQUEST['action']) && $_REQUEST['action']=='getplaylist' ){
  $playlist = getPlaylist($_REQUEST['idprofile']);
  echo json_encode($playlist);
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}

if ( isset($_REQUEST['action']) && $_REQUEST['action']=='getMovie' && isset($_REQUEST['idmovie']) && !empty($_REQUEST['idmovie'])){
  $movie = getMovie($_REQUEST['idmovie']);
  echo json_encode($movie);
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}

if ( isset($_REQUEST['action']) && $_REQUEST['action']=='addtoplaylist' && isset($_REQUEST['idmovie']) && !empty($_REQUEST['idmovie']) && isset($_REQUEST['idprofile']) && !empty($_REQUEST['idprofile'])){
  $favori = addFavori($_REQUEST['idmovie'], $_REQUEST['idprofile']);
  echo json_encode($favori);
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}

if ( isset($_REQUEST['action']) && $_REQUEST['action']=='removefromplaylist' && isset($_REQUEST['idmovie']) && !empty($_REQUEST['idmovie']) && isset($_REQUEST['idprofile']) && !empty($_REQUEST['idprofile'])){
  $favori = removefromplaylist($_REQUEST['idmovie'], $_REQUEST['idprofile']);
  echo json_encode($favori);
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}

http_response_code(404);

?>