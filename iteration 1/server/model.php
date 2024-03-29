<?php

function getMovies(){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("select id_film, titre, realisateur, annee, urlImage, urlTrailer from Films"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}
function addFilm($film, $rea, $annee, $img, $trailer){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("insert into Films (titre, realisateur, annee, urlImage, urlTrailer) VALUES ('$film', '$rea', '$annee', '$img', '$trailer')"); 
    $res = $answer->rowCount();
    return $res;
}

function deleteFilm($film){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("delete from Films where titre='$film'"); 
    $res = $answer->rowCount();
    return $res;
}