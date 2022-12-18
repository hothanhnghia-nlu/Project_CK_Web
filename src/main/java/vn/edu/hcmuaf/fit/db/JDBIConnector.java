package vn.edu.hcmuaf.fit.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bean.Account;
import vn.edu.hcmuaf.fit.bean.Brand;
import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Product;

import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

public class JDBIConnector {
    private static Jdbi jdbi;

    private static void makeConnect() {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setURL("jdbc:mysql://" + DBProperties.getDbHost() + ":" + DBProperties.getDbPort() + "/" + DBProperties.getDbName());
        dataSource.setUser(DBProperties.getUsername());
        dataSource.setPassword(DBProperties.getPassword());
        try {
            dataSource.setUseCompression(true);
            dataSource.setAutoReconnect(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        jdbi = Jdbi.create(dataSource);
    }

    private JDBIConnector() {

    };

    public static Jdbi get() {
        if (jdbi == null) {
            makeConnect();
        }
        return jdbi;
    }

    public static void main(String[] args) {
//        List<User> users = JDBIConnector.get().withHandle(handle -> {
//            return handle.createQuery("select * from customer")
//                    .mapToBean(User.class).stream().collect(Collectors.toList());
//        });
//        System.out.println(users);
//        List<Account> acc = JDBIConnector.get().withHandle(handle -> {
//            return handle.createQuery("select * from account")
//                    .mapToBean(Account.class).stream().collect(Collectors.toList());
//        });
//        System.out.println(acc);
//        List<Product> acc = JDBIConnector.get().withHandle(handle -> {
//            return handle.createQuery("SELECT  * from product")
//                    .mapToBean(Product.class)
//                    .stream().collect(Collectors.toList());
//        });
//        System.out.println(acc);
        List<Product> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT  * FROM product\n" +
                            "    order by productID DESC\n" +
                            "    LIMIT 3;")
                    .mapToBean(Product.class)
                    .stream().collect(Collectors.toList());
        });
        System.out.println(pro);
    }
}
