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

//这个用来登陆时用户输入用户名后查找数据库是否有该用户，没有就警告一下
@WebServlet("/findUser")
public class FindUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        UserService userService = new UserServiceImpl();
        //直接在print出findUser（）方法返回的字符串找到的话是true，没找到就是false
        // 在前端的ajax会获取到本sevlet的返回值就是这个字符串，在前端判断一下就可以了
        resp.getWriter().print(userService.findUser(userName));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
