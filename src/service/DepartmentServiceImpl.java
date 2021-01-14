package service;

import dao.DepartmentDao;
import dao.DepartmentDaoImpl;
import entity.Department;

import java.util.List;

public class DepartmentServiceImpl implements DepartmentService {
    @Override
    public List<Department> queryDepartment(int hospitalID, int page, String departmentName) {
        DepartmentDao dao = new DepartmentDaoImpl();
        if (departmentName!=null&&departmentName.trim()!=""){
            return dao.queryDepartment(hospitalID, page, departmentName);
        }else {
            return dao.queryDepartment(hospitalID, page);
        }
    }

    @Override
    public void insertDepartment(Department department) {
        DepartmentDao dao = new DepartmentDaoImpl();
        dao.insertDepartment(department);
    }
}
