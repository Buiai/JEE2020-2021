<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="../css/Projet_dp.css">
</head>

<%
  String tab = (String) request.getAttribute("tab");
  String error = (String) request.getAttribute("error");
  String showAccueil = "";
  String showConnexion = "";
  String showInscritpion = "";

  switch(tab){
    case "connexion":
      showConnexion = " active show";
      break;
    case "inscription":
      showInscritpion = " active show";
      break;
    default:
      showAccueil = " active show";
      break;
  }

  String showErrorConnexion = " ghost ";
  String showErrorInscritpion = " ghost ";

  switch (error){
    case "connexion":
      showErrorConnexion = "";
      break;
    case "inscription":
      showErrorInscritpion = "";
      break;
  }

%>

<body style="">
<nav class="navbar navbar-dark bg-dark">
  <div class="container d-flex justify-content-center"> <a class="navbar-brand" href="#">
    <i class="fa fa-lg fa-circle-o d-inline"></i>
    <b> ANTI COVID</b>
  </a> </div>
</nav>
<div class="text-center pb-5" style="	background-image: url(../images/wallpaperflare.com_wallpaper.jpg);	background-size: cover;	background-position: top left;	background-repeat: repeat;">
  <div class="container text-center py-0 pb-5">
    <div class="row text-center ghost">
      <ul class="nav nav-tabs p-5 mx-auto col-md-8 col-10" style="text-align: left;">
        <li class="ghost" style=""><a href="#contentAccueil" data-toggle="tab" id="first_tab">First</a></li>
        <li class="ghost" style=""><a href="#contentConnexion" data-toggle="tab" id="second_tab">Second</a></li>
        <li class="ghost"><a href="#contentInscription" data-toggle="tab" id="third_tab">Third</a></li>
      </ul>
    </div>
    <div class="row justify-content-center pt-5">
      <div class="tab-content">
        <div id="contentAccueil" class="tab-pane fade in <%=showAccueil%>">
          <div class="bg-white mx-auto col-12 col-md-12 p-5">
            <h3 class="display-2">Anti Covid</h3><img class="d-block mx-auto" src="../images/covid-main.png">
            <h4>Alertez et soyez alerté en cas d'exposition à la Covid-19</h4>
            <a class="btn btn-outline-primary btn-lg align-center px-5 my-4 mx-2" onclick="$('#second_tab').trigger('click')">Connexion</a>
            <a class="btn btn-outline-primary btn-lg align-center px-5 my-4 mx-2" style="background-position: left top; background-size: 100%; background-repeat: repeat;" onclick="$('#third_tab').trigger('click')">Inscription</a>
          </div>
        </div>


        <div id="contentConnexion" class="tab-pane fade in  <%=showConnexion%>">
          <div class="bg-white justify-content-center pl-5 pr-5 pt-5">
            <h1 class="mb-4">Connexion</h1>
            <form method="post">
              <div class="form-group"> <input type="email" class="form-control" id="form9" name="form9" placeholder="E-mail"> </div>
              <div class="form-group mb-3"> <input type="password" class="form-control ml-auto" placeholder="Mot de passe" id="form10" name="form10">  </div>
              <div class="alert alert-danger <%=showErrorConnexion%>" role="alert">Identifiants invalides. Veuillez Réessayer.</div>
              <button type="submit" name="Button" value="Connexion" class="btn btn-lg btn-outline-primary px-5 mr-2">Valider</button><a class="btn btn-lg px-5 pl-2 ml-2 btn-outline-warning text-warning" onclick="$('#first_tab').trigger('click')">Annuler</a>
            </form>
            <div class="row justify-content-center mt-3">
              <div class=" justify-content-center pt-4">Pas encore membre ? <a onclick="$('#third_tab').trigger('click')" class="btn btn-lg align-center btn-link d-flex text-secondary my-0 mx-2 mb-5" href="#">Créer un compte</a>
              </div>
            </div>
          </div>
        </div>
        <div id="contentInscription" class="tab-pane fade in  <%=showInscritpion%>">
          <div class="bg-white justify-content-center pl-5 pr-5 pt-5">
            <h1 class="mb-4">Inscription</h1>
            <form method="post">
              <div class="form-group"> <input type="email" class="form-control" id="emailInput" name="emailInput" placeholder="E-mail"> </div>
              <div class="form-group"> <input type="password" class="form-control" placeholder="Mot de passe" name="mdpInput" id="mdpInput"> </div>
              <div class="form-group"> <input type="text" class="form-control" id="nomInput" name="nomInput" placeholder="Nom"> </div>
              <div class="form-group"> <input type="text" class="form-control" id="prenomInput" name="prenomInput" placeholder="Prénom"> </div>
              <div class="form-group"> <input type="date" class="form-control" id="dateInput" name="dateInput" placeholder="Date de naissance"> </div>
              <div class="alert alert-danger <%=showErrorInscritpion%>" role="alert">Données invalides. Veuillez Réessayer.</div>
              <button type="submit" name="Button" value="Inscription" class="btn btn-lg btn-outline-primary px-5 mr-2">Valider</button><a class="btn btn-lg px-5 pl-2 ml-2 btn-outline-warning text-warning" onclick="$('#first_tab').trigger('click')">Annuler</a>
            </form>
            <div class="row justify-content-center mt-3">
              <div class="justify-content-center pt-4">Déjà membre ?<a onclick="$('#second_tab').trigger('click')" name="boutonConnexion" href="#" class="btn btn-lg align-center btn-link d-flex text-secondary my-0 mx-2 mb-5">Connexion</a></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="" style="">
  <div class="container border-bottom py-5">
    <div class="row text-center">
      <div class="col-md-10 col-lg-12 text-center px-5">
        <h1 class="mb-3 my-3 pb-3" style="">C'est quoi ?</h1>
        <p style="" class="text-justify w-100 px-5">Face à l’accélération de l’épidémie, nous devons mobiliser tous les outils à notre disposition. Casser les chaînes de transmission de la COVID-19 est plus que jamais indispensable. Dans ce contexte, l’application Anti Covid vise à faciliter l’information des personnes qui ont été en contact avec une personne testée positive à la COVID-19 et à accélérer leur prise en charge. En cela, Anti Covid complète l’arsenal des mesures barrières déjà existantes face à la COVID-19.</p>
      </div>
    </div>
  </div>
</div>
<div class="text-center" style="">
  <div class="container border-bottom py-5">
    <div class="row">
      <div class="col-md-12 text-center">
        <h1 class="pb-3">Comment ça marche ?</h1>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-md-4 p-4"> <i class="d-block fa fa-circle fa-3x mb-2 text-muted pb-2"></i>
        <h5>Renseignez la date et le lieu de vos déplacements</h5>
      </div>
      <div class="col-md-4 col-6 p-4">
        <div class="row">
          <div class="col-md-12" style="">
            <div class="row">
              <div class="col-md-12"><i class="d-block fa fa-stop-circle-o fa-3x mb-2 text-muted pb-2"></i></div>
            </div>
            <h5>Si vous êtes infecté, signalez-le</h5>
          </div>
        </div>
      </div>
      <div class="col-md-4 col-6 p-4"> <i class="d-block fa fa-circle-o fa-3x mb-2 text-muted pb-2"></i>
        <h5 class="text-center">Recevez une notification lorsqu'une personne que vous avez cotoyée s'est signalée</h5>
      </div>
    </div>
  </div>
</div>
<div class="py-3" style="">
  <div class="container w-25">
    <div class="row text-center">
      <div class="text-center col-md-12">
        <h4 class=""> <b>A propos</b></h4>
        <p class="mb-0"> Anti Covid est un projet réalisé par Paul GEORGES et Louy MASSET dans le cadre de leur Master 1 Informatique&nbsp;</p>
      </div>
    </div>
    <div class="row text-center">
      <div class="col-6 text-center pt-3 col-lg-12"> </div>
    </div>
    <div class="row">
      <div class="col-md-12 text-center">
        <p class="mb-0 mt-2">© 2020-201. All rights reserved</p>
      </div>
    </div>
  </div>
</div>
</body>

</html>