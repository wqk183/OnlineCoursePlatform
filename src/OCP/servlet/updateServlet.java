package OCP.servlet;

import OCP.factory.DAOFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public updateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String account=request.getParameter("account");
        String password=request.getParameter("password");
        String name=request.getParameter("name");
        String sex=request.getParameter("sex");
        int age=Integer.parseInt(request.getParameter("age"));
        String address=request.getParameter("address");
        String introducing=request.getParameter("introducing");
        String job=request.getParameter("job");
        String job_direction=request.getParameter("job_direction");
        String identity=request.getParameter("identity");
        DAOFactory.getPersonDAOInstance().updateInfor(account,password,name,sex,age,address,introducing,job,job_direction,identity);
        response.sendRedirect("updateManagement.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
