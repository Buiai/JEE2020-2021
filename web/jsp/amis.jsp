<%--
  Created by IntelliJ IDEA.
  User: Paul
  Date: 07/01/2021
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/Projet_dp.css">
    <script type="text/javascript">
        function myFunction() {
            var input, filter, table, tr, td1, td2, td3, i, txtValue1, txtValue2, txtValue3;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td1 = tr[i].getElementsByTagName("td")[0];
                td2 = tr[i].getElementsByTagName("td")[1];
                td3 = tr[i].getElementsByTagName("td")[2];
                if (td1) {
                    txtValue1 = td1.textContent || td1.innerText;
                    txtValue2 = td2.textContent || td2.innerText;
                    txtValue3 = td3.textContent || td3.innerText;
                    if (txtValue1.toUpperCase().indexOf(filter) > -1 || txtValue2.toUpperCase().indexOf(filter) > -1 || txtValue3.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</head>

<body>
<nav class="navbar navbar-expand-lg bg-dark navbar-dark" style="">
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
<div class="py-3 text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="display-3 text-center">Mes amis</h1>
            </div>
        </div>
        <div class="row border-bottom d-flex justify-content-start">
            <div class="mx-auto p-4 offset-md-1 col-lg-7" style="">
                <ul class="list-group" style="max-height: 300px; overflow-y: auto;">
                    <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"> AMI 1 <a href="#"> <i class="fa fa-times fa-lg text-danger"></i></a></li>
                    <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"> AMI 2 <a href="#"> <i class="fa fa-times fa-lg text-danger"></i></a></li>
                    <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"> AMI 3 <a href="#"> <i class="fa fa-times fa-lg text-danger"></i></a></li>
                    <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"> AMI 4 <a href="#"> <i class="fa fa-times fa-lg text-danger"></i></a></li>
                    <li class="border-0 list-group-item d-flex align-items-center justify-content-between"> AMI 5 <a href="#"> <i class="fa fa-times fa-lg text-danger"></i></a></li>
                    <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"> AMI 6 <a href="#"> <i class="fa fa-times fa-lg text-danger"></i></a></li>
                    <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"> AMI 7 <a href="#"> <i class="fa fa-times fa-lg text-danger"></i></a></li>
                    <li class=" border-0 list-group-item d-flex justify-content-between align-items-center"> AMI 8 <a href="#"> <i class="fa fa-times fa-lg text-danger"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="text-center pb-5 pt-3">
    <div class="container border-0">
        <div class="row">
            <div class="col-md-12">
                <h1 class="display-3 text-center">Ajouter</h1>
            </div>
        </div>
        <div class="row d-flex justify-content-start border-bottom-0">
            <div class="mx-auto p-4 col-lg-12" style="">
                <div class="table-responsive" id="myTable" style="max-height: 350px; overflow-y: auto;">
                    <table class="table table-bordered ">
                        <thead class="thead-dark">
                        <tr>
                            <th>Prénom</th>
                            <th>Nom</th>
                            <th>E-Mail</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Mark</td>
                            <td>Herbert</td>
                            <td>mark@email.fr</td>
                        </tr>
                        <tr>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>jthornston@gmail.com</td>
                        </tr>
                        <tr>
                            <td>Larry</td>
                            <td>Bird</td>
                            <td>larry@example.net</td>
                        </tr>
                        <tr>
                            <td>Frank</td>
                            <td>Petit</td>
                            <td>fpetti65@mail.fr</td>
                        </tr>
                        <tr>
                        <tr>
                            <td>Horatiu</td>
                            <td>Cirstea</td>
                            <td>hcirstea@mail.fr</td>
                        </tr>
                        <tr>
                            <td>Emmanuel</td>
                            <td>Jeandel</td>
                            <td>jeandel@gmail.com</td>
                        </tr>
                        <tr>
                            <td>Mael</td>
                            <td>Beuget</td>
                            <td>mbeuget@gmail.com</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group"><input type="text" id="myInput" onkeyup="myFunction()" placeholder="Recherche" class="p-1 w-50"></div>
            </div>
            <div class="col-md-6"><a class="btn btn-outline-primary px-5 w-50" href="#">Ajouter</a></div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>

</html>