<?php
    require('connexion_BDD.php');

    /*requete test mdp*/
    function requete()
    {
        $pdo=connexion_bdd();
        $stmt=$pdo->prepare("SELECT Login, MDP FROM user where Login='".$_POST['txt-login']."' and MDP='".$_POST['txt-password']."'");
        $stmt->execute();
        return $stmt;
    }//fin requete
?>