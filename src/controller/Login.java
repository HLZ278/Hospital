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
        //表单提交后获取到表单中的用户名和密码
        String userName = req.getParameter("userName");
        String userPwd = req.getParameter("userPwd");
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
                        resp.sendRedirect("enterHome");
                        break;
                    case UserType.HOSPITAL_USER:
                        resp.sendRedirect("queryDepartment?page=0&current=1");
                        break;
                    case UserType.SYS_USER:
                        resp.sendRedirect("ordinaryUser?page=0&current=1");
                        break;
                    default:
                        break;
                }
            }else {
                //来到这个else代表着密码输入错误，用request发送个信息给前端
                req.setAttribute("msgg", 1);
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        }else {
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
