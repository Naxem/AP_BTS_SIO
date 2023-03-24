<?php
// Inclure le fichier de connexion à la base de données
require_once('connexion_BDD.php');

// Récupérer tous les médecins de la base de données
$conn = connexion_bdd();

$query = "SELECT `IdPersonnel`, `IdService`, `NomPersonnel`, `PrenomPersonnel` FROM `personnel` WHERE `IdService`= '2';";
$result = $conn->query($query);

// Afficher les médecins
echo "<!doctype html>";
echo "<html lang='fr'>";
echo "<head>";
echo "<meta charset='UTF-8'>";
echo "<meta name='viewport' content='width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0'>";
echo "<meta http-equiv='X-UA-Compatible' content='ie=edge'>";
echo "<title>Pannel Admin</title>";
echo "<link rel='stylesheet' type='text/css' href='style.css'>";
echo "</head>";
echo "<body>";
echo "<section>";


// Afficher la liste des médecins
echo "<h2>Liste des Médecins</h2>";
echo "<table>";
echo "<thead><tr><th>Nom</th><th>Prénom</th></tr></thead>";
echo "<tbody>";
while($row = $result->fetch()) {
    echo "<tr><td>".$row['NomPersonnel']."</td><td>".$row['PrenomPersonnel']."</td></tr>";
}
echo "</tbody>";
echo "</table>";



// Ajouter un médecin
echo "<h2>Ajouter un médecin</h2>";
echo "<form method='post' action=''>";
echo "<label>Nom:</label>";
echo "<input type='text' name='nom' required><br>";
echo "<label>Prénom:</label>";
echo "<input type='text' name='prenom' required><br>";
echo "<label>Identifiant :</label>";
echo "<input type='text' name='txt-login' value='' class='champs'><br>";
echo "<label>Mot de passe :</label>";
echo "<input type='text' name='txt-password' value='' class='champs'><br>";
echo "<input type='submit' name='submit' value='Ajouter'>";
echo "</form>";

// Supprimer un médecin
echo "<h2>Supprimer un médecin</h2>";
echo "<form method='post' action=''>";
echo "<label>Médecin:</label>";
echo "<select name='medecin'>";
$result->execute();
while($row = $result->fetch()) {
    echo "<option value='".$row['IdPersonnel']."'>".$row['NomPersonnel']." ".$row['PrenomPersonnel']."</option>";
}
echo "</select><br>";
echo "<input type='submit' name='submit' value='Supprimer'>";
echo "</form>";


// Ajouter ou supprimer un médecin en fonction de la soumission du formulaire
if (isset($_POST['submit'])) {
    if ($_POST['submit'] == 'Ajouter') {
    $nom = htmlspecialchars($_POST['nom']);
    $prenom = htmlspecialchars($_POST['prenom']);
    $login = htmlspecialchars($_POST['txt-login']);
    $password = $_POST['txt-password'];

    // Insérer les données dans la table "personnel"
    $query = "INSERT INTO personnel (IdService, NomPersonnel, PrenomPersonnel) VALUES ('2', '$nom', '$prenom')";
    $conn->exec($query);

    // Récupérer l'ID de la dernière ligne insérée dans la table "personnel"
    $id_personnel = $conn->lastInsertId();

    // Insérer les données dans la table "user"
    $query = "INSERT INTO `user`( `Login`, `MDP`, `IdPersonnel`, `IdRole`) VALUES ('$login','$password','$id_personnel','2')";
    $conn->exec($query);

    header("Location: admin.php");
    exit();
    } else if ($_POST['submit'] == 'Supprimer') {
    $medecin = htmlspecialchars($_POST['medecin']);

    // Supprimer l'utilisateur correspondant dans la table user
    $query = "DELETE FROM user WHERE IdPersonnel='$medecin'";
    $conn->exec($query);

    // Supprimer le médecin dans la table personnel
    $query = "DELETE FROM personnel WHERE IdPersonnel='$medecin'";
    $conn->exec($query);

    header("Location: admin.php");
    exit();

    }
}
echo "</section>";
echo "</body>";
echo "</html>";
?>
