package controller;

import entity.User;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//controller层
@WebServlet("/personUpdate")
public class UpdatePerson extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        User user = (User) req.getSession().getAttribute("user");
        user.setUserID(user.getUserID());
        user.setUserName((String) req.getParameter("updateUserName"));
        user.setUserPwd((String) req.getParameter("updateUserPwd"));
        user.setUserTel((String) req.getParameter("updateUserTel"));
        user.setRealName((String) req.getParameter("updateUserRealName"));
        user.setIdCardType(Integer.parseInt(req.getParameter("updatePatientLinkIdCardType")));
        user.setIdCardNum((String) req.getParameter("updateUserIDNum"));
        UserService userService = new UserServiceImpl();
        userService.updateUser(user);
        resp.sendRedirect("patientManage.jsp?current="+3);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
