package controller;
import entity.Hospital;
import service.HospitalService;
import service.HospitalServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSpinnerUI;
import java.io.IOException;
import java.util.List;

@WebServlet("/homeWithSearchByHospitalName")
public class SearchByHospitalName extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        String hospitalName = req.getParameter("hospitalName");
        HospitalService hospitalService = new HospitalServiceImpl();
        List<Hospital> hospitals = hospitalService.queryHospitalByName(hospitalName);
        req.setAttribute("hospitals", hospitals);
        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}