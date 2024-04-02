<?php
$pdo = new PDO('mysql:host=localhost;dbname=potevin1', 'potevin1', 'potevin1');
$apiKey = '5e5d955e1bc7d791eb69c7427dc4f490';

// Fonction pour vérifier si un film existe déjà
function filmExists($pdo, $title, $releaseYear) {
    $query = $pdo->prepare("SELECT COUNT(*) FROM Films WHERE titre = :titre AND annee = :annee");
    $query->execute([':titre' => $title, ':annee' => $releaseYear]);
    return $query->fetchColumn() > 0;
}

// Fonction pour ajouter un film
function addFilm($pdo, $film) {
    if (!filmExists($pdo, $film['title'], $film['release_year'])) {
        $query = $pdo->prepare("INSERT INTO Films (titre, realisateur, annee, urlImage, urlTrailer, Priorite) VALUES (:titre, :realisateur, :annee, :urlImage, :urlTrailer, 0)");
        $query->execute([
            ':titre' => $film['title'],
            ':realisateur' => $film['director'],
            ':annee' => $film['release_year'],
            ':urlImage' => $film['poster_path'],
            ':urlTrailer' => $film['trailer']
        ]);
        return $pdo->lastInsertId();
    }
    return null;
}

// Fonction pour récupérer les réalisateurs
function getDirector($credits) {
    foreach ($credits['crew'] as $crewMember) {
        if ($crewMember['job'] == 'Director') {
            return $crewMember['name'];
        }
    }
    return 'Inconnu';
}

// Téléchargement asynchrone des images des posters
function downloadImagesAsync($urls) {
    $curlHandles = [];
    $results = [];

    // Initialiser les poignées cURL
    foreach ($urls as $key => $url) {
        $curlHandles[$key] = curl_init($url);
        curl_setopt($curlHandles[$key], CURLOPT_RETURNTRANSFER, true);
    }

    // Exécuter les requêtes cURL en parallèle
    $mh = curl_multi_init();
    foreach ($curlHandles as $ch) {
        curl_multi_add_handle($mh, $ch);
    }

    $runningHandles = null;
    do {
        curl_multi_exec($mh, $runningHandles);
    } while ($runningHandles);

    // Récupérer les résultats
    foreach ($curlHandles as $key => $ch) {
        $results[$key] = curl_multi_getcontent($ch);
        curl_multi_remove_handle($mh, $ch);
    }
    curl_multi_close($mh);

    return $results;
}

// Fonction pour télécharger une image
function downloadImage($url, $data) {
    $imagePath = './';
    $imageName = basename($url);
    $fullPath = $imagePath . $imageName;
    file_put_contents($fullPath, $data);
    return $imageName;
}

if (isset($_POST['start_process'])) {
    $filmCount = 0;
    $page = 1;
    while ($filmCount < 1978) {
        $url = "https://api.themoviedb.org/3/discover/movie?api_key={$apiKey}&language=fr-FR&page={$page}";
        $result = json_decode(file_get_contents($url), true);

        foreach ($result['results'] as $movie) {
            if ($filmCount >= 3) break;

            $detailsUrl = "https://api.themoviedb.org/3/movie/{$movie['id']}?api_key={$apiKey}&append_to_response=videos,credits";
            $detailsResult = json_decode(file_get_contents($detailsUrl), true);

            $director = getDirector($detailsResult['credits']);

            $film = [
                'title' => $movie['title'],
                'release_year' => substr($movie['release_date'], 0, 4),
                'poster_path' => "https://image.tmdb.org/t/p/w500{$movie['poster_path']}",
                'director' => $director,
                'trailer' => "https://www.youtube.com/embed/" . $detailsResult['videos']['results'][0]['key']
            ];

            $posterData = file_get_contents($film['poster_path']);
            $film['poster_path'] = downloadImage($film['poster_path'], $posterData);

            addFilm($pdo, $film);
            $filmCount++;
        }
        $page++;
    }
    echo "Processus terminé. Jusqu'à 3 films ont été ajoutés.";
}

// Compteur de films ajoutés
$query = $pdo->query("SELECT COUNT(*) FROM Films");
$filmCount = $query->fetchColumn();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter des films</title>
</head>
<body>
    <h1>Ajouter des films</h1>
    <p>Nombre de films actuellement dans la base de données : <?php echo $filmCount; ?></p>
    <form method="post">
        <button type="submit" name="start_process">Lancer le processus</button>
    </form>
</body>
</html>
