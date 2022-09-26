package com.ischoolbar.programmer.interceptor.home;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/*
 * 这个过滤器用来处理跨域
 */
public class CrossFilter implements Filter {

    // 允许跨域属性，默认值为false
    private boolean allowCross = false;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 获取web.xml中的参数值
        String res = filterConfig.getInitParameter("crossArgs");
        allowCross = res.equals("true") ? true : false;
        if (allowCross) {
            System.out.println("跨域设置已开启！");
        } else {
            System.out.println("禁止跨域！");
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // 允许跨域
        if(allowCross) {
            // 转换响应对象
            HttpServletResponse httpServletResponse = (HttpServletResponse)response;
            // 响应对象设置跨域
            // 设置允许跨域的ip
            httpServletResponse.setHeader("Access-Control-Allow-Origin", "http://localhost:8085");
            // 设置允许的请求头
            httpServletResponse.setHeader("Access-Control-Allow-Headers", "*");
            // 设置凭证
            httpServletResponse.setHeader("Access-Control-Allow-Credentials", "true");
            // 设置允许的方法
            httpServletResponse.setHeader("Access-Control-Allow-Methods", "GET,POST");
        }
        // 执行过滤
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        allowCross = false;
    }

}
