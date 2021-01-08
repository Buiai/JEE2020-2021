package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public final class ConnexionBDD {

	private static volatile ConnexionBDD instance;
	private Connection cnx;
	private BDD bdd;

	private ConnexionBDD() {
		try {

			cnx=DriverManager.getConnection("jdbc:mysql://localhost:3306/?zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=UTC","root","");
			init();
			cnx=DriverManager.getConnection( "jdbc:mysql://localhost:3306/projetdevweb?zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=UTC","root","");

			Statement stmt = cnx.createStatement();
			stmt.execute("CREATE TABLE IF NOT EXISTS utilisateur (\r\n"
				+ " login varchar(100) NOT NULL,\r\n"
				+ " mdp varchar(100) NOT NULL,\r\n"
				+ " nom varchar(100) NOT NULL,\r\n"
				+ " prenom varchar(100) NOT NULL,\r\n"
				+ " naissance date NOT NULL,\r\n"
				+ " infecte int(1) NOT NULL DEFAULT '0',\r\n"
				+ " PRIMARY KEY (login)\r\n"
				+ " ) ENGINE=InnoDB DEFAULT CHARSET=utf8");
			stmt.execute("CREATE TABLE IF NOT EXISTS lieu (\r\n"
				+ " nom varchar(100) NOT NULL,\r\n"
				+ " adresse varchar(100) NOT NULL,\r\n"
				+ " gps varchar(100) NOT NULL,\r\n"
				+ " PRIMARY KEY (nom,adresse)\r\n"
				+ " ) ENGINE=InnoDB DEFAULT CHARSET=utf8");
			stmt.execute("CREATE TABLE IF NOT EXISTS activite (\r\n"
				+ " idActivite int(100) NOT NULL AUTO_INCREMENT,\r\n"
				+ " nom varchar(100) NOT NULL,\r\n"
				+ " dateDebut datetime NOT NULL,\r\n"
				+ " dateFin datetime NOT NULL,\r\n"
				+ " nomLieu varchar(100) NOT NULL,\r\n"
				+ " adresseLieu varchar(100) NOT NULL,\r\n"
				+ " loginUtilisateur varchar(100) NOT NULL,\r\n"
				+ " PRIMARY KEY (idActivite),\r\n"
				+ " FOREIGN KEY (loginUtilisateur) REFERENCES utilisateur(login),\r\n"
				+ " FOREIGN KEY (nomLieu, adresseLieu) REFERENCES lieu(nom, adresse)"
				+ " ) ENGINE=InnoDB DEFAULT CHARSET=utf8");
			stmt.execute("CREATE TABLE IF NOT EXISTS notification (\r\n"
				+ " idNotification int(100) NOT NULL AUTO_INCREMENT,\r\n"
				+ " message varchar(200) NOT NULL,\r\n"
				+ " loginUtilisateur varchar(100) NOT NULL,\r\n"
				+ " PRIMARY KEY (idNotification),\r\n"
				+ " FOREIGN KEY (loginUtilisateur) REFERENCES utilisateur(login)\r\n"
				+ " ) ENGINE=InnoDB DEFAULT CHARSET=utf8");

			bdd = new BDD(cnx);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void init() throws SQLException {
		Statement stmt = cnx.createStatement();
		String sql = "CREATE DATABASE IF NOT EXISTS projetdevweb";
		stmt.execute(sql);


	}

	public static synchronized ConnexionBDD getInstance() {
		if(instance==null)
			instance = new ConnexionBDD();

		return instance;
	}

	public Connection getCnx() {
		return cnx;
	}



	public BDD bdd(){ return bdd; }

	public void closeCnx() throws SQLException{
		if(cnx!=null){
			cnx.close();
			instance=null;
		}
	}

}
