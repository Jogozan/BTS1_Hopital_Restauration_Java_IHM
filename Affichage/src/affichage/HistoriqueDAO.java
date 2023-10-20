/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package affichage;

import static affichage.DAO.conn;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * @author pierr
 */
public class HistoriqueDAO extends DAO<Historique>{
    @Override
    public boolean create(Historique unObject) {
        if(conn==null){
            DAO.Connexion();
        }
        int idPerso = unObject.getIdPerso();
        LocalDate date = unObject.getDate();
        DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("dd LLLL yyyy");
        String dateString = date.format(formatDate);
        LocalTime heure = unObject.getHeure();
        DateTimeFormatter formatHeure = DateTimeFormatter.ofPattern("HH.mm");
        String heureString = heure.format(formatHeure);
        String requete = "INSERT INTO historique(idPersonnel, date, heure) values(?,?,?)";
        boolean ajout = false;
        
        try{
            PreparedStatement prepare = conn.prepareStatement(requete);
            prepare.setInt(1, idPerso);
            prepare.setString(2, dateString);
            prepare.setString(3, heureString);
            prepare.executeUpdate();
            ajout = true;
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        return ajout;
    }

    @Override
    public Historique find(int idS) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Historique unObject) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Historique unObject) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public static ArrayList<Historique> donnerLHistorique(){
        ArrayList<Historique> lesCo = new ArrayList<>();
        if (conn == null) {
            Connexion();
        }
        try {
            Statement state = conn.createStatement();
            ResultSet jeuResultat = state.executeQuery("select idpersonnel,date,heure from historique");
            while (jeuResultat.next()) {
                int idPersonnel = jeuResultat.getInt(1);
                String heureString = jeuResultat.getString(3);
                DateTimeFormatter formatHeure = DateTimeFormatter.ofPattern("H.mm");
                LocalTime heure = LocalTime.parse(heureString, formatHeure);
                String dateString = jeuResultat.getString(2);
                DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("d MM yyyy");
                LocalDate date = LocalDate.parse(dateString, formatDate);
                lesCo.add(new Historique(idPersonnel, date, heure));

            }
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("Erreur les connexions!");
        }
        return lesCo;
    }
    
}
