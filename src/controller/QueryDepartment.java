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

//用于医院管理界面中的科室管理
@WebServlet("/queryDepartment")
public class QueryDepartment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        //先获取到搜索框中的值，这个将会在DepartmentServiceImpl的queryDepartment()中判断是否是个有效值从而进行条件查询
        String departmentName = req.getParameter("departmentName");
        //因为医院管理界面中的科室管理搜索科室时，需要根据用户所管理的医院来查找该医院的科室，而session域中恰好保存着user，user中又有hospitalID。
        User user = (User) req.getSession().getAttribute("user");
        int hospitalID = user.getHospitalID();
        int page = Integer.parseInt(req.getParameter("page"));
        HospitalServiceImpl hospitalService = new HospitalServiceImpl();
        String hospitalName = hospitalService.queryHospitalName(hospitalID);
        DepartmentService departmentService = new DepartmentServiceImpl();
        //queryDepartment(hospitalID, page, departmentName)中通过hospitalID会查找该医院科室，departmentName则会进行判断是否有效而进行条件搜索（即用户点击搜索框）
        List<Department> departments = departmentService.queryDepartment(hospitalID, page, departmentName);
        Object o = JSON.toJSON(departments);
        req.setAttribute("list", o);
        int count = departmentService.countDepartment(hospitalID);
        int pageCount = (count/14)+1;
        req.getSession().setAttribute("hospitalName", hospitalName);
        req.setAttribute("pageCount", pageCount);
        req.setAttribute("nowPage", page);
        req.getRequestDispatcher("hospitalManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
