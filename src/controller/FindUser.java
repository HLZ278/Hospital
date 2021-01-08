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
import java.io.IOException;

//controller层
@WebServlet("/findUser")
public class FindUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        //System.out.println("ssssssss"+userName);
        UserService userService = new UserServiceImpl();
        resp.getWriter().print(userService.findUser(userName));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
