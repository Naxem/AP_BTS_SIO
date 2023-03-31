<!DOCTYPE html>

<?php 
    require_once('./requete.php');
    $IDPerso = $_SESSION["IdPersonnel"];
    $return_nom = return_nom($IDPerso);
    $return_nom = $return_nom->fetch();


    $IDPerso = $_SESSION["IdPersonnel"];
    $return_id_perso = return_id_perso($IDPerso);
    $return_id_perso = $return_id_perso->fetchAll();
    
       
    
    $return_etat= return_etat($IDPerso);
    $return_etat = $return_etat->fetch();
    


    $return_etat1= return_etat1($IDPerso);
    $return_etat1 = $return_etat1->fetch();
    
?>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/medecin.css">
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
</head>
<body>
    <div class="globale">

        <div class="navbar">
            <div class="logo"><img src="../css/medical.png" style="object-fit:cover; height:90%; width:90%;"><p>Clinique LPF</p></div>
            <div class=liens>
                <div class="accueil" id="ac" onclick=accueil()>Accueil</div>
                <div class="admis" id="ad" onclick=Tab()>Liste Admission</div>
                <div class="diag"  id="gr" onclick=Graph()>Resultats Graphique</div>
            </div>
            <div class="deco">
                <a href="./login.php" style="color:white;"><div class="decoz">Deconnexion</div></a>
            </div>
        </div>


        <div class="menu">
            <div class="titre" id='titre'> Panel Medecin</div>

            <div class="case" id="CaseAccueil">
                <p> <?php echo 'Bonjour '. $return_nom['PrenomPersonnel'] ?></p>
            </div>

            <div class="case" id="CaseTab">
                <div class="case1">
                    <div class="tableau">
                        <div class="titretab">
                            <div class="lignetab">Heure</div>
                            <div class="lignetab">Date</div>
                            <div class="lignetab">Prénom</div>
                            <div class="lignetab">Nom</div>
                        </div>
                        <?php
                            foreach($return_id_perso as $id_perso){
                            echo '<div class="tab">';
                            echo '<div class="lignetab">'.$id_perso['HeureHospi'].'</div>';
                            echo '<div class="lignetab">'.$id_perso['DateHospi'] . '</div>';
                            echo '<div class="lignetab">'.$id_perso['PrenomPatient'] .'<br> </div>';
                            echo '<div class="lignetab">'.$id_perso['NomNaissance'] .'<br> </div>';
                            echo '</div>';
                            }
                        ?>
                    </div> 
                </div> 
            </div>
                

            <div class="case" id="CaseGraphe">
            <canvas id="myChart"></canvas>

                <script>
                    const ctx = document.getElementById('myChart');
                        new Chart(ctx, {
                            type: 'pie',
                            data: {
                            labels: ['Fini', 'En cours'],
                            datasets: [{
                                label: 'Hospitalisations',
                                data: <?php echo '['.$return_etat1['count(*)'].','.$return_etat['count(*)'].']' ?>,
                                backgroundColor: [ 'lime', 'red'],
                                borderWidth: 1,
                                hoverOffset: 4
                            }]
                            },
                            options: {
                            scales: {
                                yAxes: [{
                                beginAtZero: true,
                                gridLines:{
                                display:false
                                }
                            }]
                        }
                        }
                        });
                </script>
                            
            </div> 
        </div>
        
            
            
            
            
         

            </div>
 
            







        

</div>

        </div>




    </div>
    <script src="../JS/medecin.js"></script>
</body>
</html>