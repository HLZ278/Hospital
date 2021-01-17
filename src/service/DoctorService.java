package service;

import entity.Department;
import entity.Doctor;

import java.util.List;

public interface DoctorService {
    public List<Doctor> queryDoctor(int departmentID, int page, String doctorName);

    void insertDoctor(Doctor doctor);

    void deleteDoctor(int doctorID);

    void updateDoctor(Doctor doctor);

    Doctor queryDoctor(int doctorID);
}
