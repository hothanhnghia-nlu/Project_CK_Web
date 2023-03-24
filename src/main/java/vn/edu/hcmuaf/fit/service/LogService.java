package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

public class LogService {

    public static LogService getInstances() {
        return new LogService();
    }

    // Add a new log
    public void addLog(String id, String level, int userId, String src, String content) {
        JDBIConnector.get().withHandle(handle ->
            handle.createUpdate("INSERT INTO log VALUES (?, ?, ?, ?, ?, NOW(), ?)")
                    .bind(0, id)
                    .bind(1, level)
                    .bind(2, userId)
                    .bind(3, src)
                    .bind(4, content)
                    .execute()
        );
    }

}
