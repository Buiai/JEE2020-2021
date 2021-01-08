package dao;

import beans.Activite;
import beans.Lieu;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BDD {

    private Connection cnx;

    public BDD(Connection c) {
        cnx = c;
    }

    public boolean utilisateurExiste(String mail, String mdp) throws SQLException {
        Statement stmt = cnx.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM utilisateur WHERE login LIKE '"+ mail +"' AND mdp LIKE '"+ mdp +"'");
        try {
            if(rs.next()) {
                return true;
            }
            else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public boolean ajouterUtilisateur(String login, String mdp, String nom, String prenom, String naissance) throws SQLException {
        if(login.equals("") || mdp.equals("") || nom.equals("") || prenom.equals("") || naissance.equals("")){
            return false;
        }
        Statement stmt = cnx.createStatement();
        stmt.execute("INSERT INTO `utilisateur` (`login`, `mdp`, `nom`, `prenom`, `naissance`) VALUES ('"+login+"', '"+mdp+"', '"+nom+"', '"+prenom+"', '"+naissance+"') ");
        return utilisateurExiste(login,mdp);
    }

    public ArrayList<Activite> getActivitesUtilisateur(String login)  {

        ArrayList<Activite> activites = new ArrayList<>();

        try {
            Statement stmt = cnx.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM activite WHERE loginUtilisateur LIKE '"+ login +"'");
            while(rs.next()) {
                Activite a = new Activite();
                a.setId(rs.getString("idActivite"));
                a.setNom(rs.getString("nom"));
                a.setDateDebut(rs.getString("dateDebut"));
                a.setDateFin(rs.getString("dateFin"));
                a.setNomLieu(rs.getString("nomLieu"));
                a.setAdresseLieu(rs.getString("adresseLieu"));
                a.setLoginUtilisateur(rs.getString("loginUtilisateur"));
                activites.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return activites;
    }




    public boolean ajouterActivite(String login, String nom, String dateDebut, String dateFin, String nomLieu, String adresseLieu) {

        if(login.equals("") || nom.equals("") || dateDebut.equals("") || dateFin.equals("") || nomLieu.equals("") || adresseLieu.equals("")){
            return false;
        }
        boolean r = false;

        try {
            Statement stmt = cnx.createStatement();
            r = stmt.execute("INSERT INTO `activite` (`nom`, `dateDebut`, `dateFin`, `nomLieu`, `adresseLieu`, `loginUtilisateur`) VALUES ('"+nom+"', '"+dateDebut+"', '"+dateFin+"', '"+nomLieu+"', '"+adresseLieu+"', '"+login+"') ");

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public boolean ajouterLieu(String nomLieu, String adresse) {

        if(nomLieu.equals("") || adresse.equals("")){
            return false;
        }
        boolean r = false;

        try {
            Statement stmt = cnx.createStatement();
            r = stmt.execute("INSERT INTO `lieu` (`nom`, `adresse`, `gps`) VALUES ('"+ nomLieu +"', '"+ adresse +"', '-') ");

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public ArrayList<Lieu> getLieux() {
        ArrayList<Lieu> lieux = new ArrayList<>();

        try {
            Statement stmt = cnx.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM lieu");
            while(rs.next()) {
                Lieu l = new Lieu();
                l.setAdresse(rs.getString("adresse"));
                l.setNom(rs.getString("nom"));
                lieux.add(l);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lieux;

    }

    public void infection(String login) throws SQLException {
        Statement stmt = cnx.createStatement();
        stmt.execute("UPDATE utilisateur SET infecte = 1 WHERE login LIKE '"+login+"'");
    }

    public void modifierNomUtilisateur(String nom, String log) throws SQLException {
        Statement stmt = cnx.createStatement();
        stmt.execute("UPDATE utilisateur SET nom = '"+nom+"' WHERE login LIKE '"+log+"'");
    }

    public void modifierPrenomUtilisateur(String prenom, String log) throws SQLException {
        Statement stmt = cnx.createStatement();
        stmt.execute("UPDATE utilisateur SET prenom = '"+prenom+"' WHERE login LIKE '"+log+"'");
    }

    public void modifierMdpUtilisateur(String mdp, String log) throws SQLException {
        Statement stmt = cnx.createStatement();
        stmt.execute("UPDATE utilisateur SET mdp = '"+mdp+"' WHERE login LIKE '"+log+"'");
    }

    public boolean modifierNewloginUtilisateur(String newlogin, String log) throws SQLException {
        Statement stmt = cnx.createStatement();
        stmt.execute("UPDATE utilisateur SET login = '"+newlogin+"' WHERE login LIKE '"+log+"'");
        stmt = cnx.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM utilisateur WHERE login LIKE '"+newlogin+"'");
        if(rs.next()){
            return true;
        }
        else {
            return false;
        }
    }
}




