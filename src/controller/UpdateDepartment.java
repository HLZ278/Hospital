package controller;

import entity.Department;
import entity.Hospital;
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
@WebServlet("/departmentUpdate")
public class UpdateDepartment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        Department department = new Department();
        department.setDepartmentID(Integer.parseInt(req.getParameter("departmentID")));
        department.setDepartmentType(req.getParameter("departmentType"));
        department.setDepartmentName( req.getParameter("departmentName"));
        department.setPosition( req.getParameter("position"));
        department.setWorkTime(StringToTime.doParse(req.getParameter("workTime")));
        department.setCloseTime(StringToTime.doParse(req.getParameter("closeTime")));
        DepartmentService departmentService = new DepartmentServiceImpl();
        departmentService.updateDepartment(department);
        resp.sendRedirect("queryDepartment?page="+0+"&current="+1);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
