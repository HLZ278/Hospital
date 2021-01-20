package controller;

import com.alibaba.fastjson.JSON;
import entity.Patient;
import entity.User;
import service.PatientServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//用于医院管理界面中的科室管理
@WebServlet("/patientDetail")
public class PatientDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
//        User user = (User) req.getSession().getAttribute("user");
//        int userID = user.getUserID();
        int patientID = Integer.parseInt(req.getParameter("patientID"));
        PatientServiceImpl patientService = new PatientServiceImpl();
        Patient patient = patientService.queryPatientByPatientID(patientID);
        req.setAttribute("patient", patient);
        Object o = JSON.toJSON(patient);
        req.setAttribute("patientJson", o);
        System.out.println(o);
        req.getRequestDispatcher("patientManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
