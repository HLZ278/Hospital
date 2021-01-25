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
public class DeleteDerpartment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //点击commonUserManage.jsp中的删除按钮时已往js函数传入了userID，然后js又将该userID设置到request域中后进行这个sevlet请求
        //获取request域中的userID
        int departmentID = Integer.parseInt(req.getParameter("departmentID"));
        DepartmentService departmentService = new DepartmentServiceImpl();
        //通过userID删除用户
        departmentService.deleteDepartment(departmentID);
        //因为删除用户有可能是普通的用户或者是医院管理员，所以通过userType判断删除用户后需要留在哪个导航 current为导航索引 page为查找第几页
        resp.sendRedirect("queryDepartment?page="+0+"&current="+1);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
