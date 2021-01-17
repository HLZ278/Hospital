package dao;
import entity.Doctor;

import java.util.List;

public interface DoctorDao {
	public List<Doctor> queryDoctor(int departmentID, int page, String doctorName);
	public List<Doctor> queryDoctor(int departmentID, int page);

    void insertDoctor(Doctor doctor);

	void deleteDoctor(int doctorID);

	void updateDoctor(Doctor doctor);

	Doctor queryDoctor(int doctorID);
}
