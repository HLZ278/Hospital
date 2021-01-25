package entity;

import java.sql.Time;

public class Hospital {
    private int hospitalID;
    private String hospitalName;
    private String grade;
    private String area;
    private String address;
    private String icon;
    private Time releaseTime;
    private Time stopTime;
    private String rule;
    private String details;
    private String notice;

    public Hospital() {

    }

    @Override
    public String toString() {
        return "Hospital{" +
                "hospitalID=" + hospitalID +
                ", hospitalName='" + hospitalName + '\'' +
                ", grade='" + grade + '\'' +
                ", area='" + area + '\'' +
                ", address='" + address + '\'' +
                ", icon='" + icon + '\'' +
                ", releaseTime=" + releaseTime +
                ", stopTime=" + stopTime +
                ", rule='" + rule + '\'' +
                ", details='" + details + '\'' +
                ", notice='" + notice + '\'' +
                '}';
    }

    public int getHospitalID() {
        return hospitalID;
    }

    public void setHospitalID(int hospitalID) {
        this.hospitalID = hospitalID;
    }

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Time getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Time releaseTime) {
        this.releaseTime = releaseTime;
    }

    public Time getStopTime() {
        return stopTime;
    }

    public void setStopTime(Time stopTime) {
        this.stopTime = stopTime;
    }

    public String getRule() {
        return rule;
    }

    public void setRule(String rule) {
        this.rule = rule;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }
}
