<?php 
    require("requete.php");
    $_SESSION["form"];
    if (($_SESSION["form"] != 0) or ($_SESSION["form"] != null)) {
        $_SESSION["form"] = $_SESSION["form"];
    }
    else {
        $_SESSION["form"] = 0;
    }
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="formulaire.css">
	<title>Formulaire</title>
</head>
<body>
	<section>	
    <!--récup préad-->
        <?php
            if ($_SESSION["form"] == 0) {
        ?>
            <form action="requete.php" method="POST">
                <!-- préadmission -->
                <h2>PREADMISSION</h2> 
                <label for="choixhospi">quel hospitalisation ? </label><br> 
                <select  name ="choixhospi" id="choixhospi">
                    <option value="1">Pré-ad</option>
                    <option value="2">hospitalisation</option> 
                </select>
                <p>Date d'hospitalisation<br><input type="date"  name="datehospi"value="jj-mm-aaaa" min="01-09-2022" max="01-09-2222"></p>
                <p>Heure d'hospitalisation<br><input type="time" id="heurehospi" name="heurehospi" min="09:00" max="20:00" required></p>
                <label for="medecin">quel medecin ? </label><br> 
                <select  name ="medecin" id="medecin">
                    <option value="1">medecin1</option>
                    <option value="2">medecin2</option>
                    <option value="3">medecin3</option>    
                </select> <br><br>
                <input type="submit" name="pread" value="Envoyer"/>
            </form>
        <?php 
            }
        ?>

    <!--récup info patient-->
        <?php 
            if($_SESSION["form"] == 1) {
        ?>
        <form action="requete.php" method="POST">
            <!-- INFORMATION CONCERNANT LE PATIENT -->
            <h2>Information concernant le patient</h2>   
            <label for="civ">Civ.*</label><br>
            <select name="civ" id="civ">
                <option value="1">Mr</option>
                <option value="2">Mme</option>
                <option value="3">Autre</option>
            </select>
            <p>Nom de naissance*<br><input type="text" name="nom"/></p>
            <p>Nom d'épouse<br><input type="text" name="epouse"/></p>
            <p>Prénom*<br><input type="text" name="prenom"/></p>
            <p>Date de naissance*<br><input type="date" name="naissance"/></p>
            <p>Adresse*<br><textarea name="adresse" rows="1" cols="50"></textarea></p>
            <p>CP*<br><input type="text" name="cp"/></p>
            <p>Ville*<br><input type="text" name="ville"/></p>
            <p>Email*<br><input type="email" name="mail"/></p>
            <p>Téléphone<br><input type="tel" name="tel"/></p>
            <input type="submit" name="infoP" value="Envoyer"/>
        </form>
        <?php
            }
        ?>

    <!--récup info Assurance-->
        <?php 
            if($_SESSION["form"] == 2) {
        ?>
        <form action="requete.php" method="POST">
            <!-- Information complémentaire -->
            <h2>INFORMATION COMPLEMENTAIRE</h2> 
            <p>Organisme de sécurité sociale / Nom de la caisse d'assurance maladie<br><input type="text" name="NomSecu"></p>
            <p>Numéro de sécurité sociale<br><input type="text" name="NumSecu"></p>
            <label for="Assurance">Le patient est-il assuré?</label><br>
            <select name ="Assurance" id="Assurance">
                <option >Oui</option>
                <option >Non</option>
            </select>
            <br>
            <label for="Ald"><br>Le patient est-il en ALD?</label><br>
            <select name ="Ald" id="Ald">
                <option >Oui</option>
                <option >Non</option>
            </select>
            <p>Nom de la mutuelle ou de l'assurance<br><input type="text" name="NomMutu" ></p>
            <p>Numéro d'adhérent<br><input type="text" name=NumAdherent></p>
            <label for="TypeChambre">Chambre Particulière</label><br>
            <select name ="TypeChambre" id="TypeChambre">
                <option >choix</option>
                <option >Oui</option>
                <option >Non</option>
            </select>
            <input type="submit" name="infoC" value="Envoyer"/>
        </form>
        <?php
            }
        ?>

    <!--récup info contact-->
        <?php 
            if($_SESSION["form"] == 3) {
        ?>
        <form action="requete.php" method="POST">
             <!-- Information personnes a prevenir-->
             <h2>COORDONNEES PERSONNE A PREVENIR</h2> 

            <p>Nom<br><input type="text" name="nomppre"/></p>

            <p>Prénom<br><input type="text" name="prenomppre"/></p>

            <p>Téléphone<br><input type="tel" name="telppre"/></p>

            <p>Adresse<br><textarea name="adresseppre"></textarea></p>

            <!-- Coordonnees personnes de confiance-->
            <h2>COORDONNEES PERSONNES DE CONFIANCE</h2>

            <p>Nom<br><input type="text" name="nomconf"/></p>

            <p>Prénom<br><input type="text" name="prenomconf"/></p>

            <p>Téléphone<br><input type="tel" name="telconf"/></p>

            <p>Adresse<br><input type="text" name="adresseconf"/></p>
            <input type="submit" name="Coords" value="Envoyer"/>
        </form>
        <?php
            }
        ?>

    <!--récup pièce joint-->
        <?php 
            if($_SESSION["form"] == 4) {
        ?>
        <form action="requete.php" method="POST" enctype="multipart/form-data">
            <!-- pièces jointes -->
            <h2>PIECES JOINTES</h2> 
            <span>Attention les seul Formats apccecter sont : png, jpeg, jpg et pdf !</span>

            <p>Carte d'indentite (reto/verso) :<br><input type="file" value="Choisir un fichier" name="CarteId"></p>

            <p>Carte vitale :<br><input type="file" value="Choisir un fichier" name="CarteVitale"></p>

            <p>Carte de mutuelle :<br><input type="file" value="Choisir un fichier" name="CarteMutuel"></p>

            <p>Si enfant mineur seulment :</p>

            <p>Livrer de famille (pour enfant mineur) :<br><input type="file" value="Choisir un fichier" name="LivretFamille"></p>

            <p>Décision du juge :<br><input type="file" value="Choisir un fichier" name="DecisionJuge"></p>

            <p>Autorisation des 2 parents :<br><input type="file" value="Choisir un fichier" name="AutorisationSoin"></p>
            <input type="submit" name="pieceJiont" value="Envoyer"/>
        </form>
        <?php
            }
        ?>
	</section>
</body>
</html>