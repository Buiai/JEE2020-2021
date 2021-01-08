package servlet;

import java.io.IOException;
import java.sql.*;
import dao.ConnexionBDD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ServletAccueil")
public class ServletAccueil extends HttpServlet {

	private static final long serialVersionUID = 1L;

    public ServletAccueil() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	if(request.getAttribute("tab") == null) {
			request.setAttribute("tab", "accueil");
		}
		request.setAttribute("error", "");
		getServletContext().getRequestDispatcher("/jsp/accueil.jsp").forward(request, response);
		ConnexionBDD.getInstance();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String s = request.getParameter("Button");
		String tab = "accueil";
		String error = " ";

		String mailConnexion = request.getParameter("form9");
		String mdpConnexion = request.getParameter("form10");

		String mailInscr = request.getParameter("emailInput");
		String mdpInscr = request.getParameter("mdpInput");
		String nomInscr = request.getParameter("nomInput");
		String prenomInscr = request.getParameter("prenomInput");
		String dateInscr = request.getParameter("dateInput");

		String login = "";

		try {
			if (s.equals("Connexion")) {
				tab = "connexion";
				if(ConnexionBDD.getInstance().bdd().utilisateurExiste(mailConnexion, mdpConnexion)){
					tab = "compte";
					login = mailConnexion;
				} else {
					error = "connexion";
				}
			} else if(s.equals("Inscription")){
				tab = "inscription";
				if(ConnexionBDD.getInstance().bdd().ajouterUtilisateur(mailInscr, mdpInscr, nomInscr, prenomInscr, dateInscr)){
					tab = "compte";
					login = mailInscr;
				} else {
					error = "inscription";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}


		if(!tab.equals("compte")){
			request.setAttribute("tab", tab);
			request.setAttribute("error", error);
			getServletContext().getRequestDispatcher("/jsp/accueil.jsp").forward(request, response);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("login", login);
			response.sendRedirect(request.getContextPath()+"/MonCompte");
		}

	}

}
