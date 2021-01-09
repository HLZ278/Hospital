package controller;

import com.alibaba.fastjson.JSON;
import entity.User;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

//controller层
@WebServlet("/ordinaryUser")
public class OrdinaryQuery extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        int page = Integer.parseInt(req.getParameter("page"));
        UserService userService = new UserServiceImpl();
        List<User> users = userService.queryUser(page);
        Object o = JSON.toJSON(users);
        req.setAttribute("list", o);
        req.getRequestDispatcher("systemManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
