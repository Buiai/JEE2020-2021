package servlet;

import dao.ConnexionBDD;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletMonCompte
 */
@WebServlet("/ServletMonCompte")
public class ServletMonCompte extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletMonCompte() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("alert","hide");
		getServletContext().getRequestDispatcher("/jsp/moncompte.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String log = (String) request.getSession().getAttribute("login");
		String s = request.getParameter("Button");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String mdp = request.getParameter("mdp");
		String newlogin = request.getParameter("mail");

		try {
			if (s.equals("Infection")) {
				ConnexionBDD.getInstance().bdd().infection(log);
			}
			else{
				if (!nom.equals("")){
					ConnexionBDD.getInstance().bdd().modifierNomUtilisateur(nom,log);
				}
				if (!prenom.equals("")){
					ConnexionBDD.getInstance().bdd().modifierPrenomUtilisateur(prenom,log);
				}
				if (!mdp.equals("")){
					ConnexionBDD.getInstance().bdd().modifierMdpUtilisateur(mdp,log);
				}
				if (!newlogin.equals("")){
					if (ConnexionBDD.getInstance().bdd().modifierNewloginUtilisateur(newlogin, log)) {
						request.getSession().setAttribute("login",newlogin);
					}
				}
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		request.setAttribute("alert","show");
		getServletContext().getRequestDispatcher("/jsp/moncompte.jsp").forward(request, response);
	}

}
