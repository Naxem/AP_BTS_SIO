<?php 
    require("requete.php");

    $_SESSION["modif_patient"]=$_SESSION["modif_patient"];

    if ($_SESSION["modif_patient"]) {
        $modif = true;
        $_SESSION["form"] = 0;
    } else {
        $_SESSION["form"];
        $modif = false;
    }

    if (($_SESSION["form"] != 0) or ($_SESSION["form"] != null)) {
        $_SESSION["form"] = $_SESSION["form"];
    }
    else {
        $_SESSION["form"] = 0;
    }

    $date = date("jj-mm-aaaa");
    $getmedecin = getMedecin()->fetchAll();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="formulaire.css">
    <!--CSS-->
    <link rel="stylesheet" href="../css/main.css">
	<title>Formulaire de pré-admistions</title>
</head>
<body>
    <section>
        <nav class="menu_top">
            <div class="annulation">
                <a href="../login.php">
                    <p> DECONNEXION </p>
                </a>
            </div>
            <div class="titre_top">
                <p> PRÉADMISSION </p>
            </div>
        </nav>
    </section>

	<section>	
    <!--récup préad-->
        <?php
            if ($_SESSION["form"] == 0) {
        ?>
            <section class="page1">
                <div class="globale">
                    <form action="requete.php" method="POST">
                       <div class="pread">
                            <!-- préadmission -->
                            <h2>PRADMISSION</h2> 
                            <label for="choixhospi">Type d'Hospitalisation </label><br> 
                            <select  name ="choixhospi" id="choixhospi">
                                <option value="1">Pré-admission</option>
                                <option value="2">Hospitalisation</option> 
                            </select>
                            <p>Date d'hospitalisation<br><input type="date"  name="datehospi"value="jj-mm-aaaa" min="<?= $date ?>" require></p>
                            <p>Heure d'hospitalisation<br><input type="time" id="heurehospi" name="heurehospi" min="09:00" max="21:00" required></p>
                            <label for="medecin">Medecin</label><br> 
                            <select  name ="medecin" id="medecin">
                                <?php 
                                $i = 0;
                                foreach ($getmedecin as $row) {
                                    $i = $i + 1;
                                    echo "<option value='".$i."'>".$row["PrenomPersonnel"] ." ". $row["NomPersonnel"]."</option>";
                                }
                                ?>   
                            </select><br><br>
                       </div>
                        <input type="submit" name="pread" value="Envoyer" class="bouton"/>
                    </form>
                </div>
            </section>
        <?php 
            }
        ?>

    <!--récup info patient-->
        <?php 
            if($_SESSION["form"] == 1) {
        ?>
        <section class="page2">
            <div class="globale">
                <form action="requete.php" method="POST">
                    <div class="patient">
                        <!-- INFORMATION CONCERNANT LE PATIENT -->
                        <h2>Information concernant le patient</h2>   
                        <label for="civ">Civilité</label><br>
                        <select name="civ" id="civ">
                            <option value="1">Mr</option>
                            <option value="2">Mme</option>
                            <option value="3">Autre</option>
                        </select>
                        <p>Nom de naissance*<br><input type="text" name="nom" require/></p>
                        <p>Nom d'épouse<br><input type="text" name="epouse"/></p>
                        <p>Prénom*<br><input type="text" name="prenom" require/></p>
                        <p>Date de naissance*<br><input type="date" name="naissance" require/></p>
                        <p>Adresse*<br><input name="adresse" rows="1" cols="50" require></p>
                        <p>CP*<br><input type="text" name="cp" require/></p>
                        <p>Ville*<br><input type="text" name="ville" require/></p>
                        <p>Email<br><input type="email" name="mail"/></p>
                        <p>Téléphone*<br><input type="tel" name="tel" require/></p>
                        <input type="submit" name="infoP" value="Envoyer"/>
                    </div>
                </form>
            </div>
        </section>
        <?php
            }
        ?>

    <!--récup info Assurance-->
        <?php 
            if($_SESSION["form"] == 2) {
        ?>
        <section class="page3">
            <div class="global">
                <form action="requete.php" method="POST">
                <div class="info">
                    <!-- Information complémentaire -->
                    <h2>INFORMATION COMPLEMENTAIRE</h2> 
                    <p>Organisme de sécurité sociale / Nom de la caisse d'assurance maladie*<br><input type="text" name="NomSecu" require></p>
                    <p>Numéro de sécurité sociale*<br><input type="text" name="NumSecu" require></p>
                    <label for="Assurance">Le patient est-il assuré?</label><br>
                    <select name ="Assurance" id="Assurance">
                        <option value = "1">Oui</option>
                        <option value = "0">Non</option>
                    </select>
                    <br>
                    <label for="Ald"><br>Le patient est-il en ALD?</label><br>
                    <select name ="Ald" id="Ald">
                        <option value = "1">Oui</option>
                        <option value = "0">Non</option>
                    </select>
                    <p>Nom de la mutuelle ou de l'assurance<br><input type="text" name="NomMutu"></p>
                    <p>Numéro d'adhérent<br><input type="text" name=NumAdherent></p>
                    <label for="TypeChambre">Chambre Particulière</label><br>
                    <select name ="TypeChambre" id="TypeChambre">
                        <option value = "1">Oui</option>
                        <option value = "0">Non</option>
                    </select>
                    <input type="submit" name="infoC" value="Envoyer"/>
                </div>
                </form>
            </div>
        </section>
        <?php
            }
        ?>

    <!--récup info contact-->
        <?php 
            if($_SESSION["form"] == 3) {
        ?>
        <section class="page4">
            <div class="globale">
                <form action="requete.php" method="POST">
                <div class="contact">
                    <!-- Information personnes a prevenir-->
                    <h2>COORDONNEES PERSONNE A PREVENIR</h2> 
                    <p>Nom<br><input type="text" name="nomppre" require/></p>
                    <p>Prénom<br><input type="text" name="prenomppre" require /></p>
                    <p>Téléphone<br><input type="tel" name="telppre" require/></p>
                    <p>Adresse<br><input type="text" name="adresseppre" require/></p>

                    <!-- Coordonnees personnes de confiance-->
                    <h2>COORDONNEES PERSONNES DE CONFIANCE</h2>
                    <p>Nom*<br><input type="text" name="nomconf" require/></p>
                    <p>Prénom*<br><input type="text" name="prenomconf" require/></p>
                    <p>Téléphone*<br><input type="tel" name="telconf" require/></p>
                    <p>Adresse*<br><input type="text" name="adresseconf" require/></p>
                    <input type="submit" name="Coords" value="Envoyer" class="bouton"/>
                </div>
                </form>
            </div>
        </section>
        <?php
            }
        ?>

    <!--récup pièce joint-->
        <?php 
            if($_SESSION["form"] == 4) {
        ?>
        <section class="page5">
            <div class="globale">
            <form action="requete.php" method="POST" enctype="multipart/form-data">
                <div class="pieceJoint">
                    <!-- pièces jointes -->
                    <h2>PIECES JOINTES</h2> 
                    <span>Attention les seuls formats apccecter sont : png, jpeg, jpg et pdf !</span>

                    <p>Carte d'indentite (reto/verso) :*<br><input type="file" value="Choisir un fichier" name="CarteId" required></p>
                    <p>Carte vitale :*<br><input type="file" value="Choisir un fichier" name="CarteVitale" require></p>
                    <p>Carte de mutuelle :*<br><input type="file" value="Choisir un fichier" name="CarteMutuel" require></p>

                    <p>Si enfant mineur seulment :</p>
                    <p>Livrer de famille (pour enfant mineur) :<br><input type="file" value="Choisir un fichier" name="LivretFamille"></p>
                    <p>Décision du juge :<br><input type="file" value="Choisir un fichier" name="DecisionJuge"></p>
                    <p>Autorisation des 2 parents :<br><input type="file" value="Choisir un fichier" name="AutorisationSoin"></p>
                    <input type="submit" name="pieceJiont" value="Envoyer"/>
                </div>
            </form>
            </div>
        </section>
        <?php
            }
        ?>
	</section>
</body>
</html>