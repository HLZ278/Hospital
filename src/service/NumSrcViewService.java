package service;

import entity.NumSrc;
import entity.NumSrcView;

import java.util.List;

public interface NumSrcViewService {
    List<NumSrcView> queryNumSrc(int departmentID);

}
