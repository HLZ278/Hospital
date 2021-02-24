package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "LoginAuthorizeFilter", urlPatterns = "/*")
public class LoginAuthorizeFilter implements Filter
{
    // 初始化方法
    @Override
    public void init(FilterConfig filterConfig) throws ServletException
    {
    }

    // 过滤处理方法
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException
    {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String servletPath = httpServletRequest.getServletPath();  //获取客户端所请求的脚本文件的文件路径
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //不过滤处理登录页面、JS和CSS文件
        if (!servletPath.equals("/login.jsp") && !servletPath.equals("/servlet/LoginServlet")
                && !servletPath.endsWith(".js") && !servletPath.endsWith(".css") && !servletPath.contains("images")
                && !servletPath.endsWith(".css") && !servletPath.contains("enterHome")&& !servletPath.contains("findUser")
                && !servletPath.contains("hospitalDetail.jsp")&& !servletPath.contains("queryNumSrcView")&& !servletPath.contains("queryHospitalByID")
                && !servletPath.contains("noticePage.jsp")&& !servletPath.contains("homeWithSearchByHospitalName")
                && !servletPath.contains("searchHospitalAjaxC") && !servletPath.contains("regist.jsp")&& !servletPath.contains("regist.jsp")
                && !servletPath.contains("exitLogin")&& !servletPath.contains("exitLogin")&& !servletPath.contains("doLogin")
                && !servletPath.contains("registC"))
        {
            HttpSession session = ((HttpServletRequest) request).getSession();
            Object object = session.getAttribute("user");
            if (object == null) {
                // 没有就跳转到登录
                response.getWriter().print("请登录，三秒后跳转到登录界面");
                ((HttpServletResponse)response).setHeader("refresh", "3;url=login.jsp");
            }else{

            }
        }
        //放行
        chain.doFilter(request, response);
    }

    // 销毁方法
    @Override
    public void destroy()
    {
        // 释放资源
    }
}