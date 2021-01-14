package controller;

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

//controller层
@WebServlet("/deleteHospital")
public class DeleteHospital extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //在hospitalTableManage.jsp点击删除按钮时已往js函数传入了hospitalID，然后js又将该hospitalID设置到request域中
        int hospitalID = Integer.parseInt(req.getParameter("hospitalID"));
        HospitalService hospitalService = new HospitalServiceImpl();
        //通过hospitalID进行删除，如果医院中有管理员存在则无法删除
        hospitalService.deleteHospital(hospitalID);
        //去往hospitalTable这个Sevelet，传入参数page=0和current=3
        resp.sendRedirect("hospitalTable?page="+0+"&current="+3);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
