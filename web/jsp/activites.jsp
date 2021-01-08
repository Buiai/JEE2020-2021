<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.Activite" %>
<%@ page import="beans.Lieu" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="../css/Projet_dp.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script> $(function () {
    $("#lieu a").click(function () {
      $("#dropdownMenu1").html($(this).html());
      $("#lieuActivite").val($("#dropdownMenu1").html());
    });
  });
  </script>
  <link rel="stylesheet" href="css/Projet_dp.css">
</head>


<%
  String tab = (String) request.getAttribute("tab");
  String error = (String) request.getAttribute("error");
  String showActivite = "";
  String showLieu = "";

  switch(tab){
    case "activite":
      showActivite = " active show";
      break;
    case "lieu":
      showLieu = " active show";
      break;
  }

  String showErrorActivite = " ghost ";
  String showErrorLieu = " ghost ";

  switch (error){
    case "activite":
      showActivite = "";
      break;
    case "lieu":
      showErrorLieu = "";
      break;
  }

%>


<body class="modal-open" style="padding-right: 17px;">
<nav class="navbar navbar-expand-lg bg-dark navbar-dark" style="" draggable="true">
  <div class="container"> <button class="navbar-toggler navbar-toggler-right border-0 p-0" type="button" data-toggle="collapse" data-target="#navbar" style="">
    <p class="navbar-brand mb-0 text-white">
      <i class="fa d-inline fa-lg fa-stop-circle"></i> BRAND </p>
  </button>
    <div class="collapse navbar-collapse" id="navbar14">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item text-dark"> <a class="nav-link" href="<%=request.getContextPath()+"/MonCompte"%>">Compte</a> </li>
        <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()+"/Activites"%>">Activités</a> </li>
        <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath()+"/Amis"%>">Amis</a> </li>
      </ul>
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
<div class="py-5 text-center">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-left">
        <h1 class="display-4 mb-4" contenteditable="true">Mes activités</h1>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12" style="">
        <ul class="list-group text-left">


          <%ArrayList<Activite> activites =  (ArrayList<Activite>)request.getAttribute("activites");%>
        <%for(Activite a : activites){
            String dateDebut = a.getDateDebut();
            String dateFin = a.getDateFin();
            String [] mois = new String[13];
            System.out.println(dateDebut);
            System.out.println(dateFin);
            mois[0] = " ";
            mois[1] = "Jan";
            mois[2] = "Fev";
            mois[3] = "Mar";
            mois[4] = "Avr";
            mois[5] = "Mai";
            mois[6] = "Jun";
            mois[7] = "Jui";
            mois[8] = "Aou";
            mois[9] = "Sep";
            mois[10] = "Oct";
            mois[11] = "Nov";
            mois[12] = "Dec";
            String jourDebut = dateDebut.substring(8, 10);
            String moisDebut = mois[Integer.parseInt(dateDebut.substring(5, 7))];
            String heureDebut = dateDebut.substring(11, 16);
            String jourFin = dateFin.substring(8, 10);
            String moisFin = mois[Integer.parseInt(dateFin.substring(5, 7))];
            String heureFin = dateFin.substring(11, 16);
            String nom = a.getNom();
            String lieu = a.getNomLieu() + ", " + a.getAdresseLieu();%>


            <li class="list-group-item pl-4 text-center">
              <div class="row">
                <div class="col-md-4">
                  <div class="row">
                    <div class="col-md-12">
                      <h1 class="px-1"><span class="badge badge-secondary"><%=jourDebut%></span> <%=moisDebut%></h1>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="row text-center d-flex justify-content-center">
                        <i class="fa fa-clock-o pi-draggable">
                        </i>
                        <h6 style="" class="pl-1" contenteditable="true"><%=heureDebut%></h6>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="row">
                    <div class="col-md-12">
                      <h3 class="text-uppercase text-center"><strong><%=nom%></strong></h3>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <h5 class=""><%=lieu%></h5>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="row">
                    <div class="col-md-12">
                      <h1 class="px-1"><span class="badge badge-secondary"><%=jourFin%></span> <%=moisFin%></h1>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="row text-center d-flex justify-content-center">
                        <i class="fa fa-clock-o pi-draggable">
                        </i>
                        <h6 style="" class="pl-1" contenteditable="true"><%=heureFin%></h6>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </li>
          <%}%>


        </ul>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 py-4">
        <a class="btn btn-outline-secondary px-3 mx-3" href="#" data-toggle="modal" data-target="#activiteModal">Créer une activité</a>
        <a class="btn btn-outline-secondary px-4 mx-3" href="#" data-toggle="modal" data-target="#lieuModal">Créer un lieu</a></div>
    </div>
  </div>
</div>
<div class="modal fade <%=showLieu%>" id="lieuModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="margin-top: 250px; padding-right: 17px;" aria-modal="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="">
        <h5 class="modal-title">Nouveau lieu</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post">
          <div class="form-group">
            <input type="text" class="form-control mb-2" name="nomLieu" placeholder="Nom">
            <input type="text" class="form-control" name="adresse" placeholder="Adresse">
          </div>
          <div class="alert alert-danger <%=showErrorLieu%>" role="alert">Données invalides ou manquantes. Veuillez Réessayer.</div>
          <div class="modal-footer" style="">
            <button type="submit"  name="valider" value="lieu" class="btn btn-primary">Valider</button><button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<div class="modal fade <%=showActivite%>" id="activiteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="margin-top: 250px; padding-right: 17px;" aria-modal="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="">
        <h5 class="modal-title">Nouvelle activité</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="" method="post">
          <input type="text" class="form-control" name="nomActivite" placeholder="Nom">
          <div class="form-group">
            <div class="form-group row" style="">
              <div class="form-group row" style="">
              </div>
              <div class="col-md-12">
                <div class="row">
                  <div class="col-md-11   offset-md-1" style="">

                    <div class="form-group">
                      <input type="text" class="form-control ghost"  id="lieuActivite" name="lieuActivite">

                      <button class="btn btn-default dropdown-toggle form-control btn-outline-primary mt-3" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Lieu </button>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" id="lieu" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-14px, 124px, 0px);" name="mydd" x-placement="bottom-start">
                        <%ArrayList<Lieu> lieux =  (ArrayList<Lieu>)request.getAttribute("lieux");%>
                        <%for(Lieu l : lieux){
                          String lieu = l.getNom() + ", " + l.getAdresse();%>
                        <li><a href="#"><%=lieu%></a></li>
                        <%}%>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group row" style="">
              <div class="form-group row" style="">
              </div>
            </div>
            <div class="form-group row" style="">
              <label for="datetime1" class="col-2 col-form-label">Début</label>
              <div class="col-10">
                <input class="form-control" type="datetime-local" value="2021-01-19T13:45:00" id="datetime1" name="dateDebut">
              </div>
            </div>
            <div class="form-group row" style="">
              <label for="datetime2" class="col-2 col-form-label">Fin</label>
              <div class="col-10">
                <input class="form-control" type="datetime-local" value="2021-01-19T13:45:00" id="datetime2" name="dateFin">
              </div>
            </div>
            <div class="alert alert-danger <%=showErrorActivite%>" role="alert">Données invalides ou manquantes. Veuillez Réessayer.</div>
            <div class="modal-footer" style="">
              <button type="submit" name ="valider" value="activite" class="btn btn-primary">Valider</button><button type="button"  class="btn btn-secondary" data-dismiss="modal">Fermer</button>
            </div>
          </div>
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