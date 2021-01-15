package controller;

import com.alibaba.fastjson.JSON;
import entity.Department;
import entity.Doctor;
import entity.User;
import service.DepartmentService;
import service.DepartmentServiceImpl;
import service.DoctorServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//用于医院管理界面中的科室管理
@WebServlet("/queryDoctor")
public class QueryDoctor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        int departmentID = Integer.parseInt(req.getParameter("departmentID"));
        System.out.println(departmentID);
        String doctorName = req.getParameter("doctorName");
        int page = Integer.parseInt(req.getParameter("page"));
        DoctorServiceImpl doctorService = new DoctorServiceImpl();
        List<Doctor> doctors = doctorService.queryDoctor(departmentID, page, doctorName);
        DepartmentServiceImpl departmentService = new DepartmentServiceImpl();
        Department department = departmentService.queryDepartmentByID(departmentID);
        System.out.println(department);
        Object o = JSON.toJSON(doctors);
        req.setAttribute("list", o);
        req.setAttribute("department", department);
        req.getRequestDispatcher("hospitalManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
