package Database;

import java.sql.*;

public class OperazioniBD {
    public void Operazione1(Videogioco videogioco){

        try(Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce_videogiochi", "root", "694200")) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO Videogioco (" +
                            "nome," +
                            "Prezzo," +
                            "Studio," +
                            "Data_uscita," +
                            "PEGI" +
                            ") VALUES(?,?,?,?,?)");

            ps.setString(1, videogioco.getNome());
            ps.setDouble(2, videogioco.getPrezzo());
            ps.setString(3, videogioco.getStudio());
            ps.setDate(4, videogioco.getData_uscita());
            ps.setInt(5, videogioco.getPegi());

            if(ps.executeUpdate() != 1){
                System.out.println("Inserimento fallito");
            }

        } catch(SQLException e){
            System.out.println("Errore di connessione database.");
            throw new RuntimeException(e);
        }
    }
}
