package servlet;

import beans.Activite;
import beans.Lieu;
import dao.ConnexionBDD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ServletActivites")
public class ServletActivites extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ServletActivites() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String login = (String)request.getSession().getAttribute("login");
        ArrayList<Activite> activites = ConnexionBDD.getInstance().bdd().getActivitesUtilisateur(login);
        ArrayList<Lieu> lieux = ConnexionBDD.getInstance().bdd().getLieux();

        request.removeAttribute("error");
        request.removeAttribute("tab");

        request.setAttribute("activites", activites);
        request.setAttribute("lieux", lieux);
        request.setAttribute("error", " ");
        request.setAttribute("tab", " ");

        getServletContext().getRequestDispatcher("/jsp/activites.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException  {

        String error = "";
        String tab = "";
        String s = request.getParameter("valider");
        String login = (String)request.getSession().getAttribute("login");


        if(s.equals("activite")){

            String nom = request.getParameter("nomActivite");
            String dateDebut = request.getParameter("dateDebut");
            String dateFin = request.getParameter("dateFin");
            String lieu = request.getParameter("lieuActivite");

            String[] separated = lieu.split(", ");

            if(separated.length == 2 && separated[1]!=null){
                if(ConnexionBDD.getInstance().bdd().ajouterActivite(login, nom, dateDebut, dateFin, separated[0], separated[1])) {
                    response.sendRedirect(request.getContextPath() + "/Activites");
                } else {
                    tab = "activite";
                    error = "activite";
                }
            } else {
                tab = "activite";
                error = "activite";
            }


        } else if(s.equals("lieu")){

            String nomLieu = request.getParameter("nomLieu");
            String adresse = request.getParameter("adresse");

            if(ConnexionBDD.getInstance().bdd().ajouterLieu(nomLieu, adresse)) {
                response.sendRedirect(request.getContextPath() + "/Activites");
            } else {
                tab = "lieu";
                error = "lieu";
            }
        }

        request.setAttribute("error", error);
        request.setAttribute("tab", tab);

        getServletContext().getRequestDispatcher("/jsp/activites.jsp").forward(request, response);

    }

}

