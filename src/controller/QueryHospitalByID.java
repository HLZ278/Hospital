package controller;

import com.alibaba.fastjson.JSON;
import entity.Department;
import entity.Doctor;
import entity.Hospital;
import service.DepartmentServiceImpl;
import service.DoctorServiceImpl;
import service.HospitalServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@WebServlet("/queryHospitalByID")

public class QueryHospitalByID extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        int hospitalID = Integer.parseInt(req.getParameter("hospitalID"));
        HospitalServiceImpl hospitalService = new HospitalServiceImpl();
        Hospital hospital = hospitalService.queryHospitalByID(hospitalID);
        DepartmentServiceImpl departmentService = new DepartmentServiceImpl();
        HashMap<String, List<Department>> departmentMap = departmentService.queryDepartmentByHospital(hospitalID);
        Set<String> departmentMapKey = departmentMap.keySet();
        req.getSession().setAttribute("departmentMapKey",departmentMapKey);
        req.getSession().setAttribute("departmentMap",departmentMap);
        req.getSession().setAttribute("hospital", hospital);
        req.getRequestDispatcher("hospitalDetail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
