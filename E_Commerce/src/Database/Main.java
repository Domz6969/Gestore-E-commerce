package Database;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        int scelta;
        var service = new OperazioniBD();
        service.connessioneDB();
        do{
            System.out.println("Benvenuto. Seleziona l'operazione da eseguire" +
                    "\n0) Chiudi programma"+
                    "\n1) Aggiungi nuovo videogioco." +
                    "\n2) Modifica il pegi di un videogioco" +
                    "\n3) Rimuovi un videogioco" +
                    "\n4) Visualizza i videogiochi di un determinato studio" +
                    "\n5) Visualizza il merchandise di un determinato tipo ");

            Scanner sc = new Scanner(System.in);
            scelta = sc.nextInt();
            switch(scelta){
                case 0:
                    System.out.println("Chiusura programma. Arrivederci");
                    sc.close();
                    service.chiudiConnessione();
                    break;
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

                    service.Operazione1(videogioco);

                    break;

                case 2:
                    System.out.println("Operazione selezionata: Modifica pegi di un videogioco");

                    System.out.println("Inserisci l'ID prodotto del videogioco il cui pegi deve essere modificato");
                    int ID= sc.nextInt();
                    System.out.println("Inserire il nuovo PEGI");
                    int pegi = sc.nextInt();
                    service.Operazione2(ID,pegi);

                    System.out.println("Operazione eseguita con successo");
                    break;

                case 3:
                    System.out.println("Operazione selezionata: Rimozione di un videogioco");

                    System.out.println("Inserisci ID del videogioco da rimuovere");
                    service.Operazione3(sc.nextInt());

                    System.out.println("Operazione eseguita con successo");
                    break;
                case 4:
                    System.out.println("Operazione selezionata: Visualizza i videogiochi di un determinato studio");
                    ArrayList<Videogioco> giochi= new ArrayList<Videogioco>();

                    System.out.println("Inserisci lo studio di cui desideri visualizzare i videogiochi");
                    sc.nextLine();
                    giochi=service.Operazione4(sc.nextLine());

                    if(giochi.isEmpty()){
                        System.out.println("Non sono presenti videogiochi dello studio selezionato");
                    }

                    else {
                        System.out.println("Operazione completata con successo, ecco la lista dei prodotti:");
                        for (Videogioco v : giochi) {
                            System.out.println(v);
                        }
                    }
                    break;

                case 5:
                    System.out.println("Operazione selezionata: Visualizza il merchandise di un determinato tipo");
                    ArrayList<Merchandise> merch = new ArrayList<Merchandise>();

                    System.out.println("Inserisci il tipo di merchandise che vuoi visualizzare");
                    sc.nextLine();
                    merch = service.Operazione5(sc.nextLine());

                    if(merch.isEmpty()){
                        System.out.println("Non è presente merchandise del tipo selezionato");
                    }

                    else {
                        System.out.println("Operazione completata con successo, ecco la lista dei prodotti");
                        for (Merchandise m : merch) {
                            System.out.println(m);
                        }
                    }
                    break;
                default:
                    System.out.println("Scelta non valida");
            }
        }while(scelta != 0);
    }
}