package entity;

import java.sql.Time;
import java.util.Date;

public class Hospital {
    private int hospitalID;
    private String name;
    private String grade;
    private String area;
    private String address;
    private String icon;
    private Time release;
    private Time stop;
    private String rule;
    private String details;
    private String notice;

    public Hospital() {
    }

    @Override
    public String toString() {
        return "Hospital{" +
                "hospitalID=" + hospitalID +
                ", name='" + name + '\'' +
                ", grade='" + grade + '\'' +
                ", area='" + area + '\'' +
                ", address='" + address + '\'' +
                ", icon='" + icon + '\'' +
                ", release=" + release +
                ", stop=" + stop +
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Time getRelease() {
        return release;
    }

    public void setRelease(Time release) {
        this.release = release;
    }

    public Time getStop() {
        return stop;
    }

    public void setStop(Time stop) {
        this.stop = stop;
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
