import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class illegalAccess implements Filter {
    public void init(FilterConfig config)throws ServletException{}
    public void destroy(){}
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
        throws IOException,ServletException{
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse res = (HttpServletResponse)response;
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("user_id");
        if(id==null){
            res.sendRedirect("/login.jsp");
        }
        chain.doFilter(request,response);
    }
}
