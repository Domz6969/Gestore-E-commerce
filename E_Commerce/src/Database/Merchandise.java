package Database;

public class Merchandise {
    private int ID;
    private String nome;
    private double dimensione;
    private String tipo;
    private double prezzo;
    private double peso;

    public Merchandise(){
        nome = "";
        dimensione = 0;
        tipo = "";
        prezzo = 0;
        peso = 0;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getDimensione() {
        return dimensione;
    }

    public void setDimensione(double dimensione) {
        this.dimensione = dimensione;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    @Override
    public String toString(){
        return "Merchandise ID: " + getID() +
                "\n\tNome: " + getNome() +
                "\n\tDimensione: " + getDimensione() +
                "\n\tTipo: " + getTipo() +
                "\n\tPrezzo: " + getPrezzo() +
                "\n\tPeso: " + getPeso();
    }
}
