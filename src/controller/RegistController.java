package controller;

import entity.Hospital;
import entity.User;
import service.HospitalService;
import service.HospitalServiceImpl;
import service.UserServiceImpl;
import utils.UserType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/registC")
public class RegistController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String realName = req.getParameter("realName");
        String idCardType = req.getParameter("idCardType");
        String idCardNum = req.getParameter("idCardNum");
        User user = new User();
        user.setUserName(req.getParameter("userName"));
        user.setUserPwd(req.getParameter("password"));
        user.setUserTel(req.getParameter("phone"));
        user.setRealName(req.getParameter("realName"));
        user.setUserType(Integer.parseInt(req.getParameter("idCardType")));
        user.setIdCardNum(req.getParameter("idCardNum"));
        UserServiceImpl userService = new UserServiceImpl();
        userService.addUser(user, UserType.NORMAL_USER);
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}