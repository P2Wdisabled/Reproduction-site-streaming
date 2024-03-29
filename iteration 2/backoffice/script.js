let getFilmList = async function(){
    let response = await fetch("../server/script.php?action=getmovies");
    let data = await response.json();
    console.log(data)
    Film.render('.list-films', data);
}


getFilmList()