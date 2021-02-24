package service;

import entity.NumSrc;

import java.util.List;

public interface NumSrcService {
    List<NumSrc> queryNumSrc(int doctorID);
    public void insertOrUpdateNumSrc(List<NumSrc> numSrcList);
    public void cancleOrder(int numSrcID);

    int subtract(int numSrcID);

    boolean checkTime(int signalSrcID);
}
