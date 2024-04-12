let getmovies = async function(starting=true){
  if (starting) {
    let response = await fetch("../server/script.php?action=getmovies");
    let data = await response.json();
    Films.render('.films-container', data);
  }else{
    let option = document.querySelector('.categorie-containers').value
    if (option == "all") {
      let response = await fetch("../server/script.php?action=getmovies");
      let data = await response.json();
      Films.render('.films-container', data);
    }else{
      let response = await fetch("../server/script.php?action=getmoviesbyid&idcategorie="+option);
      let data = await response.json();
      Films.render('.films-container', data);
    }
  }
}

let showmovie = async function(idmovie){
  let response = await fetch("../server/script.php?action=getMovie&idmovie="+idmovie);
  let data = await response.json();
  Film.render('.films-container', data);
}

let addtoplaylist = async function(idmovie){
  let idprofile = document.querySelector(".profiles-containers").value
  await fetch("../server/script.php?action=addtoplaylist&idmovie="+idmovie+"&idprofile="+idprofile);
}

let deletefromplaylist = async function(idmovie){
  let idprofile = document.querySelector(".profiles-containers").value
  await fetch("../server/script.php?action=removefromplaylist&idmovie="+idmovie+"&idprofile="+idprofile);
}

let editnote = async function(idmovie, note){
  let idprofile = document.querySelector(".profiles-containers").value
  await fetch("../server/script.php?action=editNote&idmovie="+idmovie+"&idprofile="+idprofile+"&note="+note);
}

let addComment = async function(idmovie){
  let comment = document.querySelector(".film__commentaire").value
  let idprofile = document.querySelector(".profiles-containers").value
  await fetch("../server/script.php?action=addComment&idmovie="+idmovie+"&idprofile="+idprofile+"&commentaire="+comment);
}

let getplaylist = async function(){
  let idprofile = document.querySelector(".profiles-containers").value
  let response = await fetch("../server/script.php?action=getplaylist&idprofile="+idprofile);
  let data = await response.json();
  await Films.render('.films-container', data);
  setupRating();
  setupPlaylistButton()
}

let getListCategorie = async function(){
  let response = await fetch("../server/script.php?action=getCategories");
  let data = await response.json();
  Categorie.render('.categorie-containers', data);
}

let getListProfil = async function(){
  let response = await fetch("../server/script.php?action=getProfiles");
  let data = await response.json();
  Profiles.render('.profiles-containers', data);
}

let getPriorite = async function(){
  let response = await fetch("../server/script.php?action=getPriorite");
  let data = await response.json();
  Priorite.render('.carousel', data);
}

let getFilmbyName = async function() {
  let idprofile = document.querySelector(".searchbar").value
  let response = await fetch("../server/script.php?action=getMovieByName&idmovie="+idprofile);
  let data = await response.json();
  Films.render('.films-container', data);
}
let scrollToTop = function() {
  window.scrollTo({
      top: 0,
      behavior: 'smooth'
  });
}
window.addEventListener('scroll', function() {
    var scrollbtn = document.querySelector('.scrollbtn');
    if (window.scrollY > 100) {
        scrollbtn.classList.add('show');
    } else {
        scrollbtn.classList.remove('show');
    }
});

        // Fonction pour envoyer une commande au iframe de YouTube pour mettre en pause
        function pauseVideo(iframe) {
          var message = JSON.stringify({
              event: 'command',
              func: 'pauseVideo'
          });
          iframe.contentWindow.postMessage(message, '*');
      }

      // Fonction pour envoyer une commande au iframe de YouTube pour démarrer depuis le début
      function playVideoFromStart(iframe) {
          // D'abord, on met la vidéo en pause
          var pauseMessage = JSON.stringify({
              event: 'command',
              func: 'pauseVideo'
          });
          iframe.contentWindow.postMessage(pauseMessage, '*');

          // Ensuite, on place la vidéo au début
          var seekToMessage = JSON.stringify({
              event: 'command',
              func: 'seekTo',
              args: [0, true] // 0 est la position en secondes, true pour le paramètre allowSeekAhead
          });
          iframe.contentWindow.postMessage(seekToMessage, '*');

          // Puis, on la lance
          var playMessage = JSON.stringify({
              event: 'command',
              func: 'playVideo'
          });
          iframe.contentWindow.postMessage(playMessage, '*');
      }
let startcarousel = function(){
  currentIndex = 0;
  slides = document.querySelectorAll('.carousel-item');
  slide_list = document.querySelectorAll('.carousel__video');
  totalSlides = slides.length;
  autoScrollTimer;
  playVideoFromStart(slide_list[currentIndex])
}

let prevSlide = function() {
    clearInterval(autoScrollTimer);
    currentIndex = (currentIndex - 1 + totalSlides) % totalSlides;
    updateCarousel();
    startAutoScroll();
}

let nextSlide = function() {
    clearInterval(autoScrollTimer);
    currentIndex = (currentIndex + 1) % totalSlides;
    updateCarousel();
    startAutoScroll();
}

let updateCarousel = function() {
    let carousel = document.querySelector('.carousel');
    carousel.style.transform = 'translateX(-'+currentIndex * 103+'%)';
    if (currentIndex == 0) {
      pauseVideo(slide_list[totalSlides-1])
    }else{
      pauseVideo(slide_list[currentIndex-1])
    }
    playVideoFromStart(slide_list[currentIndex])
}

let startAutoScroll = function() {
    autoScrollTimer = setInterval(nextSlide, 25000);
}

let switchplaylist = async function(filmId){
  let idprofile = document.querySelector(".profiles-containers").value;
  let response = await fetch("../server/script.php?action=getplaylist&idprofile="+idprofile);
  let data = await response.json();
  let playlistTab = [];
  for (let playlistContent of data) {
    playlistTab.push(playlistContent.id_film.toString())
  }
  let selectFilm = document.querySelectorAll('.playlist-button');
  for (let selection of selectFilm) {
    let idfilm = selection.getAttribute('data-film-id');
    if (idfilm == "'"+filmId+"'") {
      if (playlistTab.includes(filmId)) {
          await deletefromplaylist(filmId)
          setupPlaylistButton()
      }else{
          await addtoplaylist(filmId)
          setupPlaylistButton()
      }
    }
  }
}

let setupPlaylistButton = async function(){
  let idprofile = document.querySelector(".profiles-containers").value;
  let response = await fetch("../server/script.php?action=getplaylist&idprofile="+idprofile);
  let data = await response.json();
  let playlistTab = [];
  for (let playlistContent of data) {
    playlistTab.push("'"+playlistContent.id_film.toString()+"'")
  }
  let selectFilm = document.querySelectorAll('.playlist-button');
  for (let selection of selectFilm) {
    let idfilm = selection.getAttribute('data-film-id');
    let moins = "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill=var(--clr-white) class='playlist-del' viewBox='0 0 16 16'><path d='M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z'/><path d='M8 4a.5.5 0 0 1 .5.5V6H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V7H6a.5.5 0 0 1 0-1h1.5V4.5A.5.5 0 0 1 8 4'/></svg>" //icon pour ajouter
    let plus = "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill=var(--clr-white) class='playlist-add' viewBox='0 0 16 16'><path fill-rule='evenodd' d='M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5m6.5-11a.5.5 0 0 0-1 0V6H6a.5.5 0 0 0 0 1h1.5v1.5a.5.5 0 0 0 1 0V7H10a.5.5 0 0 0 0-1H8.5z'/></svg>" //icon pour retirer
    if (playlistTab.includes(idfilm)) {
      selection.innerHTML = plus
    }else{
      selection.innerHTML = moins
    }
  }
}

let setupRating = async function(){
  let idprofile = document.querySelector(".profiles-containers").value;
  let response = await fetch("../server/script.php?action=getUserNotes&idUser="+idprofile);
  ratings = await response.json();
  let starContainers = document.querySelectorAll('.select-film');
        starContainers.forEach(container => {
            let id_film = container.getAttribute('data-film-id');
            let rating = ratings.find(rating => rating.id_film === parseInt(id_film));
            let note = rating ? rating.note : 0;
            loadStars(note, container);
        });
}

let switchprofil = async function(){
  setupPlaylistButton();
  await saveProfile();
  setupRating();
}

  let loadStars = function(note, container) {
      container.innerHTML = '';
      let starSelected = '<svg xmlns="http://www.w3.org/2000/svg" class="star-filled" width="16" height="16" fill=var(--clr-white)  viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>';
      let starNotSelected = '<svg xmlns="http://www.w3.org/2000/svg" class="star-empty" width="16" height="16" fill=var(--clr-white)  viewBox="0 0 16 16"><path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/></svg>';
      for (let i = 0; i < 5; i++) {
          let star = document.createElement('span');
          star.innerHTML = i < note ? starSelected : starNotSelected;
          star.addEventListener('click', function() {
              let id_film = container.getAttribute('data-film-id');
              let newNote = i + 1;
              editnote(id_film, newNote);
              loadStars(newNote, container);
          });
          container.appendChild(star);
      }
  }

let saveProfile = function() {
    let selectedProfileId = document.querySelector('.profiles-containers').value;
    localStorage.setItem('selectedProfileId', selectedProfileId);
}

 let loadProfiles = function() {
  let profileSelect = document.querySelector('.profiles-containers');
    let savedProfileId = localStorage.getItem('selectedProfileId');
    if (savedProfileId) {
        profileSelect.value = savedProfileId;
    }
 }
