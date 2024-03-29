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
  $film = $_REQUEST['film'];
  $ok = deleteFilm($film);
  if ($ok>0){
    echo "Le film du $film à été supprimé.";
  }
  else{
    echo "Pas de film supprimé (il n'existe peut être pas dans la BDD).";
  }
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}

if ( isset($_REQUEST['action']) && $_REQUEST['action']=='getmovies' ){
  $movies_list = getMovies();
  echo json_encode($movies_list);
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