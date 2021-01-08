<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>

<%

  String showAlert = (String) request.getAttribute("alert");

%>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="../css/Projet_dp.css">
</head>

<body>
<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
  <div class="container"> <button class="navbar-toggler navbar-toggler-right border-0 p-0" type="button" data-toggle="collapse" data-target="#navbar" style="">
    <p class="navbar-brand mb-0 text-white">
      <i class="fa d-inline fa-lg fa-stop-circle"></i> BRAND </p>
  </button>
    <div class="collapse navbar-collapse" id="navbar14">
      <form name="myForm">


        <ul class="navbar-nav mr-auto">
          <li class="nav-item text-dark"> <a class="nav-link" href="<%=request.getContextPath()+"/MonCompte"%>">Compte</a> </li>
        <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()+"/Activites"%>">Activités</a> </li>
        <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()+"/Amis"%>">Amis</a> </li>
      </ul>
      </form>
      <p class="d-none d-md-block lead mb-0  text-white"> <i class="fa d-inline fa-lg fa-stop-circle"></i>&nbsp;AntiCovid&nbsp;</p>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item mx-1"> <a class="nav-link" href="#">
          <i class="fa fa-bell-o fa-fw fa-lg"></i>
          <span class="badge badge-notify">3</span>
        </a> </li>
        <li class="nav-item mx-1">
          <a class="btn btn-outline-light" href="#">Déconnexion</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="text-center pt-5">
  <div class="container border-bottom pb-5">
    <div class="row">
      <div class="mx-auto col-md-7 col-10 col-lg-6">
        <h1 class="mb-3">Vous avez été testé positif ?</h1>
        <p class="mb-3">Signalez-le nous afin de prévenir toutes les personnes en contact avec vous ces 10 derniers jours !</p>
        <form method="post">
          <button name="Button" value="Infection" class="btn px-5 btn-danger">Je suis positif</button>
        </form>
      </div>
    </div>
  </div>
</div>
<div class="py-5 text-center">
  <div class="container">
    <div class="alert alert-success alert-dismissible fade <%=showAlert%>" role="alert">
      Mise à jour de votre compte effectuée !
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <div class="row">
      <div class="mx-auto col-lg-6 col-10">
        <h1>Modification</h1>
        <p class="mb-3" contenteditable="true">Modifiez les paramètres de votre compte</p>
        <form method="post" class="text-left">
          <div class="form-group"> <label for="nom">Nom</label> <input type="text" class="form-control" id="nom" placeholder="Nom" name="nom"> </div>
          <div class="form-group"> <label for="prenom">Prénom</label> <input type="text" class="form-control" id="prenom" placeholder="Prénom" name="prenom"> </div>
          <div class="form-group"> </div><label for="mail">E-mail</label>
          <div class="form-group"><input type="email" class="form-control" id="mail" placeholder="E-mail" name="mail"></div>
          <div class="form-row">
            <div class="form-group col-md-12"> <label for="mdp">Mot de passe</label> <input type="password" class="form-control" placeholder="Mot de passe" id="mdp" name="mdp"> </div>
          </div>
          <button name="Button" value="Modification" type="submit" class="btn btn-primary">Valider</button>
        </form>
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>

</html>