<?php
    session_start();
    $_SESSION["error"];
        if ($_SESSION["error"] == "1")
        {
            echo $_SESSION["status"];
            $_SESSION["error"] = "0";
        } else {
            $_SESSION["status"] = "";
        }
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
</head>
<body>

        <?php
            $_SESSION["error"] = "0";
        ?>

    <form action="loginTest.php" method="POST">
        <p>Login : <input type="text" name="txt-login" value="test"></p>
        <p>Mot de passe : <input type="password" name="txt-password" value="az"></p>
        <p><input type="submit" name="btn-connexion" value="Conexion"></p>
    </form>
</body>
</html>