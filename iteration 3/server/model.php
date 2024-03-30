<?php

function getMovies(){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("select id_film, titre, realisateur, annee, urlImage, urlTrailer from Films"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}
function getCategories(){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("select id_categorie, labelle from Categories"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}
function addFilm($film, $rea, $annee, $img, $trailer, $categorie){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
$answer = $cnx->query("insert into Films (titre, realisateur, annee, urlImage, urlTrailer) VALUES ('$film', '$rea', '$annee', '$img', '$trailer')");
$idFilm = $cnx->lastInsertId();
$answer = $cnx->query("insert into FilmCategorie (id_film, id_categorie) VALUES ($idFilm, $categorie)");
$res = $answer->rowCount();
return $res;

}

function deleteFilm($film){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("delete from Films where titre='$film'"); 
    $res = $answer->rowCount();
    return $res;
}

function getMovie($id){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("select titre, realisateur, annee, urlTrailer from Films where id_film=$id"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}

function getMoviesbyid($id){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("select Films.id_film, titre, realisateur, annee, urlImage, urlTrailer from Films join FilmCategorie on Films.id_film = FilmCategorie.id_film join Categories on Categories.id_categorie = FilmCategorie.id_categorie where Categories.id_categorie=$id"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}
