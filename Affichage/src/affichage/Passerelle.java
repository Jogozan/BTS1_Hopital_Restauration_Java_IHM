/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package affichage;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sio2021
 */
public class Passerelle {

    private static String url = "jdbc:postgresql://192.168.1.245:5432/PPE2022_RestaurationMSP";
    private static String user = "parent";
    private static String mdp = "parent";

    private static Connection conn;

    public static void Connexion() {
        try {
            conn = DriverManager.getConnection(url, user, mdp);
            System.out.println("Connection établie");
            System.out.println(conn.toString());

        } catch (Exception e) {
            System.out.println("ERREUR");
        }
    }

    public static ArrayList<TypeRepas> donnerToutLesTypesRepas() {

        ArrayList<TypeRepas> lesTypes = new ArrayList<>();

        if (conn == null) {
            Connexion();
        }

        try {
            Statement state = conn.createStatement();
            ResultSet jeuResultat = state.executeQuery("select * from typerepas");
            while (jeuResultat.next()) {
                int id = jeuResultat.getInt(1);
                String nom = jeuResultat.getString(2);

                lesTypes.add(new TypeRepas(id, nom));

            }
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("Erreur les types!");
        }
        return lesTypes;
    }

    public static boolean addCommande(Patient P, int iT, int iS) {
        Connexion();
        boolean ok = false;
        int idP = P.getId();
        int idT = iT;
        int idS = iS;
        String requete = "Insert Into commande (idpatient,idrepas,idservice) values(?,?,?)";
        try {
            PreparedStatement prepare = conn.prepareStatement(requete);
            prepare.setInt(1, idP);
            prepare.setInt(2, idT);
            prepare.setInt(3, idS);
            prepare.executeUpdate();
            ok = true;
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("Erreur les commandes!");
        }

        return ok;
    }

    public static boolean addCommande(int idP, int iT, int iS) {
        Connexion();
        boolean ok = false;
        int idT = iT;
        int idS = iS;
        String requete = "Insert Into commande (idpatient,idrepas,idservice) values(?,?,?)";
        try {
            PreparedStatement prepare = conn.prepareStatement(requete);
            prepare.setInt(1, idP);
            prepare.setInt(2, idT);
            prepare.setInt(3, idS);
            prepare.executeUpdate();
            ok = true;
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("Erreur les commandes!");
        }

        return ok;
    }

    public static boolean authentification(String pNom, String pMdp) {
        if (conn == null) {
            Connexion();
        }

        boolean auth = false;
        String nom = pNom;
        String mdp = pMdp;
        String requete = "SELECT INTO personnel (nom,libelle) values (?,?)";

        try {
            PreparedStatement prepare = conn.prepareStatement(requete);
            prepare.setString(1, nom);
            prepare.setString(2, mdp);
            auth = true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return auth;
    }

    public static boolean creationPersonnel(int pId, String pNom, String pMdp, int pService) {
        if (conn == null) {
            Connexion();
        }
        int id = pId;
        String nom = pNom;
        String mdp = pMdp;
        int idService = pService;
        String requete = "INSERT INTO Personnel(id,nom, mdp, idService) values(?,?,?,?)";
        boolean ajout = false;

        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(mdp.getBytes());
            byte byteData[] = md.digest();

            //convertir le tableau de bits en un format hexadécimal
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            String mdpHach = sb.toString();

            PreparedStatement prepare = conn.prepareStatement(requete);
            prepare.setInt(1, id);
            prepare.setString(2, nom);
            prepare.setString(3, mdpHach);
            prepare.setInt(4, idService);
            prepare.executeUpdate();
            ajout = true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return ajout;
    }

    public static ArrayList<String> donnerLesCommandes(int idservice) {
        Connexion();
        ArrayList<String> desCommandes = new ArrayList<String>();
        String requete = "SELECT numero,patient.nom,typerepas.libelle \n"
                + "FROM commande \n"
                + "JOIN patient ON commande.idpatient=patient.id \n"
                + "JOIN typerepas ON commande.idrepas=typerepas.id \n"
                + "JOIN service ON commande.idservice=service.id \n"
                + "WHERE service.id=?";
        try {

            PreparedStatement prepare = conn.prepareStatement(requete);
            prepare.setInt(1, idservice);
            ResultSet rs = prepare.executeQuery();
            while (rs.next()) {
                int num = rs.getInt(1);
                String numero = String.valueOf(num);
                desCommandes.add(numero + "|" + rs.getString(2) + "|" + rs.getString(3));

            }

        } catch (Exception exp) {
            System.out.println(exp + "Erreur donner les commandes");
        }
        return desCommandes;

    }

    public static ArrayList<String> donnertoutesLesCommandes() {
        Connexion();
        ArrayList<String> desCommandes = new ArrayList<String>();
        String requete = "SELECT service.libelle,numero,patient.nom,typerepas.libelle \n"
                + "FROM commande \n"
                + "JOIN patient ON commande.idpatient=patient.id \n"
                + "JOIN typerepas ON commande.idrepas=typerepas.id \n"
                + "JOIN service ON commande.idservice=service.id ORDER BY commande.idservice\n";
        try {

            PreparedStatement prepare = conn.prepareStatement(requete);

            ResultSet rs = prepare.executeQuery();
            while (rs.next()) {
                int num = rs.getInt(2);
                String numero = String.valueOf(num);
                desCommandes.add("Service:" + rs.getString(1) + "|Chambre:" + numero + "|" + rs.getString(3) + "|" + rs.getString(4));

            }

        } catch (Exception exp) {
            System.out.println(exp + "Erreur donner toute les commandes");
        }
        return desCommandes;

    }

    public static ArrayList<String> totalparservice(int idservice) {
        Connexion();
        ArrayList<String> totalparservice = new ArrayList();
        String requete = "SELECT  typerepas.libelle,count(*) FROM commande \n"
                + "JOIN typerepas ON commande.idrepas=typerepas.id WHERE idservice=?\n"
                + " GROUP BY typerepas.libelle  ";
        try {
            PreparedStatement prepare = conn.prepareStatement(requete);
            prepare.setInt(1, idservice);
            ResultSet rs = prepare.executeQuery();
            while (rs.next()) {
                int c = rs.getInt(2);
                String count = String.valueOf(c);
                totalparservice.add(rs.getString(1) + " = " + count);

            }

        } catch (Exception exp) {
            System.out.println(exp + "Erreur donner le nombre de regime par service");
        }
        return totalparservice;
    }

    public static ArrayList<String> totalregime() {
        Connexion();
        ArrayList<String> totalregime = new ArrayList();
        String requete = "SELECT  typerepas.libelle,count(*) FROM commande \n"
                + "JOIN typerepas ON commande.idrepas=typerepas.id \n"
                + " GROUP BY typerepas.libelle  ";
        try {
            PreparedStatement prepare = conn.prepareStatement(requete);

            ResultSet rs = prepare.executeQuery();
            while (rs.next()) {
                int c = rs.getInt(2);
                String count = String.valueOf(c);
                totalregime.add(rs.getString(1) + " = " + count);

            }

        } catch (Exception exp) {
            System.out.println(exp + "Erreur donner le nombre de regime par service");
        }
        return totalregime;
    }

    public static int total() {
        Connexion();
        int total = 0;
        String requete = "SELECT count(*) FROM commande";
        try {
            PreparedStatement prepare = conn.prepareStatement(requete);
            ResultSet rs = prepare.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }

        } catch (Exception exp) {
            System.out.println(exp + "Erreur donner le nombre de commande par service");
        }
        return total;
    }

    public static boolean creationPatient(int pId, String pNom, int pIdService, int pNumChambre) {
        if (conn == null) {
            Connexion();
        }
        int id = pId;
        String nom = pNom;
        int idService = pIdService;
        int numChambre = pNumChambre;
        String requete = "INSERT INTO Patient(id,nom, idService, numChambre) values(?,?,?,?)";
        boolean ajout = false;

        try {
            PreparedStatement prepare = conn.prepareStatement(requete);
            prepare.setInt(1, id);
            prepare.setString(2, nom);
            prepare.setInt(3, idService);
            prepare.setInt(4, numChambre);
            prepare.executeUpdate();
            ajout = true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return ajout;
    }

    public static boolean DeleteCommande() {
        if (conn == null) {
            Connexion();
        }
        boolean ok = false;
        try {
            Statement state = conn.createStatement();
            ResultSet jeuResultat = state.executeQuery("delete from commande");
            ok = true;
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("Erreur les commandes!");
        }
        return ok;
    }
}
