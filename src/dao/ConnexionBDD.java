package dao;

import java.io.IOException;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public final class ConnexionBDD {

	private static volatile ConnexionBDD instance;
	private Connection cnx; 
	
	private ConnexionBDD() {
		try {
			
			/*Properties p = new Properties();
			p.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("confBDD.properties"));
			
			// chargement du driver
			Class.forName(p.getProperty("driver"));
			cnx = DriverManager.getConnection(p.getProperty("url"),p.getProperty("user"), p.getProperty("pwd"));*/
			cnx=DriverManager.getConnection( "jdbc:mysql://localhost:3306/projetdevweb?zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=UTC","root","");			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} 
	
	public static synchronized ConnexionBDD getInstance() {
		if(instance==null)
			instance = new ConnexionBDD();
		
		return instance;
	}

	public Connection getCnx() {
		return cnx;
	}
	
	public boolean ajouterUtilisateur(String login, String mdp, String nom, String prenom, String naissance) throws SQLException {
		Statement stmt = cnx.createStatement();
		stmt.execute("INSERT INTO `utilisateur` (`login`, `mdp`, `nom`, `prenom`, `naissance`) VALUES ('"+login+"', '"+mdp+"', '"+nom+"', '"+prenom+"', '"+naissance+"') ");
		return connecterUtilisateur(login,mdp);
	}
	
	public boolean connecterUtilisateur(String login, String mdp) throws SQLException {
		Statement stmt = cnx.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM utilisateur WHERE login LIKE '"+login+"' AND mdp LIKE '"+mdp+"'");
		if(rs.next()) {
			return true;
		}
		else {
			return false;
		}
	}

	public void closeCnx() throws SQLException{
		if(cnx!=null){
			cnx.close();
			instance=null;
		}
	}
	
}
