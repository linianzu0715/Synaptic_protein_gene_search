package com.suke.czx.test;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SqliteTest {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.sqlite.JDBC");
        String db = "D:\\homework\\X-SpringBoot-master\\src\\main\\resources\\static\\sqlite\\synaptic.proteome.db.sqlite";
        Connection conn = DriverManager.getConnection("jdbc:sqlite:" + db);
        Statement state = conn.createStatement();

        ResultSet rs = null;

        ResultSet rs1 = state.executeQuery("SELECT name FROM sqlite_master where type='table'"); //查询数据
        while (rs1.next()) {
            System.out.print("\"" +rs1.getString("name")+ "\""+"," );

            String[] sss = {"BrainRegion","sqlite_sequence","Localisation","Method","Paper","PaperGene","Species","GO","GOGene","Disease","DiseaseGene","SpecieRegion","GeneToModel","PPI","Gene"};

            for (String s : sss) {

                rs = state.executeQuery("select count(*) total from "+s+";"); //查询数据
                System.out.print(s+"    ");
                while (rs.next()) { //将查询到的数据打印出来
                    System.out.println("ID = " + rs.getString("total") + " "); //列属性一
//            System.out.println("Name = " + rs.getString("B")); //列属性二
                }
            }





        }



/*        ResultSet rs = state.executeQuery("select count(*) total from PPI;"); //查询数据
        while (rs.next()) { //将查询到的数据打印出来
            System.out.print("ID = " + rs.getString("total") + " "); //列属性一
//            System.out.println("Name = " + rs.getString("B")); //列属性二
        }*/
        rs.close();
        conn.close();

    }
}