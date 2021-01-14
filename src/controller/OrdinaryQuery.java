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

//用户系统管理页面中的普通用户管理的用户查询
@WebServlet("/ordinaryUser")
public class OrdinaryQuery extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        //先获取到搜索框中的值，这个将会在UserServiceImpl的queryUser()中判断是否是个有效值从而进行条件查询
        String userName = req.getParameter("userName");
        int page = Integer.parseInt(req.getParameter("page"));
        UserService userService = new UserServiceImpl();
        //开始查询，如果userName有效就是说是用户点了搜索，所以会进行条件搜索，如果无效将会全部搜索
        List<User> users = userService.queryUser(userName, page);
        //将查找出来的普通users（即医院集合）通过fastJson(第三方，不用深究)转为json对象，方便前端操作
        Object o = JSON.toJSON(users);
        req.setAttribute("list", o);
        //进行转发到systemManage中，因为刚来到本sevlet时，携带了page和current这两个request域中的值，所以无需重新设置，直接转发到systemManage.jsp
        //systemManage.jsp中的js会判断current值是什么而自动替换include页面，并使对应导航选中
        req.getRequestDispatcher("systemManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
