package Database;

import java.sql.*;
import java.util.ArrayList;

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

    public void Operazione2(int id,int pegi){
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce_videogiochi","root","694200")){
            PreparedStatement ps = con.prepareStatement("UPDATE Videogioco SET PEGI =? WHERE ID_Prodotto=?");

            ps.setInt(1,pegi);
            ps.setInt(2,id);
            if(ps.executeUpdate()!=1){
                throw new RuntimeException("Errore durante l'aggiornamento del telefono: nessuna riga aggiornata.");
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public void Operazione3(int id){
        try(Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce_videogiochi","root","694200")){
            Statement statement = con.createStatement();
            statement.execute("SET FOREIGN_KEY_CHECKS = 0");
            PreparedStatement ps=con.prepareStatement("DELETE FROM Videogioco WHERE ID_Prodotto=?");
            ps.setInt(1,id);
            if(ps.executeUpdate()!=1){
                throw new RuntimeException("Errore eliminazione dal database.");
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Videogioco> Operazione4(String studio){
        ArrayList<Videogioco> listaGiochi = new ArrayList<>();
        ResultSet rs;
        try(Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce_videogiochi","root","694200")){
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Videogioco WHERE Studio = ?");
            ps.setString(1,studio);
            rs = ps.executeQuery();
            while(rs.next()){
                Videogioco vd = new Videogioco();

                vd.setID(rs.getInt(1));
                vd.setNome(rs.getString(2));
                vd.setPrezzo(rs.getDouble(3));
                vd.setStudio(rs.getString(4));
                vd.setData_uscita(rs.getDate(5));
                vd.setPegi(rs.getInt(6));

                listaGiochi.add(vd);
            }

            return listaGiochi;
            
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Merchandise> Operazione5(String tipo){
        ArrayList<Merchandise> listaMerce = new ArrayList<>();
        ResultSet rs;
        try(Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_commerce_videogiochi","root","694200")){
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Merchandise WHERE tipo = ?");
            ps.setString(1, tipo);
            rs = ps.executeQuery();
            while(rs.next()){
                Merchandise m = new Merchandise();

                m.setID(rs.getInt(1));
                m.setNome(rs.getString(2));
                m.setDimensione(rs.getDouble(3));
                m.setTipo(rs.getString(4));
                m.setPrezzo(rs.getDouble(5));
                m.setPeso(rs.getDouble(6));

                listaMerce.add(m);
            }

            return listaMerce;
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }
}
