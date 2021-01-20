package controller;

import entity.Doctor;
import entity.Patient;
import entity.User;
import service.DoctorService;
import service.DoctorServiceImpl;
import service.PatientServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

//controller层
@WebServlet("/patientUpdate")
public class UpdatePatient extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        Patient patient = new Patient();
        patient.setPatientID(Integer.parseInt(req.getParameter("patientID")));
        patient.setPatientName((String) req.getParameter("updatePatientName"));
        patient.setIdCardNum((String) req.getParameter("updatePatientIdCardNum"));
        patient.setIdCardType(Integer.parseInt(req.getParameter("updatePatientIDCardType")));
        patient.setAge(Integer.parseInt(req.getParameter("updatePatientAge")));
        patient.setGender(Integer.parseInt(req.getParameter("updatePatientGender")));
        patient.setBirthday(Date.valueOf(req.getParameter("updatePatientBirthday")));
        patient.setTel(req.getParameter("updatePatientTel"));
        patient.setMariStatus(Integer.parseInt(req.getParameter("updatePatientMarry")));
        patient.setAddress(req.getParameter("updatePatientAddress"));
        patient.setObjective(Integer.parseInt(req.getParameter("updatePatientObjective")));
        patient.setLinkName(req.getParameter("updatePatientLinkName"));
        patient.setLinkidCardType(Integer.parseInt(req.getParameter("updatePatientLinkIdCardType")));
        patient.setLinkidCardNum(req.getParameter("updatePatientLinkIdCardNum"));
        patient.setLinkTel(req.getParameter("updatePatientLinkTel"));
        User user = (User) req.getSession().getAttribute("user");
        patient.setUserID(user.getUserID());
        PatientServiceImpl patientService = new PatientServiceImpl();
        patientService.updatepatient(patient);
        resp.sendRedirect("patientDetail?current="+4+"&patientID="+patient.getPatientID());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
