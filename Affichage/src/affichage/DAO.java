package affichage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;

abstract class DAO<T> {
    protected static Connection conn;

    public static void Connexion() {
        try {
            conn = DriverManager.getConnection("jdbc:postgresql://192.168.1.245:5432/PPE2022_RestaurationMSP", "parent", "parent");
            System.out.println("Connection établie");
            System.out.println(conn.toString());

        } catch (Exception e) {
            System.out.println("ERREUR");
        }
    }
    
    //Create
    public abstract boolean create(T unObject);
    
    //Read
    public abstract T find(int idS);
    
    //Update
    public abstract boolean update(T unObject);
    
    //Delete
    public abstract boolean delete(T unObject);
}
