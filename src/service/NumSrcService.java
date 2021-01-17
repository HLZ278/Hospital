package service;

import entity.NumSrc;

import java.util.List;

public interface NumSrcService {
    List<NumSrc> queryNumSrc(int doctorID);
}
