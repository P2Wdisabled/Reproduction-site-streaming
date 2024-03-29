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
    echo "Le Film $film a été ajouté ou mis à jour";
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

if ( isset($_REQUEST['action']) && $_REQUEST['action']=='getMovie' && isset($_REQUEST['idmovie']) && !empty($_REQUEST['idmovie'])){
  $movie = getMovie($_REQUEST['idmovie']);
  echo json_encode($movie);
  exit(); // termine le script (ce qui est en dessous ne s'exécutera pas)
}
http_response_code(404);

?>