package beans;

import java.io.Serializable;

public class Utilisateur implements Serializable {

    private String mail;
    private String nom;
    private String prenom;
    private String mdp;
    private String infecte;
    private String naissance;


    public String getMain() {
        return mail;
    }

    public void setMail(String login) {
        this.mail = login;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public String getInfecte() {
        return infecte;
    }

    public void setInfecte(String infecte) {
        this.infecte = infecte;
    }

    public String getNaissance() {
        return naissance;
    }

    public void setNaissance(String naissance) {
        this.naissance = naissance;
    }
}
