package entity;

import java.sql.Time;
import java.sql.Date;

public class NumSrcView {
    private int departmentID;
    private int doctorID;
    private String doctorName;
    private String job;
    private int gender;
    private int age;
    private String expertise;
    private int cost;
    private int total;
    private int remain;
    private Date contractTime;
    private int signalSrcID;
    private Time workTime;
    private Time closeTime;
    private String position;
    private String departmentName;
    private String departmentType;

    @Override
    public String toString() {
        return "NumSrcView{" +
                "departmentID=" + departmentID +
                ", doctorID=" + doctorID +
                ", doctorName='" + doctorName + '\'' +
                ", job='" + job + '\'' +
                ", gender=" + gender +
                ", age=" + age +
                ", expertise='" + expertise + '\'' +
                ", cost=" + cost +
                ", total=" + total +
                ", remain=" + remain +
                ", contractTime=" + contractTime +
                ", signalSrcID=" + signalSrcID +
                ", workTime=" + workTime +
                ", closeTime=" + closeTime +
                ", position='" + position + '\'' +
                ", departmentName='" + departmentName + '\'' +
                ", departmentType='" + departmentType + '\'' +
                '}';
    }

    public int getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getExpertise() {
        return expertise;
    }

    public void setExpertise(String expertise) {
        this.expertise = expertise;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getRemain() {
        return remain;
    }

    public void setRemain(int remain) {
        this.remain = remain;
    }

    public Date getContractTime() {
        return contractTime;
    }

    public void setContractTime(Date contractTime) {
        this.contractTime = contractTime;
    }

    public int getSignalSrcID() {
        return signalSrcID;
    }

    public void setSignalSrcID(int signalSrcID) {
        this.signalSrcID = signalSrcID;
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

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getDepartmentType() {
        return departmentType;
    }

    public void setDepartmentType(String departmentType) {
        this.departmentType = departmentType;
    }
}
