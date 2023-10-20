/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package affichage;

/**
 *
 * @author sio2021
 */
public class Personel {
    private int id;
    private String nom;
    private String mdp;
    private int idService;

    public Personel(int id, String nom, String mdp, int idService) {
        this.id = id;
        this.nom = nom;
        this.mdp = mdp;
        this.idService = idService;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public int getIdService() {
        return idService;
    }

    public void setIdService(int idService) {
        this.idService = idService;
    }

    @Override
    public String toString() {
        return "Personel{" + "id=" + id + ", nom=" + nom + ", mdp=" + mdp + ", idService=" + idService + '}';
    }
    
    
}
