package controller;

import com.alibaba.fastjson.JSON;
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
@WebServlet("/userInsert")
public class UserInsert extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        User user = new User();
        user.setUserName((String) req.getParameter("userName"));
        user.setUserPwd((String) req.getParameter("userPwd"));
        user.setUserTel((String) req.getParameter("userTel"));
        user.setRealName((String) req.getParameter("realName"));
        user.setIdCardType(Integer.parseInt(req.getParameter("idCardType")));
        user.setIdCardNum((String) req.getParameter("idCardNum"));
        user.setUserType(Integer.parseInt(req.getParameter("userType")));
        UserService userService = new UserServiceImpl();
        int result = 0;
        if (req.getParameter("hospitalID")!=null){
            user.setHospitalID(Integer.parseInt(req.getParameter("hospitalID")));
            result = userService.addUser(user, UserType.HOSPITAL_USER);
        }else {
            result = userService.addUser(user, UserType.NORMAL_USER);
        }
        String which = req.getParameter("which");
        if (result!=0){
            if (req.getParameter("userType").equals("1")){
                if (which.equals("ordinaryOption")){
                }else {
                    resp.sendRedirect("ordinaryUser?page="+0+"&current="+1);
                }
            }else {
                resp.sendRedirect("hospitalUser?page="+0+"&current="+2);
            }
        }else{
            req.getRequestDispatcher("systemManage.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
