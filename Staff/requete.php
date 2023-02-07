<?php
    require('connexion_BDD.php');

    if (isset($_POST["btn-supp"])) {
        $numSecu = $_POST["numSecuPatient"];
        $return_numSecu = return_numSecu($numSecu);
        $return_Num_Secu = $return_numSecu->fetchAll();
        foreach($return_Num_Secu as $res) {$is_existe = $res;}
        if ($is_existe == 1) {
            supp($numSecu);
        }
    }

    //return
    function return_numSecu() {
        $pdo = connexion_bdd();
        $stmt=$pdo->prepare("SELECT count(NumSecu) FROM patients
        where NumSecu = ?;");
        $stmt->execute(array());
        return $stmt;
    }

    //Conexion
    function authentification($login) {
        $pdo = connexion_bdd();
        $stmt=$pdo->prepare("SELECT count(login), mdp FROM user
        where login = ?;");
        $stmt->execute(array($login));
        return $stmt;
    }

    function return_id_user($login) {
        $pdo = connexion_bdd();
        $stmt = $pdo ->prepare("SELECT IdRoles, idUser FROM user
        where login = ?;");
        $stmt->execute(array($login));
        return $stmt;
    }

    //logs
    function log_conexion($label, $date, $user) {
        $pdo = connexion_bdd();
        $stmt = $pdo ->prepare("INSERT INTO logs
        (label, `date`, `user`)
        VALUES(?, ?, ?);");
        $stmt->execute(array($label, $date, $user));
        return $stmt;
    }

    //créa comptes
    function create_users($pass, $login, $role) {
        $pdo = connexion_bdd();
        $stmt=$pdo->prepare("INSERT INTO user 
        (login, MDP, IdRoles) VALUES(?, ?, ?);");
        $stmt->execute(array($login, $pass, $role));
    }

    //del
    function supp($numSecu) {
        $pdo = connexion_bdd();
        $sql="DELETE FROM ap.hospi
        WHERE NumSecu = ?";     
        $stmt=$pdo->prepare($sql);
        $stmt->execute(array($numSecu));  

        $sql="DELETE FROM ap.couverturesociale
        WHERE NumSecu = ?";     
        $stmt=$pdo->prepare($sql);
        $stmt->execute(array($numSecu));  

        $sql="DELETE FROM ap.patients
        WHERE NumSecu = ?";     
        $stmt=$pdo->prepare($sql);
        $stmt->execute(array($numSecu));

        $sql="DELETE FROM ap.piecesjointes
        WHERE NumSecu = ?";     
        $stmt=$pdo->prepare($sql);
        $stmt->execute(array($numSecu));
        header("location: admin");
    }
?>