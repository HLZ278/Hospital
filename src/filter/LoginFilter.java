//package filter;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//@WebFilter(filterName = "loginFilter", urlPatterns = { "/*" })
//public class LoginFilter implements javax.servlet.Filter {
//
//    public LoginFilter() {
//    }
//
//    public void destroy() {
//    }
//    public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain) throws IOException, ServletException {
//        // 转化为我们习惯用的request和response对象(个人习惯)
//        HttpServletRequest request = (HttpServletRequest) arg0;
//        HttpServletResponse response = (HttpServletResponse) arg1;
//        HttpSession session = request.getSession(true);
//        // 设置编码格式
//        response.setContentType("text/html;");
//        response.setCharacterEncoding("utf-8");
//        request.setCharacterEncoding("utf-8");
//        response.setCharacterEncoding("utf-8");
//        PrintWriter out = response.getWriter();
//        String ctxPath = request.getContextPath();
//        //获取传来的请求
//        String uri = request.getRequestURI();
//        // 对请求的字符串进行截取 例如http://localhost:8080/aaa/bbb.jsp中我们想要的请求字符串为bbb.jsp
//        uri = uri.substring(uri.lastIndexOf("/")+1);
//        // 放行登录注册界面和请求以及相对应的效验请求还有css样式！！！很多人加了过滤器没有放行样式所以导致样式都没了
//        // 解决方法放行样式：如下
//        if (uri.equals("login.jsp") || uri.equals("checkUserTele.do") || uri.equals("reguser.do")
//                || uri.equals("checkUserCardId.do") || uri.equals("userLogin.do") || uri.equals("insertUser.do")
//                || uri.indexOf(".jpg") > 0 || uri.indexOf(".jpeg") > 0 || uri.indexOf(".png") > 0
//                || uri.indexOf(".gif") > 0 || uri.indexOf(".css") > 0
//                || uri.indexOf("js") > 0||uri.contains("homeWithSearchByHospitalName")
//                ||uri.contains("login.jsp")||uri.contains("doLogin")||uri.contains("enterHome")
//                || uri.contains("queryHospitalByID")|| uri.contains("hospitalDetail.jsp")
//                || uri.contains("queryNumSrcView")) {
//            // 放行到下一个过滤器，如果是最后一个，跳转到对应请求处理方法
//            chain.doFilter(request, response);
//            return;
//        }
//        //session检查，看session中是否有登录过的用户
//        // 我的登录方法中，登录成功就往session中存一个用户信息，key为login
//        Object object = session.getAttribute("login");
//        if (object == null) {
//            out.println("您没有登录，请先登录！3秒后回到登录页面。");
//            response.setHeader("refresh", "3;url=" + ctxPath + "/login.jsp");
//        }else{
//            // 有就向下执行
//            chain.doFilter(request, response);
//        }
//    }
//
//    /**
//     * @see Filter#init(FilterConfig)
//     */
//    public void init(FilterConfig fConfig) throws ServletException {
//        // TODO Auto-generated method stub
//    }
//
//}
//
//
////public class LoginFilter implements Filter {
////
////    public void destroy() {
////    }
////
////    public void doFilter(ServletRequest request, ServletResponse response,
////                         FilterChain chain) throws IOException, ServletException {
////        HttpServletRequest req = (HttpServletRequest) request;
////        HttpServletResponse resp = (HttpServletResponse) response;
////        HttpSession session = req.getSession(true);
////        resp.setContentType("text/html;");
////        resp.setCharacterEncoding("utf-8");
////        PrintWriter out = resp.getWriter();
////        String request_uri = req.getRequestURI();
////        String ctxPath = req.getContextPath();
////        String uri = request_uri.substring(ctxPath.length());
////        System.out.println(uri);
////        if (uri.contains("images")||uri.contains("js")||uri.contains("css")||uri.contains("homeWithSearchByHospitalName")||uri.contains("login.jsp")||uri.contains("doLogin")||uri.contains("enterHome") || uri.contains("queryHospitalByID")|| uri.contains("hospitalDetail.jsp")|| uri.contains("queryNumSrcView")|| uri.contains("queryNumSrcView")) {
////            chain.doFilter(request, response);
////        } else {
////            if (session.getAttribute("user") != null) {
////                chain.doFilter(request, response);
////            } else {
////                out.println("您没有登录，请先登录！3秒后回到登录页面。");
////                resp.setHeader("refresh", "3;url=" + ctxPath + "/login.jsp");
////                return;
////            }
////        }
////    }
////
////    public void init(FilterConfig fConfig) throws ServletException {
////
////    }
////
////}
