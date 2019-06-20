package OCP.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HttpFilter implements Filter {
    private FilterConfig filterConfig;
    public FilterConfig getFilterConfig(){
        return this.filterConfig;
    }
    @Override
    public void init(FilterConfig config) throws ServletException {
        this.filterConfig=config;
        init();
    }
    protected void init(){

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        doFilter((HttpServletRequest)request,(HttpServletResponse) response,chain);
    }
    protected void doFilter(HttpServletRequest request,HttpServletResponse response,FilterChain chain )throws IOException, ServletException {

    }
    @Override
    public void destroy() {

    }
}
