package controller;

import service.DepartmentService;
import service.DepartmentServiceImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//controller层
@WebServlet("/deleteDepartment")
public class DeleteDepartment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int departmentID = Integer.parseInt(req.getParameter("departmentID"));
        DepartmentService departmentService = new DepartmentServiceImpl();
        departmentService.deleteDepartment(departmentID);
        resp.sendRedirect("queryDepartment?page="+0+"&current="+1);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
