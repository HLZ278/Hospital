package entity;

import java.sql.Date;

public class Patient {
    private int patientID;
    private int userID;
    private String patientName;
    private int idCardType;
    private String idCardNum;
    private int gender;
    private Date birthday;
    private String tel;
    private int mariStatus;
    private String address;
    private int objective;
    private String linkName;
    private int linkidCardType;
    private String linkidCardNum;
    private String linkTel;
    private int age;

    @Override
    public String toString() {
        return "Patient{" +
                "patientID=" + patientID +
                ", userID=" + userID +
                ", patientName='" + patientName + '\'' +
                ", idCardType=" + idCardType +
                ", idCardNum='" + idCardNum + '\'' +
                ", gender=" + gender +
                ", birthday=" + birthday +
                ", tel='" + tel + '\'' +
                ", mariStatus=" + mariStatus +
                ", address='" + address + '\'' +
                ", objective=" + objective +
                ", linkName='" + linkName + '\'' +
                ", linkidCardType=" + linkidCardType +
                ", linkidCardNum='" + linkidCardNum + '\'' +
                ", linkTel='" + linkTel + '\'' +
                ", age=" + age +
                '}';
    }

    public int getPatientID() {
        return patientID;
    }

    public void setPatientID(int patientID) {
        this.patientID = patientID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public int getIdCardType() {
        return idCardType;
    }

    public void setIdCardType(int idCardType) {
        this.idCardType = idCardType;
    }

    public String getIdCardNum() {
        return idCardNum;
    }

    public void setIdCardNum(String idCardNum) {
        this.idCardNum = idCardNum;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getMariStatus() {
        return mariStatus;
    }

    public void setMariStatus(int mariStatus) {
        this.mariStatus = mariStatus;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getObjective() {
        return objective;
    }

    public void setObjective(int objective) {
        this.objective = objective;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public int getLinkidCardType() {
        return linkidCardType;
    }

    public void setLinkidCardType(int linkidCardType) {
        this.linkidCardType = linkidCardType;
    }

    public String getLinkidCardNum() {
        return linkidCardNum;
    }

    public void setLinkidCardNum(String linkidCardNum) {
        this.linkidCardNum = linkidCardNum;
    }

    public String getLinkTel() {
        return linkTel;
    }

    public void setLinkTel(String linkTel) {
        this.linkTel = linkTel;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
