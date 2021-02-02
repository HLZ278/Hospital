package controller;

import com.alibaba.fastjson.JSON;
import entity.Hospital;
import service.HospitalService;
import service.HospitalServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
@WebServlet("/searchHospitalAjaxC")
public class SearchHospitalAjax extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        String level = req.getParameter("level");
        String area = req.getParameter("area");
        System.out.println(level+"--"+area);
        HospitalService hospitalService = new HospitalServiceImpl();
        List<Hospital> hospitals = hospitalService.queryHospitalByLevelAndArea(level, area);
//        req.setAttribute("hospitals", hospitals);
        Object o = JSON.toJSON(hospitals);
        PrintWriter writer = resp.getWriter();
        writer.print(o);
        writer.flush();
        writer.close();
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}