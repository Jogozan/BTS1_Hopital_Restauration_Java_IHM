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
public class Patient {

    private int id;
    private String nom;
    public int idService;
    private int numChambre;

    public Patient(int id, String nom, int idService, int numChambre) {
        this.id = id;
        this.nom = nom;
        this.idService = idService;
        this.numChambre = numChambre;
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

    public int getNumChambre() {
        return numChambre;
    }

    public void setNumChambre(int numChambre) {
        this.numChambre = numChambre;
    }

    public int getIdService() {
        return idService;
    }

    public void setIdService(int idService) {
        this.idService = idService;
    }

    @Override
    public String toString() {
        return "Le patient avec l'id " + id + " se nomme " + nom + " et se trouve dans le service " + idService + " chambre numéro " + numChambre ;
    }
    
    
       
}
