<?php
// Inclure le fichier de connexion à la base de données
require_once('connexion_BDD.php');

// Récupérer tous les médecins de la base de données
$conn = connexion_bdd();

$query = "SELECT `IdPersonnel`, `IdService`, `NomPersonnel`, `PrenomPersonnel` FROM `personnel` WHERE `IdService`= '2';";
$result = $conn->query($query);

?>


<!doctype html>
<html lang='fr'>
    <head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0'>
    <meta http-equiv='X-UA-Compatible' content='ie=edge'>
    <title>Pannel Admin</title>
    <link rel='stylesheet' type='text/css' href='style.css'>
    </head>

    <body>
        <section>

        <!--Afficher la liste des médecins-->
        <h2>Liste des Médecins</h2>
        <table>
            <thead><tr><th>Nom</th><th>Prénom</th></tr></thead>
            <tbody>
                <?php
                while($row = $result->fetch()) {
                    echo "<tr><td>".$row['NomPersonnel']."</td><td>".$row['PrenomPersonnel']."</td></tr>";
                }
                ?>
            </tbody>
        </table>

        // Ajouter un médecin
        <h2>Ajouter un médecin</h2>
        <form method='post' action=''>
            <label>Nom:</label>
            <input type='text' name='nom' required><br>
            <label>Prénom:</label>
            <input type='text' name='prenom' required><br>
            <label>Identifiant :</label>
            <input type='text' name='txt-login' value='' class='champs'><br>
            <label>Mot de passe :</label>
            <input type='text' name='txt-password' value='' class='champs'><br>
            <input type='submit' name='submit' value='Ajouter'>
        </form>

        // Supprimer un médecin
        <h2>Supprimer un médecin</h2>
        <form method='post' action=''>
            <label>Médecin:</label>
            <select name='medecin'>
                <?php
                $result->execute();
                while($row = $result->fetch()) {
                    echo "<option value='".$row['IdPersonnel']."'>".$row['NomPersonnel']." ".$row['PrenomPersonnel']."</option>";
                }
                ?>
            </select><br>
            <input type='submit' name='submit' value='Supprimer'>
        </form>

        <?php
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

        ?>
        </section>
    </body>
</html>

