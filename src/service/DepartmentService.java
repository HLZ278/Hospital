package service;

import entity.Department;

import java.util.HashMap;
import java.util.List;

public interface DepartmentService {
    public List<Department> queryDepartment(int hospitalID, int page, String departmentName);
    void insertDepartment(Department department);
    void deleteDepartment(int departmentID);
    void updateDepartment(Department department);
    Department queryDepartmentByID(int departmentID);

    HashMap<String, List<Department>> queryDepartmentByHospital(int hospitalID);
}
