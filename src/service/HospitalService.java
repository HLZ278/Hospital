package service;


import entity.Hospital;
import entity.User;

import java.util.List;

//业务层接口
public interface HospitalService {
	public List<Hospital> queryHospital(String hospitalName, int page);
	public int insertHospital(Hospital hospital);
	public String queryHospitalName(int hospitalID);
    void deleteHospital(int hospitalID);
	Hospital queryHospitalByID(int hospitalID);

    void updateHospital(Hospital hospital);
}
