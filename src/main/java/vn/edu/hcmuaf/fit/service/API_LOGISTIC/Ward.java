package vn.edu.hcmuaf.fit.service.API_LOGISTIC;

public class Ward {
    private int wardCode;
    private int districtID;
    private String name;

    public Ward(int wardCode, int districtID, String name) {
        this.wardCode = wardCode;
        this.districtID = districtID;
        this.name = name;
    }

    public int getWardCode() {
        return wardCode;
    }

    public void setWardCode(int wardCode) {
        this.wardCode = wardCode;
    }

    public int getDistrictID() {
        return districtID;
    }

    public void setDistrictID(int districtID) {
        this.districtID = districtID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
