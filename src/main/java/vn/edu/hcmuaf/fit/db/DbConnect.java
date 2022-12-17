package vn.edu.hcmuaf.fit.db;

import java.sql.*;

public class DbConnect {

    private String url = "jdbc:mysql://localhost:3306/shop";
    private String user = "root";
    private String pass = "";
    Connection connection;
    static DbConnect install;
    public DbConnect() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(this.url, this.user, this.pass);
    }

    public static DbConnect getInstall() throws SQLException, ClassNotFoundException {
        if(install == null ) install = new DbConnect();
        return install;
    }

    public Statement get(){
        try{
            if (connection == null) return null;
            return   connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Statement statement = DbConnect.getInstall().get();
        if (statement != null) {
            ResultSet rs=  statement.executeQuery( "select * from product");
            while (rs.next()){
                System.out.println(rs.getInt(1));
                System.out.println(rs.getString(2));
            }
        }

    }
}
