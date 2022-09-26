package com.ischoolbar.programmer.interceptor.home;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/*
 * ��������������������
 */
public class CrossFilter implements Filter {

    // ����������ԣ�Ĭ��ֵΪfalse
    private boolean allowCross = false;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // ��ȡweb.xml�еĲ���ֵ
        String res = filterConfig.getInitParameter("crossArgs");
        allowCross = res.equals("true") ? true : false;
        if (allowCross) {
            System.out.println("���������ѿ�����");
        } else {
            System.out.println("��ֹ����");
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // �������
        if(allowCross) {
            // ת����Ӧ����
            HttpServletResponse httpServletResponse = (HttpServletResponse)response;
            // ��Ӧ�������ÿ���
            // ������������ip
            httpServletResponse.setHeader("Access-Control-Allow-Origin", "http://localhost:8085");
            // �������������ͷ
            httpServletResponse.setHeader("Access-Control-Allow-Headers", "*");
            // ����ƾ֤
            httpServletResponse.setHeader("Access-Control-Allow-Credentials", "true");
            // ��������ķ���
            httpServletResponse.setHeader("Access-Control-Allow-Methods", "GET,POST");
        }
        // ִ�й���
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        allowCross = false;
    }

}
