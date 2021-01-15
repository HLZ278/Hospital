package dao;
import entity.Department;
import entity.Hospital;
import entity.User;

import java.util.List;

public interface DepartmentDao {
	public List<Department> queryDepartment(int hospitalID, int page);

	void insertDepartment(Department department);

	List<Department> queryDepartment(int hospitalID, int page, String departmentName);

    void deleteDepartment(int departmentID);

    void updateDepartment(Department department);

    Department queryDepartmentByID(int departmentID);
}
