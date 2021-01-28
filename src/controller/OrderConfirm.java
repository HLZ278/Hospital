package controller;

import com.alibaba.fastjson.JSON;
import entity.Patient;
import entity.User;
import service.PatientServiceImpl;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/orderConfirm")
public class OrderConfirm extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        User user = (User) req.getSession().getAttribute("user");
        int userID = user.getUserID();
        PatientServiceImpl patientService = new PatientServiceImpl();
        List<Patient> patients = patientService.queryPatient(userID);
        req.setAttribute("patients", patients);
        req.getRequestDispatcher("hospitalDetail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
