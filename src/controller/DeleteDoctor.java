package controller;

import service.DoctorService;
import service.DoctorServiceImpl;
import service.HospitalService;
import service.HospitalServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//controller层
@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int doctorID = Integer.parseInt(req.getParameter("doctorID"));
        DoctorService doctorService = new DoctorServiceImpl();
        doctorService.deleteDoctor(doctorID);
        resp.sendRedirect("queryDoctor?page="+0+"&current="+4+"&departmentID="+req.getParameter("departmentID"));
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
