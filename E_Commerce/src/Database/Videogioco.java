package Database;

import java.sql.Date;

public class Videogioco {
    private String nome;
    private double prezzo;
    private String studio;
    private Date data_uscita;
    private int pegi;

    public Videogioco() {
       nome = "";
       prezzo = 0;
       studio = "";
       data_uscita = Date.valueOf("2000-01-01");
       pegi = 0;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    public String getStudio() {
        return studio;
    }

    public void setStudio(String studio) {
        this.studio = studio;
    }

    public Date getData_uscita() {
        return data_uscita;
    }

    public void setData_uscita(Date data_uscita) {
        this.data_uscita = data_uscita;
    }

    public int getPegi() {
        return pegi;
    }

    public void setPegi(int pegi) {
        this.pegi = pegi;
    }
}
