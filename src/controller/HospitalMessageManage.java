package controller;

import com.alibaba.fastjson.JSON;
import entity.Hospital;
import entity.User;
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
import java.util.HashMap;
import java.util.List;

@WebServlet("/hospitalMessageManage")
public class HospitalMessageManage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        HospitalService hospitalService = new HospitalServiceImpl();
        User user = (User) req.getSession().getAttribute("user");
        int hospitalID = user.getHospitalID();
        Hospital hospital = hospitalService.queryHospitalByID(hospitalID);
        req.setAttribute("userHospital", hospital);
        req.getRequestDispatcher("hospitalManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
