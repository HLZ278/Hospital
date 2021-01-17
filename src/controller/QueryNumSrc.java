package controller;

import com.alibaba.fastjson.JSON;
import entity.Department;
import entity.Doctor;
import entity.NumSrc;
import service.DepartmentServiceImpl;
import service.DoctorServiceImpl;
import service.NumSrcServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

//用于医院管理界面中的科室管理
@WebServlet("/queryNumSrc")
public class QueryNumSrc extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        //window.location.href="queryNumSrc?page="+0+"&current="+5+"&departmentID="+departmentID+"&doctorID="+doctorID
        int departmentID = Integer.parseInt(req.getParameter("departmentID"));
        int doctorID = Integer.parseInt(req.getParameter("doctorID"));
        int page = Integer.parseInt(req.getParameter("page"));
        DoctorServiceImpl doctorService = new DoctorServiceImpl();
        Doctor doctor = doctorService.queryDoctor(departmentID);
        DepartmentServiceImpl departmentService = new DepartmentServiceImpl();
        Department department = departmentService.queryDepartmentByID(departmentID);
        NumSrcServiceImpl numSrcService = new NumSrcServiceImpl();
        List<NumSrc> numSrcs = new ArrayList<NumSrc>();
        for(int i =0; i<3; i++){
            numSrcs.add(new NumSrc());
        }
        List<NumSrc> temp = numSrcService.queryNumSrc(doctorID);
        int i = 0;
        for (NumSrc numSrc:
             temp) {
            numSrcs.set(i++,numSrc);
        }
        req.setAttribute("numSrcs", numSrcs);
        req.setAttribute("doctor", doctor);
        req.setAttribute("department", department);
        req.getRequestDispatcher("hospitalManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
