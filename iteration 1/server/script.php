<?php


require("model.php");

if (isset($_REQUEST['action']) && $_REQUEST['action']=='addFilm'){
  $film = $_REQUEST['titre'];
  $rea = $_REQUEST['realisateur'];
  $annee = $_REQUEST['annee'];
  $img = $_REQUEST['urlImg'];
  $trailer = $_REQUEST['trailer'];
  $ok = addFilm($film, $rea, $annee, $img, $trailer);
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
http_response_code(404);

?>