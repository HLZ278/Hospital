package controller;

import entity.Department;
import entity.Hospital;
import entity.User;
import service.DepartmentService;
import service.DepartmentServiceImpl;
import service.HospitalService;
import service.HospitalServiceImpl;
import utils.StringToTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//controller层
@WebServlet("/departmentInsert")
public class DepartmentInsert extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        Department department = new Department();
        User u = (User)req.getSession().getAttribute("user");
        department.setHospitalID(u.getHospitalID());
        department.setDepartmentName(req.getParameter("departmentName"));
        department.setDepartmentType(req.getParameter("departmentType"));
        department.setPosition(req.getParameter("position"));
        department.setWorkTime(StringToTime.doParse(req.getParameter("workTime")));
        department.setCloseTime(StringToTime.doParse(req.getParameter("closeTime")));
        DepartmentService departmentService = new DepartmentServiceImpl();
        departmentService.insertDepartment(department);
        resp.sendRedirect("queryDepartment?page="+0+"&current="+1);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
