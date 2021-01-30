package dao;
import entity.Doctor;
import entity.NumSrc;

import java.util.List;

public interface NumSrcDao {
	public List<NumSrc> queryNumSrc(int doctorID);
	public void insertOrUpdateNumSrc(List<NumSrc> numSrcList);
	public int subtract(int numSrcID);

	void cancleOrder(int numSrcID);
}
