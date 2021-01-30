package entity;

import java.sql.Timestamp;

public class Order {
    private int orderId;
    private int signalSrcID;
    private int patientID;
    private int orderStatus;
    private Timestamp contractTime;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getSignalSrcID() {
        return signalSrcID;
    }

    public void setSignalSrcID(int signalSrcID) {
        this.signalSrcID = signalSrcID;
    }

    public int getPatientID() {
        return patientID;
    }

    public void setPatientID(int patientID) {
        this.patientID = patientID;
    }

    public int getStatus() {
        return orderStatus;
    }

    public void setStatus(int status) {
        this.orderStatus = status;
    }

    public Timestamp getContractTime() {
        return contractTime;
    }

    public void setContractTime(Timestamp contractTime) {
        this.contractTime = contractTime;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", signalSrcID=" + signalSrcID +
                ", patientID=" + patientID +
                ", status=" + orderStatus +
                ", contractTime=" + contractTime +
                '}';
    }
}
