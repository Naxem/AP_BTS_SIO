<?php
    session_start();
    require('requete.php');
    $date = date("Y-m-d");

    $login = $_POST['txt-login'];
    $mdp = $_POST['txt-password'];
    $_SESSION["status"] = "";

    if (isset($_POST["btn-crea-user"])) {
        create_user($mdp, $login, 1);
        header("Location: login");
    }

    //test identifiant
    $authentification = authentification($login);
    $auth = $authentification->fetch();
    $pass = $auth["mdp"];

    switch($auth["count(login)"]) {
        case 1 :
            if(password_verify($mdp, $pass)) {
                $_SESSION["login"] = $login;
                //recup id user
                $return_id_user = return_id_user($login);
                $return_id = $return_id_user->fetchAll();
                foreach($return_id as $id) {$_SESSION["idRole"] = $id["IdRoles"]; $_SESSION["idUser"] = $id["idUser"];}
                //logs
                log_conexion("Conexion de l'utilisateur ".$login, $date, $_SESSION["idUser"]);
                switch($_SESSION["idRole"]) {
                    case "1" :
                        header("location: admin");
                        break;
                    case  "2" :
                        header("location: medecin");
                        break;
                    case "3" :
                        header("location: secretaire");
                        break;
                    default :
                        throw("erreur");
                }
            } else {
                $_SESSION["status"] = "L'identifiant ou le mot de passe est incorrect.";
                log_conexion("Tentative de conexion de l'utilisateur ".$login, $date, 0);
                header("Location: login");
            }
            break;
        case 0 :
            $_SESSION["status"] = "L'identifiant ou le mot de passe est incorrect.";
            log_conexion("Tentative de conexion de l'utilisateur ".$login, $date, 0);
            header("Location: login");
            break;
        default :
            throw("erreur");
            $_SESSION["status"] = "Il existe plusieur compte contacter l'administateur.";
    }

    /* crypage de mdp + add un bdd */
    function create_user($pass, $login, $role) {
        $pass = password_hash($pass, PASSWORD_ARGON2ID);
        create_users($pass, $login, $role);
    }
?>