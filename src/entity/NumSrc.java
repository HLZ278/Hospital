package entity;

import java.sql.Date;

public class NumSrc {
    private int signalSrcID;
    private int doctorID;
    private Date contractTime;
    private int remain;
    private int total;

    public NumSrc() {
    }

    @Override
    public String toString() {
        return "NumSrc{" +
                "signalSrcID=" + signalSrcID +
                ", doctorID=" + doctorID +
                ", contractTime=" + contractTime +
                ", remain=" + remain +
                ", total=" + total +
                '}';
    }

    public int getSignalSrcID() {
        return signalSrcID;
    }

    public void setSignalSrcID(int signalSrcID) {
        this.signalSrcID = signalSrcID;
    }

    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
    }

    public Date getContractTime() {
        return contractTime;
    }

    public void setContractTime(Date contractTime) {
        this.contractTime = contractTime;
    }


    public int getRemain() {
        return remain;
    }

    public void setRemain(int remain) {
        this.remain = remain;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
