package vn.edu.hcmuaf.fit.service.API_LOGISTIC;

public class District {
    private int id;
    private int provinceID;
    private String name;

    public District(int id, int provinceID, String name) {
        this.id = id;
        this.provinceID = provinceID;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProvinceID() {
        return provinceID;
    }

    public void setProvinceID(int provinceID) {
        this.provinceID = provinceID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
