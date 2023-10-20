/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package affichage;

import static affichage.Passerelle.Connexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author sio2021
 */
public class PatientDAO extends DAO<Patient>{
    
    public static ArrayList<Patient> donnerTousLesPatientsParS() {

        ArrayList<Patient> lesPatients = new ArrayList<>();
        if (conn == null) {
            Connexion();
        }
        try {
            Statement state = conn.createStatement();
            ResultSet jeuResultat = state.executeQuery("select * from patient order by idservice");
            while (jeuResultat.next()) {
                int id = jeuResultat.getInt(1);
                String nom = jeuResultat.getString(2);
                int idService = jeuResultat.getInt(3);
                int numChambre = jeuResultat.getInt(4);
                lesPatients.add(new Patient(id, nom, idService, numChambre));

            }
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("Erreur les patients!");
        }
        return lesPatients;
    }
    
    public static ArrayList<Patient> donnerTousLesPatientsParS(int idS){
        if (conn == null) {
            Connexion();
        }
        ArrayList<Patient> lesPatients = new ArrayList<>();
        try {
            Statement state = conn.createStatement();
            ResultSet jeuResultat = state.executeQuery("select * from patient");
            while (jeuResultat.next()) {
                int id = jeuResultat.getInt(1);
                String nom = jeuResultat.getString(2);
                int idService = jeuResultat.getInt(3);
                int numChambre = jeuResultat.getInt(4);
                if (idService == idS) {
                    lesPatients.add(new Patient(id, nom, idService, numChambre));
                }

            }
        }
        catch (Exception e) {
            System.out.println(e);
            System.out.println("Erreur les patients!");
        }
        
        return lesPatients;
    }
    
    //Méthodes abstraites
    @Override
    public boolean create(Patient unObject) {
        if(conn==null){
            DAO.Connexion();
        }
        int id = unObject.getId();
        String nom = unObject.getNom();
        int idService = unObject.getIdService();
        int numChambre = unObject.getNumChambre();
        String requete = "INSERT INTO patient(id,nom, idService, numChambre) values(?,?,?,?)";
        boolean ajout = false;
        
        try{
            PreparedStatement prepare = conn.prepareStatement(requete);
            prepare.setInt(1, id);
            prepare.setString(2, nom);
            prepare.setInt(3, idService);
            prepare.setInt(4, numChambre);
            prepare.executeUpdate();
            ajout = true;
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        return ajout;
    }

    @Override
    public boolean update(Patient unObject) {
        if(conn==null){
            DAO.Connexion();
        }
        boolean result = false;
        int id = unObject.getId();
        String nom = unObject.getNom();
        int idService = unObject.getIdService();
        int numChambre = unObject.getNumChambre();
        String requete = "Update patient Set nom=?, idservice=?, numchambre=? Where id=?";
        try{
            PreparedStatement prepare = conn.prepareStatement(requete);
            prepare.setString(1, nom);
            prepare.setInt(2, idService);
            prepare.setInt(3, numChambre);
            prepare.setInt(4, id);
            prepare.executeUpdate();
            result = true;
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        return result;
    }

    @Override
    public boolean delete(Patient unObject) {
        if (conn == null) {
            Connexion();
        }
        boolean supp = false;
        int id = unObject.getId();
        String requete = "Delete From patient Where id=?";
        try{
            PreparedStatement prepare = conn.prepareStatement(requete);
            prepare.setInt(1, id);
            prepare.executeUpdate();
            supp = true;
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        return supp;
    }

    @Override
    public Patient find(int idS) {
        Patient unPatient = null;
        if (conn == null) {
            Connexion();
        }
        try {
            Statement state = conn.createStatement();
            ResultSet jeuResultat = state.executeQuery("select * from patient");
            while (jeuResultat.next()) {
                int id = jeuResultat.getInt(1);
                String nom = jeuResultat.getString(2);
                int idService = jeuResultat.getInt(3);
                int numChambre = jeuResultat.getInt(4);
                if (idService == idS) {
                    unPatient = new Patient(id,nom,idService,numChambre);
                }
            }
        } 
        catch (Exception e) {
            System.out.println(e);
            System.out.println("Erreur les patients!");
        }
        
        return unPatient;
    }
}
