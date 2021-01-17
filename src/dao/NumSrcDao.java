package dao;
import entity.Doctor;
import entity.NumSrc;

import java.util.List;

public interface NumSrcDao {
	public List<NumSrc> queryNumSrc(int doctorID);
	public void insertOrUpdateNumSrc(int doctorID);

}
