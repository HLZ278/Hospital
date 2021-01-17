package controller;

import entity.NumSrc;
import service.NumSrcServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

//controller层
@WebServlet("/insertOrUpdateNumSrc")
public class InsertOrUpdateNumSrc extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        int doctorID = Integer.parseInt(req.getParameter("doctorID"));
        int remainNum1 = Integer.parseInt(req.getParameter("remainNum1"));
        int totalNum1 = Integer.parseInt(req.getParameter("totalNum1"));
        int remainNum2 = Integer.parseInt(req.getParameter("remainNum2"));
        int totalNum2 = Integer.parseInt(req.getParameter("totalNum2"));
        int remainNum3 = Integer.parseInt(req.getParameter("remainNum3"));
        int totalNum3 = Integer.parseInt(req.getParameter("totalNum3"));

        NumSrc numSrc1 = new NumSrc(0, doctorID, null, remainNum1, totalNum1);
        NumSrc numSrc2 = new NumSrc(0, doctorID, null, remainNum2, totalNum2);
        NumSrc numSrc3 = new NumSrc(0, doctorID, null, remainNum3, totalNum3);
        List<NumSrc> list = new ArrayList<>();
        list.add(numSrc1);
        list.add(numSrc2);
        list.add(numSrc3);
        NumSrcServiceImpl numSrcService = new NumSrcServiceImpl();
        numSrcService.insertOrUpdateNumSrc(list);
        resp.getWriter().println("保存成功");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
