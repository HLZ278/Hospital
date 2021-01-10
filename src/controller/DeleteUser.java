package controller;

import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//controller层
@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userID = Integer.parseInt(req.getParameter("userID"));
        //System.out.println("ssssssss"+userName);
        UserService userService = new UserServiceImpl();
        int result = userService.deleteUser(userID);
        if (result!=0){
            if (req.getParameter("userType").equals("1")){
                resp.sendRedirect("ordinaryUser?page="+0+"&current="+1);
            }else if (req.getParameter("userType").equals("2")){
                resp.sendRedirect("hospitalUser?page="+0+"&current="+2);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
