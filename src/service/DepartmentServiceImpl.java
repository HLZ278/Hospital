package service;

import dao.DepartmentDao;
import dao.DepartmentDaoImpl;
import entity.Department;

import java.util.ArrayList;
import java.util.HashMap;
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

    @Override
    public void deleteDepartment(int departmentID) {
        DepartmentDao dao = new DepartmentDaoImpl();
        dao.deleteDepartment(departmentID);
    }

    @Override
    public void updateDepartment(Department department) {
        DepartmentDao dao = new DepartmentDaoImpl();
        dao.updateDepartment(department);
    }
    @Override
    public Department queryDepartmentByID(int departmentID) {
        DepartmentDao dao = new DepartmentDaoImpl();
        return dao.queryDepartmentByID(departmentID);
    }

    @Override
    public HashMap<String, List<Department>> queryDepartmentByHospital(int hospitalID) {
        HashMap<String, List<Department>> departmentMap = new HashMap<>();
        DepartmentDao dao = new DepartmentDaoImpl();
        List<Department> list = dao.queryAllDepartment(hospitalID);
        for (Department department:
             list) {
            if (departmentMap.get(department.getDepartmentType())==null){
                ArrayList<Department> departments = new ArrayList<>();
                departments.add(department);
                departmentMap.put(department.getDepartmentType(), departments);
            }else {
                List<Department> departments = departmentMap.get(department.getDepartmentType());
                departments.add(department);
                departmentMap.put(department.getDepartmentType(), departments);
            }
        }
        return departmentMap;
    }
}
