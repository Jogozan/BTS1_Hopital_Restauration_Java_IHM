package affichage;

import static affichage.DAO.conn;
import java.security.MessageDigest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class PersonnelDAO extends DAO<Personel>{
    //Méthodes
    public static boolean verifUtilisateur(String pNom, String pMdp){
        if(conn==null){
            DAO.Connexion();
        }
        String nom = pNom;
        String mdp = pMdp;
        String mdpHach = "";
        boolean verif = false;
        String requete = "SELECT mdp FROM personnel where nom=?";
        
        try{
            PreparedStatement p = conn.prepareStatement(requete);
            p.setString( 1, nom);
            ResultSet results = p.executeQuery();
            while(results.next()){
                mdpHach = results.getString(1);
            }
            
            //Hachage du mdp saisi
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(mdp.getBytes());
            byte byteData[] = md.digest();
            
            //convertir le tableau de bits en un format hexadécimal
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            mdp = sb.toString();
            
            //On compare les deux mdp
            if(mdpHach.equals(mdp)){
                verif = true;
            } 
        } 
        catch(Exception e){
           System.out.println(e.getMessage());
        }
        return verif;
    }
    
    //Méthodes abstraites
    @Override
    public boolean create(Personel unObject) {
        if(conn==null){
            DAO.Connexion();
        }
        int id = unObject.getId();
        String nom = unObject.getNom();
        int idService = unObject.getIdService();
        String mdp = unObject.getMdp();
        String requete = "INSERT INTO personnel(id,nom, mdp, idservice) values(?,?,?,?)";
        boolean ajout = false;
        
        try{
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
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
        return ajout;
    }

    @Override
    public Personel find(int idS) {
        if (conn == null) {
            Connexion();
        }
        Personel unPersonnel = null;
        try {
            Statement state = conn.createStatement();
            ResultSet jeuResultat = state.executeQuery("select * from personnel");
            while (jeuResultat.next()) {
                int id = jeuResultat.getInt(1);
                String nom = jeuResultat.getString(2);
                String mdp = jeuResultat.getString(3);
                int idService = jeuResultat.getInt(4);
                if (idService == idS) {
                    unPersonnel = new Personel(id,nom,mdp,idService);
                }
            }
        } 
        catch (Exception e) {
            System.out.println(e);
            System.out.println("Erreur les patients!");
        }
        
        return unPersonnel;
    }

    @Override
    public boolean update(Personel unObject) {
        if(conn==null){
            DAO.Connexion();
        }
        boolean result = false;
        int id = unObject.getId();
        String nom = unObject.getNom();
        int idService = unObject.getIdService();
        String mdp = unObject.getMdp();
        String requete = "Update personnel Set nom=?, mdp=?, idService=? Where id=?";
        try{
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
            prepare.setString(1, nom);
            prepare.setInt(2, idService);
            prepare.setString(3, mdpHach);
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
    public boolean delete(Personel unObject) {
        if (conn == null) {
            Connexion();
        }
        boolean supp = false;
        int id = unObject.getId();
        String requete = "Delete From personnel Where id=?";
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
    
}
