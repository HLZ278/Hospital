package controller;

import com.alibaba.fastjson.JSON;
import entity.User;
import service.HospitalService;
import service.HospitalServiceImpl;
import service.UserService;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

//controller层
@WebServlet("/hospitalUser")
public class HospitalUserQuery extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        String userName = req.getParameter("userName");
        int page = Integer.parseInt(req.getParameter("page"));
        UserService userService = new UserServiceImpl();
        List<User> users = userService.queryHospitalUser(userName, page);
        HashMap<Integer, String> hospitalNameMap = new HashMap();
        HospitalService hospitalService = new HospitalServiceImpl();
        for (User user:
             users) {
            String a = hospitalService.queryHospitalName(user.getHospitalID());
            hospitalNameMap.put(user.getUserID(), a);
        }
        Object o = JSON.toJSON(users);
        req.setAttribute("list", o);
        req.setAttribute("hospitalNameMap", hospitalNameMap);
        req.getRequestDispatcher("systemManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
