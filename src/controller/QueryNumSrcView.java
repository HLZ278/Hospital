package controller;

import com.alibaba.fastjson.JSON;
import entity.Department;
import entity.Doctor;
import entity.NumSrc;
import entity.NumSrcView;
import service.DepartmentServiceImpl;
import service.DoctorServiceImpl;
import service.NumSrcServiceImpl;
import service.NumSrcViewServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

//用于医院管理界面中的科室管理
@WebServlet("/queryNumSrcView")
public class QueryNumSrcView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        //window.location.href="queryNumSrc?page="+0+"&current="+5+"&departmentID="+departmentID+"&doctorID="+doctorID
        int departmentID = Integer.parseInt(req.getParameter("departmentID"));
        NumSrcViewServiceImpl numSrcViewService = new NumSrcViewServiceImpl();
        List<NumSrcView> list = numSrcViewService.queryNumSrc(departmentID);
        req.setAttribute("numSrcViews", list);
        java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat("MM月dd日");
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(calendar.DATE,1);
        Date tomorrowTime = calendar.getTime();
        calendar.add(calendar.DATE,1);
        Date bigTomorrowTime = calendar.getTime();
        String strCurrentTime=formater.format(date);
        String tomorrowDate=formater.format(tomorrowTime);
        String bigTomorrowDate=formater.format(bigTomorrowTime);
        HashMap<String, List<NumSrcView>> dateNumSrcViewMap = new HashMap<>();


        for (NumSrcView n:
                list) {
            if (dateNumSrcViewMap.get(formater.format(n.getContractTime()))==null){
                ArrayList<NumSrcView> temp = new ArrayList<>();
                temp.add(n);
                dateNumSrcViewMap.put(formater.format(n.getContractTime()), temp);
            }else {
                dateNumSrcViewMap.get(formater.format(n.getContractTime())).add(n);
            }
        }
        ArrayList<String> haves = new ArrayList<>();
        for (int i=0; i<3; i++){
            haves.add("无号");
        }
        for (int i=0; i<list.size(); i++){
            if (list.get(i).getRemain()>0){
                haves.set(i, "有号");
            }
        }
        System.out.println("haves="+haves+"&list="+list);
        req.setAttribute("havas", haves);

        req.setAttribute("dateNumSrcViewMap", JSON.toJSONString(dateNumSrcViewMap));
        req.getRequestDispatcher("hospitalDetail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}
