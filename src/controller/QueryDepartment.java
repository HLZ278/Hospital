package controller;

import com.alibaba.fastjson.JSON;
import entity.Department;
import entity.Hospital;
import entity.User;
import service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

//controller层
@WebServlet("/queryDepartment")
public class QueryDepartment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        String departmentName = req.getParameter("departmentName");
        User user = (User) req.getSession().getAttribute("user");
        int hospitalID = user.getHospitalID();
        int page = Integer.parseInt(req.getParameter("page"));
        DepartmentService departmentService = new DepartmentServiceImpl();
        List<Department> departments = departmentService.queryDepartment(hospitalID, page, departmentName);
        Object o = JSON.toJSON(departments);
        req.setAttribute("list", o);
        req.getRequestDispatcher("hospitalManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
