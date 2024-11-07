
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Résultat</title>
    <link rel="stylesheet" href="../styles/styles.css">
</head>
<body>
<h1>Interrogation SQL</h1>
    <form id="form" onsubmit="fetchData(event);" action="./request.php" method="post" >
        <label for="question">Choisissez une question:</label>
        <select id="question" name="question">
            <option value="Q1">Q1: Quels sont les professeurs (IDP, noms) nés en 1972 ?</option>
            <option value="Q2">Q2: Donner toutes les informations des devoirs de niveau « 4ème ».</option>
            <option value="Q3">Q3: Donner la liste des établissements inscrits de l’hérault.</option>
            <option value="Q4">Q4: Donner la liste des exercices dont le contenu contient le mot « calculer ».</option>
            <option value="Q5">Q5: Donner la liste des exercices rattachés aux niveaux correspondants au cycle 4.</option>
            <option value="Q6">Q6: Donner la liste des exercices ayant déjà été utilisés dans au moins un devoir.</option>
            <option value="Q7">Q7: Donner la liste des exercices créés en janvier 2019.</option>
            <option value="Q8">Q8: Donner la note obtenue par l’élève ayant l’ID 4 au devoir d’ID 6.</option>
            <option value="Q9">Q9: Donner la note obtenue par Maxime Dupont au devoir d’ID 7.</option>
            <option value="Q10">Q10: Donner la liste des professeurs travaillant dans leur ville de résidence.</option>
            <option value="Q11">Q11: Donner la liste des élèves ayant réalisé au moins un passage de devoir.</option>
            <option value="Q12">Q12: Donner la liste des établissements ayant au moins un devoir en cours.</option>
            <option value="Q13">Q13: Donner la liste des élèves n’ayant pas le même niveau que celui des devoirs qu’ils réalisent.</option>
            <option value="Q14">Q14: Donner la liste des élèves ayant réalisé au moins un devoir avec une note supérieure à 6.</option>
            <option value="Q15">Q15: Combien d’élèves sont inscrits dans l’université ?</option>
            <option value="Q16">Q16: Donner le total des points attribués aux différents contenus du devoir d’ID 4.</option>
            <option value="Q17">Q17: Combien y a-t-il de professeurs n’ayant jamais été propriétaire d’exercices ?</option>
            <option value="Q18">Q18: Combien de devoirs ont été réalisés par Alexandre Rami ?</option>
            <option value="Q19">Q19: Quelle est la plus petite note attribuée aux contenus du devoir d’ID 2 ?</option>
            <option value="Q20">Q20: Quelle est la moyenne des notes attribuées aux contenus du devoir d’ID 4 ?</option>
            <option value="Q21">Q21: Quelle est l’étendue des notes attribuées aux contenus du devoir d’ID 6 ?</option>
            <option value="Q22">Q22: Quel est le professeur ayant créé le plus grand nombre de devoirs ?</option>
            <option value="Q23">Q23: Quelle est la meilleure note obtenue par Arnaud Dupont ?</option>
            <option value="Q24">Q24: Donner la liste des élèves n’ayant jamais réalisé de devoir.</option>
            <option value="Q25">Q25: Donner la liste des professeurs étant à la fois propriétaires d’exercices et créateurs de devoirs.</option>
            <option value="Q26">Q26: Donner la liste des professeurs étant à la fois propriétaires d’exercices et créateurs de devoirs (DISTINCT).</option>
            <option value="Q27">Q27: Donner la liste des niveaux ne possédant aucun exercice (DISTINCT).</option>
            <option value="Q28">Q28: Donner la liste des exercices n’ayant aucun contenu (DISTINCT).</option>
            <option value="Q29">Q29: ....</option>
        </select>
        <br><br>
        <button type="submit">Exécuter</button>
    </form>
</body>
</html>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "university";

// Connexion à la base de données
$dsn = 'mysql:dbname=university;host=localhost';

try {
    $conn = new PDO($dsn, $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Échec de la connexion : " . $e->getMessage());
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $question = $_POST['question'];

    switch ($question) {
        case 'Q1':
            $sql = "SELECT IDP, NOM FROM PROF WHERE ANNEE_NAISSANCE = 1972";
            break;
        case 'Q2':
            $sql = "SELECT * FROM DEVOIR WHERE NIVEAU = '4eme'";
            break;
        case 'Q3':
            $sql = "SELECT * FROM ETABLISSEMENT WHERE RNE LIKE '034%'";
            break;
        case 'Q4':
            $sql = "SELECT IDEX, NIVEAU, PROPRIETAIRE FROM EXERCICE WHERE CONTENU LIKE '%calculer%'";
            break;
        case 'Q5':
            $sql = "SELECT IDEX, NIVEAU, PROPRIETAIRE FROM EXERCICE WHERE NIVEAU IN ('5eme', '4eme', '3eme') ORDER BY DATE_CREATION DESC";
            break;
        case 'Q6':
            $sql = "SELECT DISTINCT EXERCICE.IDEX, CONTENU.BAREME FROM EXERCICE JOIN CONTENU ON EXERCICE.IDEX = CONTENU.IDEX ORDER BY CONTENU.BAREME DESC";
            break;
        case 'Q7':
            $sql = "SELECT IDEX, DATE_CREATION FROM EXERCICE WHERE DATE_CREATION BETWEEN '2019-01-01' AND '2019-01-31' ORDER BY DATE_CREATION DESC";
            break;
        case 'Q8':
            $sql = "SELECT NOTE FROM PASSAGE WHERE IDEL = 4 AND IDD = 6";
            break;
        case 'Q9':
            $sql = "SELECT NOTE FROM PASSAGE WHERE IDD = 7 AND IDEL = (SELECT IDEL FROM ELEVE WHERE NOM = 'Dupont' AND PRENOM = 'Maxime')";
            break;
        case 'Q10':
            $sql = "SELECT P.NOM FROM PROF P JOIN ETABLISSEMENT E ON P.RNE = E.RNE WHERE P.VILLE = E.LOCALITE";
            break;
        case 'Q11':
            $sql = "SELECT DISTINCT E.NOM, E.PRENOM FROM ELEVE E JOIN PASSAGE P ON E.IDEL = P.IDEL";
            break;
        case 'Q12':
            $sql = "SELECT DISTINCT E.nomEtab FROM Etablissement E JOIN Devoir D ON E.RNE = D.RNE WHERE D.dateDevoir >= SYSDATE ";
            break;
        case 'Q13':
            $sql = "SELECT E.NOM, E.PRENOM FROM ELEVE E JOIN PASSAGE P ON E.IDEL = P.IDEL WHERE E.NIVEAU <> (SELECT D.NIVEAU FROM DEVOIR D WHERE D.IDD = P.IDD)";
            break;
        case 'Q14':
            $sql = "SELECT DISTINCT E.NOM, E.PRENOM FROM ELEVE E JOIN PASSAGE P ON E.IDEL = P.IDEL JOIN CONTENU C ON P.IDD = C.IDD WHERE C.BAREME >= 6";
            break;
        case 'Q15':
            $sql = "SELECT COUNT(*) AS nombre_eleves FROM ELEVE";
            break;
        case 'Q16':
            $sql = "SELECT SUM(BAREME) AS total_points FROM CONTENU WHERE IDD = 4";
            break;
        case 'Q17':
            $sql = "SELECT COUNT(*) AS nombre_profs FROM PROF WHERE IDP NOT IN (SELECT DISTINCT PROPRIETAIRE FROM EXERCICE)";
            break;
        case 'Q18':
            $sql = "SELECT COUNT(*) AS nombre_devoirs FROM PASSAGE WHERE IDEL = (SELECT IDEL FROM ELEVE WHERE NOM = 'Rami' AND PRENOM = 'Alexandre')";
            break;
        case 'Q19':
            $sql = "SELECT MIN(BAREME) AS min_bareme FROM CONTENU WHERE IDD = 2";
            break;
        case 'Q20':
            $sql = "SELECT AVG(BAREME) AS moyenne_bareme FROM CONTENU WHERE IDD = 4";
            break;
        case 'Q21':
            $sql = "SELECT MAX(BAREME) - MIN(BAREME) AS etendue_bareme FROM CONTENU WHERE IDD = 6";
            break;
        case 'Q22':
            $sql = "SELECT P.NOM, COUNT(D.IDD) AS nombre_devoirs FROM PROF P JOIN DEVOIR D ON P.IDP = D.PROF_CREATEUR GROUP BY P.NOM ORDER BY nombre_devoirs DESC";
            break;
        case 'Q23':
            $sql = "SELECT MAX(NOTE) AS meilleure_note FROM PASSAGE WHERE IDEL = (SELECT IDEL FROM ELEVE WHERE NOM = 'Dupont' AND PRENOM = 'Arnaud')";
            break;
        case 'Q24':
            $sql = "SELECT E.NOM, E.PRENOM FROM ELEVE E WHERE E.IDEL NOT IN (SELECT DISTINCT IDEL FROM PASSAGE)";
            break;
        case 'Q25':
            $sql = "SELECT DISTINCT P.NOM FROM PROF P LEFT JOIN EXERCICE E ON P.IDP = E.PROPRIETAIRE LEFT JOIN DEVOIR D ON P.IDP = D.PROF_CREATEUR WHERE E.IDEX IS NOT NULL OR D.IDD IS NOT NULL";
            break;
        case 'Q26':
            $sql = "SELECT DISTINCT P.NOM FROM PROF P JOIN EXERCICE E ON P.IDP = E.PROPRIETAIRE JOIN DEVOIR D ON P.IDP = D.PROF_CREATEUR";
            break;
        case 'Q27':
            $sql = "SELECT N.NIVEAU FROM NIVEAU N WHERE N.NIVEAU NOT IN (SELECT DISTINCT E.NIVEAU FROM EXERCICE E)";
            break;
        case 'Q28':
            $sql = "SELECT E.IDEX, E.CONTENU FROM EXERCICE E WHERE E.IDEX NOT IN (SELECT DISTINCT C.IDEX FROM CONTENU C)";
            break;
        case 'Q29':
            $sql = "SELECT E.NOM, E.PRENOM FROM ELEVE E JOIN";
        default:
            $sql = "";
            break;
    }

    try {
        if ($sql !== "") {
            $stmt = $conn->query($sql);
            $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if (count($results) > 0) {
                echo "<table border='1'><tr>";
                foreach (array_keys($results[0]) as $column) {
                    echo "<th>{$column}</th>";
                }
                echo "</tr>";

                foreach ($results as $row) {
                    echo "<tr>";
                    foreach ($row as $value) {
                        echo "<td>{$value}</td>";
                    }
                    echo "</tr>";
                }
                echo "</table>";
            } else {
                echo "0 résultats";
            }
        } else {
            echo "Veuillez choisir une question valide.";
        }
    } catch (PDOException $e) {
        echo "Erreur: " . $e->getMessage();
    }
}
?>
