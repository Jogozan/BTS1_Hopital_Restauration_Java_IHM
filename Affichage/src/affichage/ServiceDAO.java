package affichage;

import static affichage.DAO.conn;
import static affichage.Passerelle.Connexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ServiceDAO extends DAO<Service>{
    //Méthodes
    public static ArrayList<Service>  donnerTousLesServices(){
        if(conn==null){
            DAO.Connexion();
        }
        ArrayList<Service> desServices=new ArrayList<Service>();
        String requete="SELECT * FROM service";
        try{
            PreparedStatement prepare=conn.prepareStatement(requete);
            ResultSet rs = prepare.executeQuery();
            Service s;
            while(rs.next()){
                s=new Service(rs.getInt(1),rs.getString(2));
                desServices.add(s);
            }
        }
        catch(Exception exp){
            System.out.println(exp);
        }
        
        return desServices;
    }
    
    public static ArrayList<Service> donnerLesServices(){
        if(conn==null){
            DAO.Connexion();
        }
        ArrayList <Service>desServices=new ArrayList<Service>();
        desServices = null;
        String requete="SELECT * From Service Order By id";
        try{
            PreparedStatement prepare=conn.prepareStatement(requete);
            ResultSet rs=prepare.executeQuery();
            while(rs.next()){
                int id=rs.getInt(1);
                String libelle=rs.getString(2);
                desServices.add(new Service(id,libelle));
            }
        }
        catch(Exception exp){
            System.out.println(exp+"Erreur donner les commandes");
        }
        return desServices;

    }
    
    public static int getIdService(String pNom){
        if(conn==null){
            DAO.Connexion();
        }
        int idS = 0;
        String nom = pNom;
        String requete = "SELECT idService FROM personnel where nom=?";
        
        try{
            PreparedStatement p = conn.prepareStatement(requete);
            p.setString( 1, nom);
            ResultSet results = p.executeQuery();
            while(results.next()){
                idS = results.getInt(1);
            }
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
        return idS;
    }
    
    public static String getService(int pId){
        if(conn==null){
            DAO.Connexion();
        }
        String libelle = "";
        int id = pId;
        String requete = "SELECT libelle FROM service where id=?";
        
        try{
            PreparedStatement p = conn.prepareStatement(requete);
            p.setInt( 1, id);
            ResultSet results = p.executeQuery();
            while(results.next()){
                libelle = results.getString(1);
            }
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
        return libelle;
    }

    //Méthodes abstraites
    @Override
    public boolean create(Service unObject) {
        if(conn==null){
            DAO.Connexion();
        }
        int id = unObject.getId();
        String libelle = unObject.getLibelle();
        String requete = "INSERT INTO service(id,libelle) values(?,?)";
        boolean ajout = false;
        
        try{
            PreparedStatement prepare = conn.prepareStatement(requete);
            prepare.setInt(1, id);
            prepare.setString(2, libelle);
            prepare.executeUpdate();
            ajout = true;
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        return ajout;
    }

    @Override
    public Service find(int idS) {
        Service unService = null;
        if (conn == null) {
            Connexion();
        }
        try {
            Statement state = conn.createStatement();
            ResultSet jeuResultat = state.executeQuery("select * from service");
            while (jeuResultat.next()) {
                int id = jeuResultat.getInt(1);
                String libelle = jeuResultat.getString(2);
                if (id == idS) {
                    unService = new Service(id,libelle);
                }
            }
        } 
        catch (Exception e) {
            System.out.println(e);
            System.out.println("Erreur les patients!");
        }
        
        return unService;
    }

    @Override
    public boolean update(Service unObject) {
        if(conn==null){
            DAO.Connexion();
        }
        boolean result = false;
        int id = unObject.getId();
        String libelle = unObject.getLibelle();
        String requete = "Update service Set libelle=? Where id=?";
        try{
            PreparedStatement prepare = conn.prepareStatement(requete);
            prepare.setString(1, libelle);
            prepare.setInt(2, id);
            prepare.executeUpdate();
            result = true;
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        return result;
    }

    @Override
    public boolean delete(Service unObject) {
        if (conn == null) {
            Connexion();
        }
        boolean supp = false;
        int id = unObject.getId();
        String requete = "Delete From service Where id=?";
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
