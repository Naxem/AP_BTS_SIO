

function accueil(){
    const Acc = document.getElementById('CaseAccueil') ;
    const Tab = document.getElementById('CaseTab');
    const Graphique = document.getElementById('CaseGraphe');
    const ad = document.getElementById('ad');
    const ac = document.getElementById('ac');
    const gr = document.getElementById('gr');



    Acc.style.display="flex";
    Acc.style.transition= "all 0.5s ease;"
    Tab.style.display="none";    
    Graphique.style.display="none";
    ac.style.textDecoration="underline";
    ad.style.textDecoration="none";
    gr.style.textDecoration="none";
    document.getElementById('titre').style.display="block";
}


function Tab(){

    const Acc = document.getElementById('CaseAccueil') ;
    const Tab = document.getElementById('CaseTab');
    const Graphique = document.getElementById('CaseGraphe');
    const ad = document.getElementById('ad');
    const ac = document.getElementById('ac');
    const gr = document.getElementById('gr');

    Acc.style.display="none";
    Tab.style.display="flex";    
    Tab.style.transition= "all 0.5s ease;"
    Graphique.style.display="none";
    ac.style.textDecoration="none";
    ad.style.textDecoration="underline";
    gr.style.textDecoration="none";
    document.getElementById('titre').style.display="none";
}

function Graph(){
    const Acc = document.getElementById('CaseAccueil') ;
    const Tab = document.getElementById('CaseTab');
    const Graphique = document.getElementById('CaseGraphe');
    const ad = document.getElementById('ad');
    const ac = document.getElementById('ac');
    const gr = document.getElementById('gr');


    Acc.style.display="none";
    Tab.style.display="none";    
    Graphique.style.display="flex";
    Graphique.style.transition= "all 0.5s ease;"
    ac.style.textDecoration="none";
    ad.style.textDecoration="none";
    gr.style.textDecoration="underline";
    document.getElementById('titre').style.display="none";
}