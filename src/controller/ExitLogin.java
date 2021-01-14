package controller;

import entity.User;
import service.UserService;
import service.UserServiceImpl;
import utils.UserType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//controller层
@WebServlet("/exitLogin")
public class ExitLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //退出登录即是把user从session中移除后回到主页面
        HttpSession session = req.getSession();
        session.removeAttribute("user");
        resp.sendRedirect("home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
