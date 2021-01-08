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
@WebServlet("/doLogin")
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String userPwd = req.getParameter("userPwd");
        System.out.println(userName+"---"+userPwd);
        //调用业务层进行查询
        UserService userService = new UserServiceImpl();
        User user = userService.login(userName);
        if (user != null){
            if (user.getUserPwd().equals(userPwd)){
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                //判断用户类型，跳转对应页面
                switch (user.getUserType()) {
                    case UserType.NORMAL_USER:
                        req.getRequestDispatcher("home.jsp").forward(req, resp);
                        break;
                    case UserType.HOSPITAL_USER:
                        req.getRequestDispatcher("hospitalManage.jsp").forward(req, resp);
                        break;
                    case UserType.SYS_USER:
                        req.getRequestDispatcher("systemManage.jsp").forward(req, resp);
                        break;
                    default:
                        break;
                }
            }else {
                req.setAttribute("msgg", 1);
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
