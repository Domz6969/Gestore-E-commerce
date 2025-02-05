package Database;

import java.sql.Date;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        System.out.println("Benvenuto. Seleziona l'operazione da eseguire" +
                "\n1) Aggiungi nuovo videogioco." +
                "\n2) Modifica il pegi di un videogioco" +
                "\n3) Rimuovi un videogioco" +
                "\n4) Visualizza i videogiochi di un determinato studio");

        Scanner sc = new Scanner(System.in);
        var service = new OperazioniBD();

        switch(sc.nextInt()){
            case 1:
                System.out.println("Operazione selezionata: Aggiungi un videogioco");
                Videogioco videogioco = new Videogioco();
                System.out.println("Inserisci i dati del videogioco");
                System.out.println("Nome:");
                sc.nextLine();
                videogioco.setNome(sc.nextLine());
                System.out.println("Prezzo:");
                videogioco.setPrezzo(sc.nextDouble());
                System.out.println("Studio:");
                sc.nextLine();
                videogioco.setStudio(sc.nextLine());
                System.out.println("Data di uscita (YYYY-MM-DD)");
                videogioco.setData_uscita(Date.valueOf(sc.nextLine()));
                System.out.println("PEGI:");
                videogioco.setPegi(sc.nextInt());
                sc.close();

                service.Operazione1(videogioco);

                break;

            default:
                System.out.println("Scelta non valida");
        }
    }
}