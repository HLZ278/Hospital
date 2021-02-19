package controller;

import entity.Patient;
import service.NumSrcServiceImpl;
import service.OrderServiceImpl;
import service.PatientServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;


@WebServlet("/completeOrBreakOrder")
public class CompleteOrBreakOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        int orderID = Integer.parseInt(req.getParameter("orderID"));
        int completeOrBreak = Integer.parseInt(req.getParameter("completeOrBreak"));//由于以履约还是爽约这两个按钮执行的是同一个js方法 所以completeOrBreak是页面传来用于判断用户点击的是以履约还是爽约
        OrderServiceImpl orderService = new OrderServiceImpl();
        int patientID = Integer.parseInt(req.getParameter("patientID"));
        PatientServiceImpl patientService = new PatientServiceImpl();
        Patient patient = patientService.queryPatientByPatientID(patientID);
        if (completeOrBreak==1){ //履约
            orderService.completeOrder(orderID);
        }else {//爽约

            //爽约次数到达三次封禁三天
            if (patient.getTimes()==2){
                Date date = new Date();
                Timestamp timestamp = new Timestamp(date.getYear(),date.getMonth(), date.getDate()+3, date.getHours(), date.getMinutes(), date.getSeconds(),0);
                patient.setUnseal(timestamp);
                //爽约次数加一
                patient.setTimes(patient.getTimes()+1);

            }else if (patient.getTimes()==5){//爽约次数到达三次封禁六天
                Date date = new Date();
                Timestamp timestamp = new Timestamp(date.getYear(),date.getMonth(), date.getDate()+6, date.getHours(), date.getMinutes(), date.getSeconds(),0);
                patient.setUnseal(timestamp);
                //爽约到达六次后清零重计
                patient.setTimes(0);
            }else {
                //爽约次数加一
                patient.setTimes(patient.getTimes()+1);
            }
            patientService.updatepatientBreak(patient);
            orderService.breakOrder(orderID);
        }
        req.getRequestDispatcher("queryHospitalOrderManageView").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
