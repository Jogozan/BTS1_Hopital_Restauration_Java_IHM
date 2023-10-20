/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package affichage;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author pierr
 */
public class Historique {
    private int id;
    private int idPerso;
    private LocalDate date;
    private LocalTime heure;

    public Historique(int idPerso, LocalDate date, LocalTime heure) {
        this.idPerso = idPerso;
        this.date = date;
        this.heure = heure;
    }

    public int getIdPerso() {
        return idPerso;
    }

    public void setIdPerso(int idPerso) {
        this.idPerso = idPerso;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getHeure() {
        return heure;
    }

    public void setHeure(LocalTime heure) {
        this.heure = heure;
    }

    @Override
    public String toString() {
        return "Le personnel d'id : "+idPerso+" c'est connecté le "+date+" à "+heure;
    }
}
