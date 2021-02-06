package service;

import dao.DepartmentDao;
import dao.DepartmentDaoImpl;
import dao.DoctorDao;
import dao.DoctorDaoImpl;
import entity.Department;
import entity.Doctor;

import java.util.List;

public class DoctorServiceImpl implements DoctorService {

    @Override
    public List<Doctor> queryDoctor(int departmentID, int page, String doctorName) {
        DoctorDao dao = new DoctorDaoImpl();
        if (doctorName!=null&&doctorName.trim()!=""){
            return dao.queryDoctor(departmentID,  page,  doctorName);
        }else {
            return dao.queryDoctor(departmentID, page);
        }
    }

    @Override
    public void insertDoctor(Doctor doctor) {
        DoctorDao dao = new DoctorDaoImpl();
        dao.insertDoctor(doctor);
    }

    @Override
    public void deleteDoctor(int doctorID) {
        DoctorDao dao = new DoctorDaoImpl();
        dao.deleteDoctor(doctorID);
    }

    @Override
    public void updateDoctor(Doctor doctor) {
        DoctorDao dao = new DoctorDaoImpl();
        dao.updateDoctor(doctor);
    }

    @Override
    public Doctor queryDoctor(int doctorID) {
        DoctorDao dao = new DoctorDaoImpl();
        return dao.queryDoctor(doctorID);
    }

    @Override
    public int countDoctor(int department) {
        DoctorDao dao = new DoctorDaoImpl();
        return dao.countDoctor(department);
    }
}
