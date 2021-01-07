package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import dao.ConnexionBDD;

/**
 * Servlet implementation class ServletAcceuil
 */
@WebServlet("/ServletAcceuil")
public class ServletAccueil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAccueil() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().getRequestDispatcher("/jsp/accueil.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean valide = false;
		try {
			if ("Connexion".equals((String)request.getParameter("Button"))) {
				valide = ConnexionBDD.getInstance().connecterUtilisateur(request.getParameter("form9"), request.getParameter("form10"));
			}
			else {
				valide = ConnexionBDD.getInstance().ajouterUtilisateur(request.getParameter("emailInput"),request.getParameter("mdpInput"),request.getParameter("nomInput"),request.getParameter("prenomInput"),request.getParameter("dateInput"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(valide) {
			HttpSession session = request.getSession();
			if("Connexion".equals((String)request.getParameter("Button"))) {
				session.setAttribute("login", request.getParameter("form9"));
			}
			else {
				session.setAttribute("login", request.getParameter("login"));
			}
			getServletContext().getRequestDispatcher("/jsp/moncompte.jsp").forward(request, response);
		}
		else {
			getServletContext().getRequestDispatcher("/jsp/accueil.jsp").forward(request, response);
		}
	}

}
