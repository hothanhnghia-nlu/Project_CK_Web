package vn.edu.hcmuaf.fit.service;
import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class LogService {

    public static LogService getInstances() {
        return new LogService();
    }

    // Add a new log
    public void addLog( String level, int userId, String src, String content) {
        JDBIConnector.get().withHandle(handle ->
            handle.createUpdate("INSERT INTO logs (level, user_id,src,content,create_at)  VALUES ( ?,?, ?, ?, NOW());")
                    .bind(0, level)
                    .bind(1, userId)
                    .bind(2, src)
                    .bind(3, content)
                    .execute()
        );
    }
    public List<Log> listAllCategory (){
        List<Log> pro = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM logs")
                    .mapToBean(Log.class)
                    .stream().collect(Collectors.toList());
        });
        return pro;
    }

    public static void main(String[] args) {
        System.out.println(LogService.getInstances().listAllCategory());
    }
}
