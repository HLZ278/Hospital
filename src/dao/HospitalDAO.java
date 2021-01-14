package dao;
import entity.Hospital;
import entity.User;

import java.util.List;

public interface HospitalDAO {
	public List<Hospital> queryHospital(int page);
	public int insertHospital(Hospital hospital);

    void deleteHospital(int hospitalID);
	public String queryHospitalName(int hospitalID);

	List<Hospital> queryHospitalByName(String hospitalName);

	void updateHospital(Hospital hospital);
}
