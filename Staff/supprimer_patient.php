<?php
    $_SESSION["supp"] = false;
    if ($_SESSION["supp"] == true) {
        echo "supprimer";
    }
    elseif ($_SESSION["supp"] == false) {
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supprimer un patient</title>
</head>
<body>
    <form action="requette_ad.php" method="post">
        <input type="text" name="numSecuPatient" placeholder="Entrez le numéro de sécurité social du patient">
        <input type="submit" value="Supprimer" name="suppr">
    </form>
</body>
</html>

<?php
    } else {
        echo "error";
    }
?>