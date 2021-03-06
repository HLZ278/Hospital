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

//点击departmentManage.jsp的添加按钮执行的sevlet
@WebServlet("/departmentInsert")
public class DepartmentInsert extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        //获取弹出添加表单中的department各个属性封装到department对象中
        Department department = new Department();
        //从session域中获取当前的登录用户
        User u = (User)req.getSession().getAttribute("user");
        //因为需要根据某个医院进行添加科室，所以将当前登陆医院管理用户管理的医院ID设置到department中
        department.setHospitalID(u.getHospitalID());
        department.setDepartmentName(req.getParameter("departmentName"));
        department.setDepartmentType(req.getParameter("departmentType"));
        department.setPosition(req.getParameter("position"));
        department.setWorkTime(StringToTime.doParse(req.getParameter("workTime")));
        department.setCloseTime(StringToTime.doParse(req.getParameter("closeTime")));
        DepartmentService departmentService = new DepartmentServiceImpl();
        departmentService.insertDepartment(department);
        //添加完后重定向到科室页面，导航条位置为1
        resp.sendRedirect("queryDepartment?page="+0+"&current="+1);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
