package controller;

import service.HospitalService;
import service.HospitalServiceImpl;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//controller层
@WebServlet("/deleteHospital")
public class DeleteHospital extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int hospitalID = Integer.parseInt(req.getParameter("hospitalID"));
        HospitalService hospitalService = new HospitalServiceImpl();
        hospitalService.deleteHospital(hospitalID);
        resp.sendRedirect("hospitalTable?page="+0+"&current="+3);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
