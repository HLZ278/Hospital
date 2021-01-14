package service;

import entity.Department;

import java.util.List;

public interface DepartmentService {
    public List<Department> queryDepartment(int hospitalID, int page, String departmentName);

    void insertDepartment(Department department);
}
