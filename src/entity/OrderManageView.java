package entity;

import java.sql.Time;
import java.sql.Date;

public class OrderManageView {
    private String patientName;
    private int userID;
    private int orderStatus;
    private Date contractTime;
    private String doctorName;
    private String departmentName;
    private Time workTime;
    private Time closeTime;
    private String hospitalName;
    private int orderID;
    private int signalSrcID;
    private int hospitalID;

    public int getHospitalID() {
        return hospitalID;
    }

    public void setHospitalID(int hospitalID) {
        this.hospitalID = hospitalID;
    }

    @Override
    public String toString() {
        return "OrderManageView{" +
                "patientName='" + patientName + '\'' +
                ", userID=" + userID +
                ", orderStatus=" + orderStatus +
                ", contractTime=" + contractTime +
                ", doctorName='" + doctorName + '\'' +
                ", departmentName='" + departmentName + '\'' +
                ", workTime=" + workTime +
                ", closeTime=" + closeTime +
                ", hospitalName='" + hospitalName + '\'' +
                ", orderID=" + orderID +
                ", signalSrcID=" + signalSrcID +
                ", hospitalID=" + hospitalID +
                '}';
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getSignalSrcID() {
        return signalSrcID;
    }

    public void setSignalSrcID(int signalSrcID) {
        this.signalSrcID = signalSrcID;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Date getContractTime() {
        return contractTime;
    }

    public void setContractTime(Date contractTime) {
        this.contractTime = contractTime;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
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

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }
}
