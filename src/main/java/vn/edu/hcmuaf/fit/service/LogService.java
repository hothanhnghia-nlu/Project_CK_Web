package vn.edu.hcmuaf.fit.service;
import vn.edu.hcmuaf.fit.bean.Comment;
import vn.edu.hcmuaf.fit.bean.Log;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class LogService {

    public static LogService getInstances() {
        return new LogService();
    }

    // Add a new log
    public void addLog(int id, String level, int userId, String src, String content) {
        JDBIConnector.get().withHandle(handle ->
            handle.createUpdate("INSERT INTO logs (logID, level, user_id, src, content, create_at)  VALUES (?, ?, ?, ?, ?, NOW());")
                    .bind(0, id)
                    .bind(1, level)
                    .bind(2, userId)
                    .bind(3, src)
                    .bind(4, content)
                    .execute()
        );
    }

    // Get a new id
    public int getNewID() {
        List<Log> logs = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM logs order by logID DESC Limit 1")
                        .mapToBean(Log.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        for (int i = 0; i < logs.size(); i++) {
            return logs.get(i).getLogID();
        }
        return 0;
    }

    // Get all category
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
