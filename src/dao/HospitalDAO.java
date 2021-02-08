package dao;
import entity.Hospital;
import entity.User;

import java.util.List;

public interface HospitalDAO {
	public List<Hospital> queryHospital(int page);
	public int insertHospital(Hospital hospital);
	public int countHospital();

    void deleteHospital(int hospitalID);
	public String queryHospitalName(int hospitalID);

	List<Hospital> queryHospitalByName(String hospitalName);
	public void updateHospitalMessage(Hospital hospital);
	void updateHospital(Hospital hospital);
	Hospital queryHospitalByID(int hospitalID);

	List<Hospital> queryHospitalByArea(String area);
	List<Hospital> queryHospitalByArea(String area, int page);

	List<Hospital> queryHospitalByLevel(String level);
	List<Hospital> queryHospitalByLevel(String level, int page);

	List<Hospital> queryHospitalByLevelAndArea(String level, String area);
	List<Hospital> queryHospitalByLevelAndArea(String level, String area, int page);

}
