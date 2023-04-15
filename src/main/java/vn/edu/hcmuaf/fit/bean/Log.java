package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

public class Log implements Serializable {
    private int logID;
    private int level;
    private int userID;
    private String src;
    private String content;
    private Date creatAt;
    private int status;

    public Map<Integer, String> levelMapping = new HashMap<>();
    {
        levelMapping.put(0, "INFO");
        levelMapping.put(1, "ALERT");
        levelMapping.put(2, "WARNING");
        levelMapping.put(3, "DANGER");
    }

    public Log() {
    }

    public Log(int logID, int level, int userID, String src, String content, Date creatAt, int status) {
        this.logID = logID;
        this.level = level;
        this.userID = userID;
        this.src = src;
        this.content = content;
        this.creatAt = creatAt;
        this.status = status;
    }

    public int getLogID() {
        return logID;
    }

    public void setLogID(int logID) {
        this.logID = logID;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatAt() {
        return creatAt;
    }

    public void setCreatAt(Date creatAt) {
        this.creatAt = creatAt;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getLevelWithName() {
        return levelMapping.get(levelMapping.containsKey(this.level) ? this.level : 0);
    }
}
