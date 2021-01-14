package entity;

import java.sql.Time;

public class Department {
    private int departmentID;
    private int hospitalID;
    private String departmentType;
    private String departmentName;
    private String position;
    private Time workTime;
    private Time closeTime;
    public Department() {

    }

    @Override
    public String toString() {
        return "Department{" +
                "departmentID=" + departmentID +
                ", hospitalID=" + hospitalID +
                ", departmentType='" + departmentType + '\'' +
                ", departmentName='" + departmentName + '\'' +
                ", position='" + position + '\'' +
                ", workTime=" + workTime +
                ", closeTime=" + closeTime +
                '}';
    }

    public int getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    public int getHospitalID() {
        return hospitalID;
    }

    public void setHospitalID(int hospitalID) {
        this.hospitalID = hospitalID;
    }

    public String getDepartmentType() {
        return departmentType;
    }

    public void setDepartmentType(String departmentType) {
        this.departmentType = departmentType;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Time getWorkTime() {
        return workTime;
    }

    public void setWorkTime(Time workTime) {
        this.workTime = workTime;
    }

    public Time getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Time closeTime) {
        this.closeTime = closeTime;
    }
}
