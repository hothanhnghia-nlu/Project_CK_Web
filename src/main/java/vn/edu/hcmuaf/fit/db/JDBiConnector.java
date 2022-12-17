package vn.edu.hcmuaf.fit.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;

public class JDBiConnector {

    static Jdbi jdbi;

    public static Jdbi me() throws SQLException {
        if(jdbi==null) makeConnect();
        return jdbi;
    }

    private static void makeConnect() throws SQLException {
        MysqlDataSource source = new MysqlDataSource();
        source.setURL("jdbc:mysql://"+DBProperties.host()+":"+DBProperties.port()+"/"+DBProperties.name());
        source.setUser(DBProperties.user());
        source.setPassword(DBProperties.pass());
        source.setAutoReconnect(true);
        source.setUseCompression(true);
        jdbi = jdbi.create(source);

    }

    public static void main(String[] args) throws SQLException {
        Jdbi me = JDBiConnector.me();
        me.withHandle(handle -> {
            return handle.createQuery("select * from product").mapToBean(Product.class)
        })
    }
}