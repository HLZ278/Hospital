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
@WebServlet("/userUpdate")
public class UpdateUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        User user = new User();
        user.setUserID(Integer.parseInt(req.getParameter("userID")));
        user.setUserName((String) req.getParameter("userName"));
        user.setUserPwd((String) req.getParameter("userPwd"));
        user.setUserTel((String) req.getParameter("userTel"));
        user.setRealName((String) req.getParameter("realName"));
        user.setIdCardType(Integer.parseInt(req.getParameter("idCardType")));
        user.setIdCardNum((String) req.getParameter("idCardNum"));
        user.setUserType(Integer.parseInt(req.getParameter("userType")));
        System.out.println(user);
        UserService userService = new UserServiceImpl();
        userService.updateUser(user);
        String which = req.getParameter("which");
        if (req.getParameter("userType").equals("1")){
            if (which.equals("ordinaryOption")){
            }else {
                resp.sendRedirect("ordinaryUser?page="+0+"&current="+1);
            }
        }else {
            resp.sendRedirect("hospitalUser?page="+0+"&current="+2);
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
