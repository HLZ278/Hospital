package controller;

import com.alibaba.fastjson.JSON;
import entity.Hospital;
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
import java.util.HashMap;
import java.util.List;

//用于展示系统管理界面的医院管理时进行查找医院信息
@WebServlet("/hospitalTable")
public class HospitalTableQuery extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        //获取到搜索框中的值，这个将会在HospitalServiceImpl的queryHospital()中判断是否是个有效值从而进行条件查询
        String hospitalName = req.getParameter("hospitalName");
        //page用于按第几页进行查询，现在都是0页，以后在说吧
        int page = Integer.parseInt(req.getParameter("page"));
        HospitalService hospitalService = new HospitalServiceImpl();
        //开始查询，如果hospitalName有效就是说是用户点了搜索，所以会进行条件搜索，如果无效将会全部搜索
        List<Hospital> hospitals = hospitalService.queryHospital(hospitalName, page);
        UserService userService = new UserServiceImpl();
        //因为医院管理界面的table中有一栏是管理员ID，所以也需要查询出医院管理用户的ID
        //hospitalIDMap用于保存每一个医院和该医院管理者的关联，key是医院ID，value是用户ID
        HashMap<Integer, Integer> hospitalIDMap = new HashMap();
        for (Hospital hospital:
                hospitals) {
            //for循环进行一个个查找然后建立映射
            int a = userService.queryUserIDByHospitalID(hospital.getHospitalID());
            hospitalIDMap.put(hospital.getHospitalID(), a);
        }
        int count = hospitalService.countHospital();
        int pageCount = (count/14)+1;
        req.setAttribute("pageCount", pageCount);
        req.setAttribute("nowPage", page);

        //将查找出来的hospitals（即医院集合）通过fastJson(第三方，不用深究)转为json对象
        Object o = JSON.toJSON(hospitals);
        //将该json对象设置到request域中的list，以后在前端就可以方便的取出hospital的各项属性
        req.setAttribute("list", o);
        //将刚刚的映射也设置到request域中
        req.setAttribute("hospitalIDMap", hospitalIDMap);
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
