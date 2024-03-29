<?php

function getMovies(){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("select * from Films"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}
function getCategories(){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("select id_categorie, labelle from Categories"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}
function getProfiles(){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("select * from Comptes"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}
function getPriorite(){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("select * from Films where priorite=1"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}
function getPlaylist($idprofil){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("select * from Films join Playlist on Films.id_film = Playlist.id_film join Comptes on Comptes.id_utilisateur = Playlist.id_profile where id_profile='$idprofil'"); 
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
function addprofile($name){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("insert into Comptes (nom) VALUES ('$name')");
    $res = $answer->rowCount();
    return $res;
}
function addFavori($idmovie, $idprofil){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("insert into Playlist (id_film, id_profile) VALUES ('$idmovie', '$idprofil')");
    $res = $answer->rowCount();
    return $res;
}
function removefromplaylist($idmovie, $idprofil){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("delete from Playlist where id_film='$idmovie' and id_profile='$idprofil'");
    $res = $answer->rowCount();
    return $res;
}
function deleteProfile($profil){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("delete from Playlist where id_profile='$profil'"); 
    $answer = $cnx->query("delete from Comptes where id_utilisateur='$profil'"); 
    $res = $answer->rowCount();
    return $res;
}
function setPriorite($priorite){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("update Films set Priorite=1 where id_film='$priorite'"); 
    $res = $answer->rowCount();
    return $res;
}
function removePriorite($priorite){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("update Films set Priorite=0 where id_film='$priorite'"); 
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
