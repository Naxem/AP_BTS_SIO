<?php 

require("../connexion_BDD.php");
session_start();

/*récup form préad*/
if (isset($_POST['pread'])) {
    $_SESSION["preadd"] = $_POST["choixhospi"];
    $_SESSION["datehospi"] = $_POST["datehospi"];
    $_SESSION["heurehospi"] = $_POST["heurehospi"];
    $_SESSION["nompersonnel"] = $_POST['medecin'];  

    header("location: index.php");
    $_SESSION["form"] = 1;
}

/*récup form info Patient*/
if (isset($_POST['infoP'])) {
    $_SESSION["civ"] = $_POST["civ"];
    $_SESSION["nom"] = $_POST["nom"];
    $_SESSION["epouse"] = $_POST["epouse"];
    $_SESSION["prenom"] = $_POST["prenom"];
    $_SESSION["naissance"] = $_POST["naissance"];
    $_SESSION["adresse"] = $_POST["adresse"];
    $_SESSION["cp"] = $_POST["cp"];
    $_SESSION["ville"] = $_POST["ville"];
    $_SESSION["mail"] = $_POST["mail"];
    $_SESSION["tel"] = $_POST["tel"]; 

    header("location: index.php");
    $_SESSION["form"] = 2;
}

/*récup form info Assurance*/
if (isset($_POST['infoC'])) {
    $_SESSION["NomSecu"] = $_POST["NomSecu"];
    $_SESSION["NumSecu"] = $_POST["NumSecu"];
    $_SESSION["Assurance"] = $_POST["Assurance"];
    $_SESSION["ALD"] = $_POST["ALD"];
    $_SESSION["NomMutu"] = $_POST["NomMutu"];
    $_SESSION["NumAdherent"] = $_POST["NumAdherent"];
    $_SESSION["TypeChambre"] = $_POST["TypeChambre"];

    header("location: index.php");
    $_SESSION["form"] = 3;
}

/*récup form coords*/
if (isset($_POST['Coords'])) {
    $_SESSION["nomppre"] = $_POST["nomppre"];
    $_SESSION["prenomppre"] = $_POST["prenomppre"];
    $_SESSION["telppre"] = $_POST["telppre"];
    $_SESSION["adresseppre"] = $_POST["adresseppre"];

    $isExiste = testContact($_SESSION["nomppre"], $_SESSION["prenomppre"], 
    $_SESSION["telppre"], $_SESSION["adresseppre"]);
    $row = $isExiste->fetch();
    if ($row["count(*)"]) {
        getIdContact($_SESSION["nomppre"], $_SESSION["prenomppre"], 
        $_SESSION["telppre"], $_SESSION["adresseppre"]);
    } else {
        insertContact($_SESSION["nomppre"], $_SESSION["prenomppre"], 
        $_SESSION["telppre"], $_SESSION["adresseppre"]);
    }

    $_SESSION["nomconf"] = $_POST["nomconf"];
    $_SESSION["prenomconf"] = $_POST["prenomconf"];
    $_SESSION["telconf"] = $_POST["telconf"];
    $_SESSION["adresseconf"] = $_POST["adresseconf"];

    $isExiste = testContact($_SESSION["nomconf"], $_SESSION["prenomconf"], 
    $_SESSION["telconf"], $_SESSION["adresseconf"]);
    $row = $isExiste->fetch();
    if ($row["count(*)"]) {
        getIdContact($_SESSION["nomconf"], $_SESSION["prenomconf"], 
        $_SESSION["telconf"], $_SESSION["adresseconf"]);
    }else {
        insertContact($_SESSION["nomconf"] , $_SESSION["prenomconf"], 
        $_SESSION["telconf"], $_SESSION["adresseconf"]);
    }

    $_SESSION["form"] = 4;
    header("location: index.php");
}

/*récup form pièce joint*/
if (isset($_POST['pieceJiont'])) {
    $CarteId = $_FILES["CarteId"]["tmp_name"];
    $CarteVitale = $_FILES["CarteVitale"]["tmp_name"];
    $CarteMutuel = $_FILES["CarteMutuel"]["tmp_name"];
    $LivretFamille = $_FILES["LivretFamille"]["tmp_name"];
    $DecisionJuge = $_FILES["DecisionJuge"]["tmp_name"];
    $AutorisationSoin = $_FILES["AutorisationSoin"]["tmp_name"];

    $extentionValides = array('jpg', 'png', 'jpeg', 'pdf');

    uploadFichiers($CarteId, $nomF, $extentionValides, $CarteVitale, $CarteMutuel,
                    $LivretFamille, $DecisionJuge, $AutorisationSoin);
    $_SESSION["form"] = 0;
}

/**************************ENVOIE A LA BDD ************************************* */
function getIdContact($tel, $nom, $prenom, $adresse) {
    $pdo = connexion_bdd();
    $sql="select IdProche from proche;";
    $stmt=$pdo->prepare($sql);
    $stmt->execute();
    return $stmt;
}

function insertContact($tel, $nom, $prenom, $adresse) {
    $pdo = connexion_bdd();
    $sql="INSERT INTO ap.proche
    (Tel, Adresse, Nom, Prenom)
    VALUES(?,?,?,?);";
    $stmt=$pdo->prepare($sql);
    $stmt->execute(array($tel, $nom, $prenom, $adresse));
}

function testContact($tel, $nom, $prenom, $adresse) {
    $pdo = connexion_bdd();
    $sql="select count(*) from proche p where tel = ? and Adresse = ?
    and Nom = ? and Prenom = ?;";
    $stmt=$pdo->prepare($sql);
    $stmt->execute(array($tel, $nom, $prenom, $adresse));
    return $stmt;
}

function  hospi($NomSecu, $NumSecu, $Assurance, $ALD, $NomMutu, $NumAdherent, $TypeChambre, 
          $civ, $nom, $epouse, $prenom, $naissance, $adresse, $cp, $ville, $mail, $tel,
          $preadd, $datehospi, $heurehospi, $nompersonnel) {

    $pdo = connexion_bdd();

    $sql="INSERT INTO ap.couverturesociale
    (NomSecu, NumSecu, Assurance, ALD, NomMutu, NumAdherent, TypeChambre)
    VALUES(?,?,?,?,?,?,?);";
    $stmt=$pdo->prepare($sql);
    $stmt->execute(array($NomSecu, $NumSecu, $Assurance, $ALD, $NomMutu, $NumAdherent, $TypeChambre));

    $sql="INSERT INTO ap.hospi
    (DateHospi, HeureHospi, PreAdd, IdPersonnel)
    VALUES(?,?,?,?);";
    $stmt=$pdo->prepare($sql);
    $stmt->execute(array($preadd, $datehospi, $heurehospi, $nompersonnel));

    $sql="INSERT INTO ap.patients 
    (Civ, NomNaissance, NomEpouse, PrenomPatient, NaissancePatient, AdressePatient,
    TelPatient,CPPatient, VillePatient, MailPatient, NumSecu, Mineur, IdProcheConf, idProchePre)
    VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
    $stmt=$pdo->prepare($sql);
    $stmt->execute(array($civ, $nom, $epouse, $prenom, $naissance, $adresse, $tel, $cp, $ville, 
    $mail, $NumSecu, 0, 1, 1));

    header("location: index.php");
}

function uploadFichiers($CarteId, $nomF, $extentionValides, $CarteVitale, $CarteMutuel,
                        $LivretFamille, $DecisionJuge, $AutorisationSoin ) {
    //Id Card
    $fichierUpload = strtolower(substr(strchr($_FILES["CarteId"]["name"], '.'), 1));
    if(in_array($fichierUpload, $extentionValides)) {
        $_FILES["CarteId"]["name"] = "Id_Card_".$_SESSION["NumSecu"];
        $nomF = $_FILES["CarteId"]["name"];
        $fichier = $nomF.'.'.$fichierUpload;
        $cheminFichier = "../Fichiers/".$fichier;
        $uploadFichier = move_uploaded_file($_FILES['CarteId']["tmp_name"], $cheminFichier);
    }
    if(is_readable($cheminFichier)) {
        uploadFichier($_SESSION["NumSecu"], $_FILES['CarteId']["tmp_name"]);
    }

    // Vitale Card
    $fichierUpload = strtolower(substr(strchr($_FILES["CarteVitale"]["name"], '.'), 1));
    if(in_array($fichierUpload, $extentionValides)) {
        $_FILES["CarteVitale"]["name"] = "Id_Card_".$_SESSION["NumSecu"];
        $nomF = $_FILES["CarteVitale"]["name"];
        $fichier = $nomF.'.'.$fichierUpload;
        $cheminFichier = "../Fichiers/".$fichier;
        $uploadFichier = move_uploaded_file($_FILES['CarteVitale']["tmp_name"], $cheminFichier);
    }
    if(is_readable($cheminFichier)) {
        uploadFichier($_SESSION["NumSecu"], $_FILES['CarteVitale']["tmp_name"]);
    }

    // Carte Mutuel
    $fichierUpload = strtolower(substr(strchr($_FILES["CarteMutuel"]["name"], '.'), 1));
    if(in_array($fichierUpload, $extentionValides)) {
        $_FILES["CarteMutuel"]["name"] = "Id_Card_".$_SESSION["NumSecu"];
        $nomF = $_FILES["CarteMutuel"]["name"];
        $fichier = $nomF.'.'.$fichierUpload;
        $cheminFichier = "../Fichiers/".$fichier;
        $uploadFichier = move_uploaded_file($_FILES['CarteMutuel']["tmp_name"], $cheminFichier);
    }
    if(is_readable($cheminFichier)) {
        uploadFichier($_SESSION["NumSecu"], $_FILES['CarteMutuel']["tmp_name"]);
    }

    //Test si le patient es mineur
    $isMinieur = isMineur($_SESSION["NumSecu"]);
    if ($row = $isMinieur->fetch()) {
        // LivretFamille
        $fichierUpload = strtolower(substr(strchr($_FILES["LivretFamille"]["name"], '.'), 1));
        if(in_array($fichierUpload, $extentionValides)) {
            $_FILES["LivretFamille"]["name"] = "Id_Card_".$_SESSION["NumSecu"];
            $nomF = $_FILES["LivretFamille"]["name"];
            $fichier = $nomF.'.'.$fichierUpload;
            $cheminFichier = "../Fichiers/".$fichier;
            $uploadFichier = move_uploaded_file($_FILES['LivretFamille']["tmp_name"], $cheminFichier);
        }
        if(is_readable($cheminFichier)) {
            uploadFichier($_SESSION["NumSecu"], $_FILES['LivretFamille']["tmp_name"]);
        }
        // DecisionJuge
        $fichierUpload = strtolower(substr(strchr($_FILES["DecisionJuge"]["name"], '.'), 1));
        if(in_array($fichierUpload, $extentionValides)) {
            $_FILES["DecisionJuge"]["name"] = "Id_Card_".$_SESSION["NumSecu"];
            $nomF = $_FILES["DecisionJuge"]["name"];
            $fichier = $nomF.'.'.$fichierUpload;
            $cheminFichier = "../Fichiers/".$fichier;
            $uploadFichier = move_uploaded_file($_FILES['DecisionJuge']["tmp_name"], $cheminFichier);
        }
        if(is_readable($cheminFichier)) {
            uploadFichier($_SESSION["NumSecu"], $_FILES['DecisionJuge']["tmp_name"]);
        }
        // AutorisationSoin
        $fichierUpload = strtolower(substr(strchr($_FILES["AutorisationSoin"]["name"], '.'), 1));
        if(in_array($fichierUpload, $extentionValides)) {
            $_FILES["AutorisationSoin"]["name"] = "Id_Card_".$_SESSION["NumSecu"];
            $nomF = $_FILES["AutorisationSoin"]["name"];
            $fichier = $nomF.'.'.$fichierUpload;
            $cheminFichier = "../Fichiers/".$fichier;
            $uploadFichier = move_uploaded_file($_FILES['AutorisationSoin']["tmp_name"], $cheminFichier);
        }
        if(is_readable($cheminFichier)) {
            uploadFichier($_SESSION["NumSecu"], $_FILES['AutorisationSoin']["tmp_name"]);
        }
    }



    /*hospi($_SESSION["NomSecu"], $_SESSION["NumSecu"], $_SESSION["Assurance"], 
        $_SESSION["ALD"], $_SESSION["NomMutu"], $_SESSION["NumAdherent"], $_SESSION["TypeChambre"], 
            $_SESSION["civ"], $_SESSION["nom"], $_SESSION["epouse"], $_SESSION["prenom"], 
            $_SESSION["naissance"], $_SESSION["adresse"], $_SESSION["cp"], $_SESSION["ville"], 
            $_SESSION["mail"], $_SESSION["tel"],
            $_SESSION["preadd"], $_SESSION["datehospi"], $_SESSION["heurehospi"], $_SESSION["nompersonnel"]);*/
}

function uploadFichier($NumSecu, $nomF) {
    $pdo = connexion_bdd();
    $sql="INSERT INTO ap.piecesjointes 
    (CarteId, CarteVitale, CarteMutuel, LivretFamille, AutorisationSoin, DecisionJuge, 
    NumSecu)
    VALUES(?, ?, ?, ?, ?, ?, ?);";
    $stmt=$pdo->prepare($sql);
    $stmt->execute(array($nomF, 0, 0, 0, 0, 0, $NumSecu));
    return $stmt;
}

function isMineur($id) {
    $pdo = connexion_bdd();
    $sql="SELECT Mineur from patients WHERE NumSecu = ?";
    $stmt=$pdo->prepare($sql);
    $stmt->execute(array($id));
    return $stmt;
}
?>