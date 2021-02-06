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
        //获取到搜索框中的值，这个将会在UserServiceImpl的queryHospitalUser()中判断是否是个有效值从而进行条件查询
        String userName = req.getParameter("userName");
        //page用于按第几页进行查询，现在都是0页，以后在说吧
        int page = Integer.parseInt(req.getParameter("page"));
        UserService userService = new UserServiceImpl();
        //开始查询，如果userName有效就是说是用户点了搜索，所以会进行条件搜索，如果无效将会全部搜索，请进去看
        List<User> users = userService.queryHospitalUser(userName, page);
        //因为医院管理界面的table中有一栏是医院名称，所以也需要查询
        //hospitalNameMap用于保存每一个医院管理者和该医院名的关联，key是用户ID，value是医院名称
        HashMap<Integer, String> hospitalNameMap = new HashMap();
        HospitalService hospitalService = new HospitalServiceImpl();
        for (User user:
             users) {
            //for循环进行一个个查找然后建立映射
            String a = hospitalService.queryHospitalName(user.getHospitalID());
            hospitalNameMap.put(user.getUserID(), a);
        }
        int count = userService.countHospitalUser();
        int pageCount = (count/14)+1;
        req.setAttribute("pageCount", pageCount);
        req.setAttribute("nowPage", page);

        //将查找出来的users（即医院集合）通过fastJson(第三方，不用深究)转为json对象
        Object o = JSON.toJSON(users);
        //将该json对象设置到request域中的list，以后在前端就可以方便的取出hospital的各项属性
        req.setAttribute("list", o);
        //将刚刚的映射也设置到request域中
        req.setAttribute("hospitalNameMap", hospitalNameMap);
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
