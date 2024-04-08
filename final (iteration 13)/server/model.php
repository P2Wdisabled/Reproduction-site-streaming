<?php

function getMovies(){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("SELECT Films.id_film, titre, realisateur, annee, urlImage, urlTrailer, Priorite, AVG(note) AS note FROM Films LEFT JOIN Notes ON Films.id_film = Notes.id_film GROUP BY Films.id_film, titre, realisateur, annee, urlImage, urlTrailer, Priorite"); 
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
function getComments(){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("select id_comment, titre, commentaire from Films join Commentaires on Commentaires.id_film = Films.id_film"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}
function getPending(){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("select id_comment, titre, commentaire from Films join Commentaires on Commentaires.id_film = Films.id_film where status='pending'"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}
function getPlaylist($idprofil){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("SELECT Films.id_film, titre, realisateur, annee, urlImage, urlTrailer, Priorite, AVG(Notes.note) AS moyenne_note FROM Films LEFT JOIN (SELECT id_film, AVG(note) AS note FROM Notes GROUP BY id_film) AS Notes ON Films.id_film = Notes.id_film JOIN Playlist ON Films.id_film = Playlist.id_film JOIN Comptes ON Comptes.id_utilisateur = Playlist.id_profile WHERE Playlist.id_profile = '$idprofil' GROUP BY Films.id_film, titre, realisateur, annee, urlImage, urlTrailer, Priorite"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}
function addFilm($film, $rea, $annee, $img, $trailer, $categorie){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("insert into Films (titre, realisateur, annee, urlImage, urlTrailer, Priorite, id_categorie) VALUES ('$film', '$rea', '$annee', '$img', '$trailer', 0, '$categorie')");
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
    $answer = $cnx->query("delete from Notes where id_profil='$profil'"); 
    $answer = $cnx->query("delete from Commentaires where id_profile='$profil'"); 
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
function deleteComment($commentaire){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("delete from Commentaires where id_comment='$commentaire'"); 
    $res = $answer->rowCount();
    return $res;
}
function getMovie($id){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("select * from Films where id_film='$id'");
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}
function getMoviesbyid($id){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("SELECT Films.id_film, titre, realisateur, annee, urlImage, urlTrailer, Priorite, AVG(note) AS note FROM Films LEFT JOIN Notes ON Films.id_film = Notes.id_film JOIN Categories ON Films.id_categorie = Categories.id_categorie WHERE Categories.id_categorie = $id GROUP BY Films.id_film, titre, realisateur, annee, urlImage, urlTrailer, Priorite"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}
function getCommentaires($id){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("SELECT Commentaires.date AS date, Comptes.nom AS nom, Commentaires.commentaire AS commentaire, Notes.note AS note FROM Commentaires INNER JOIN Comptes ON Commentaires.id_profile = Comptes.id_utilisateur LEFT JOIN Notes ON Commentaires.id_profile = Notes.id_profil AND Commentaires.id_film = Notes.id_film WHERE Commentaires.id_film = $id AND Commentaires.status != 'pending'"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}
function getMoviesbyname($titre){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("SELECT Films.id_film, titre, realisateur, annee, urlImage, urlTrailer, Priorite, AVG(note) AS note FROM Films LEFT JOIN Notes ON Films.id_film = Notes.id_film WHERE titre LIKE '%$titre%' GROUP BY Films.id_film, titre, realisateur, annee, urlImage, urlTrailer, Priorite"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}
function editNote($idmovie, $idprofile, $note){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("REPLACE Notes set id_profil='$idprofile', id_film='$idmovie', note='$note'"); 
    $res = $answer->rowCount();
    return $res;
}
function editComment($idmovie, $idprofile, $commentaire){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $date = date('Y-m-d');
    $answer = $cnx->query("SELECT * FROM Commentaires WHERE id_profile='$idprofile' and id_film='$idmovie'"); 
    $res = $answer->rowCount();
    $commentaire = addslashes($commentaire);
    if ($res > 0) {
        $answer = $cnx->query("UPDATE Commentaires set commentaire='$commentaire', date='$date' WHERE id_profile='$idprofile' and id_film='$idmovie'"); 
    }else {
        $answer = $cnx->query("INSERT INTO Commentaires (id_profile, id_film, commentaire, date, status) VALUES ('$idprofile', '$idmovie', '$commentaire', '$date', 'pending')"); 
    }
    $res = $answer->rowCount();
    return $res;
}
function acceptComment($idcomment){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("UPDATE Commentaires set status='accepted' WHERE id_comment='$idcomment'"); 
    $res = $answer->rowCount();
    return $res;
}
function getUserNote($iduser, $idfilm){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("SELECT note FROM Notes WHERE id_profil='$iduser' AND id_film='$idfilm'"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}

function getUserNotes($iduser){
    $cnx = new PDO("mysql:host=localhost;dbname=potevin1", "potevin1", "potevin1");
    $answer = $cnx->query("SELECT id_film, note FROM Notes WHERE id_profil='$iduser'"); 
    $res = $answer->fetchAll(PDO::FETCH_OBJ);
    return $res;
}