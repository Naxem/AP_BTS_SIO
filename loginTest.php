<?php
    session_start();
    require('requete.php');

    /*test mdp*/
    $test_login = requete();
    $res=$test_login->fetch();
        if ($res['Login'] == $_POST['txt-login'] && $res['MDP'] == $_POST['txt-password'])
        {
            $_SESSION["status"] = "Connecté en tant que ".$_POST['txt-login'];
            $_SESSION["login"] = $_POST['txt-login'];
            header('Location: Formulaire/index.php');
        }
        else
        {
            $_SESSION["status"] = "le mot de passe ou le login est incorrect";
            $_SESSION["error"] = "1";
            header('Location: login.php');
        }
?>