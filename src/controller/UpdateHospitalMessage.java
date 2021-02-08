package controller;

import com.alibaba.fastjson.JSON;
import entity.Hospital;
import entity.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import service.HospitalService;
import service.HospitalServiceImpl;
import utils.StringToTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@WebServlet("/updateHospitalMessage")
public class UpdateHospitalMessage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        String dir = getServletContext().getRealPath("./") + "images";
        String fileName = UUID.randomUUID().toString();
        User user = (User) req.getSession().getAttribute("user");
        HospitalServiceImpl hospitalService = new HospitalServiceImpl();
        Hospital hospital = hospitalService.queryHospitalByID(user.getHospitalID());
        // ①　创建ServletFileUpload实例
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 【设置缓存目录】
        factory.setRepository(new File(fileName));
        ServletFileUpload upload = new ServletFileUpload(factory);
        // 【表单大小总和】
        upload.setSizeMax(1024 * 1024 * 60);
        // 【单个文件不得超过】
        upload.setFileSizeMax(1024 * 1024 * 20);
        // 【处理中文乱码】
        upload.setHeaderEncoding("UTF-8");
        try {
            List<FileItem> list = upload.parseRequest(req);
            HashMap<String, String> stringStringHashMap = new HashMap<>();
            for (FileItem item : list) {
                // 如果表单是文件文件
                if (!item.isFormField()) {
                    if (item.getSize()>0){
                        String contentType = item.getContentType();
                        // 变量名
                        String name = item.getFieldName();// 表单的变量名
                        // 文件 内容
                        String content = item.getString();
                        // 二进制文件
                        InputStream input = item.getInputStream();
                        File saveFile = new File(dir, fileName+".png");
                        item.write(saveFile);
                        item.delete();
                        input.close();
                        //上传新的图片
                        hospital.setIcon(fileName);
                    }

                }else {
                    //没有上传新的图片
                    String key = item.getFieldName();
                    String value = item.getString("UTF-8");// 表单字段的输入值
                    stringStringHashMap.put(key, value);
                }
            }
            hospital.setHospitalName(stringStringHashMap.get("hospitalName"));
            hospital.setGrade(stringStringHashMap.get("hospitalGrade"));
            hospital.setArea(stringStringHashMap.get("hospitalArea"));
            hospital.setAddress(stringStringHashMap.get("hospitalAddress"));
            hospital.setReleaseTime(StringToTime.doParse(stringStringHashMap.get("hospitalOpen")));
            hospital.setStopTime(StringToTime.doParse(stringStringHashMap.get("hospitalClose")));
            hospital.setRule(stringStringHashMap.get("hospitalRule"));
            hospital.setDetails(stringStringHashMap.get("hospitalDetails"));
            System.out.println(hospital);
            hospitalService.updateHospitalMessage(hospital);
            resp.sendRedirect("hospitalMessageManage?current=6");
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //任何post请求终将前往doGet处理
        doGet(req, resp);
    }
}