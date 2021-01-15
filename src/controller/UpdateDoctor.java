package controller;

import entity.Doctor;
import entity.Hospital;
import service.DoctorService;
import service.DoctorServiceImpl;
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
@WebServlet("/doctorUpdate")
public class UpdateDoctor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        Doctor doctor = new Doctor();
        doctor.setDoctorID(Integer.parseInt(req.getParameter("doctorID")));
        doctor.setDoctorName((String) req.getParameter("doctorName"));
        doctor.setJob((String) req.getParameter("job"));
        doctor.setGender(Integer.parseInt(req.getParameter("gender")));
        doctor.setAge(Integer.parseInt(req.getParameter("age")));
        doctor.setExpertise(req.getParameter("expertise"));
        doctor.setCost(Float.parseFloat(req.getParameter("cost")));
        doctor.setDepartmentID(Integer.parseInt(req.getParameter("departmentID")));
        DoctorService doctorService = new DoctorServiceImpl();
        doctorService.updateDoctor(doctor);
        resp.sendRedirect("queryDoctor?page="+0+"&current="+4+"&departmentID="+req.getParameter("departmentID"));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
