package controller;

import entity.Hospital;
import entity.User;
import service.HospitalService;
import service.HospitalServiceImpl;
import service.UserService;
import service.UserServiceImpl;
import utils.StringToTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Time;

//controller层
@WebServlet("/hospitalInsert")
public class HospitalInsert extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        Hospital hospital = new Hospital();
        hospital.setHospitalName((String) req.getParameter("hospitalName"));
        hospital.setGrade((String) req.getParameter("grade"));
        hospital.setArea((String) req.getParameter("area"));
        hospital.setAddress((String) req.getParameter("address"));
        hospital.setReleaseTime(StringToTime.doParse(req.getParameter("releaseTime")));
        hospital.setStopTime(StringToTime.doParse(req.getParameter("stopTime")));
        HospitalService hospitalService = new HospitalServiceImpl();
        hospitalService.insertHospital(hospital);
        resp.sendRedirect("hospitalTable?page="+0+"&current="+3);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
