package OCP.servlet;

import OCP.factory.DAOFactory;
import OCP.vo.person;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        String account=request.getParameter("account");
        String password=request.getParameter("password");
        String repassword=request.getParameter("repassword");
        String image=request.getParameter("image");

        person per=new person();
        per.setAccount(account);
        per.setPassword(password);
        per.setImage(image);

        if(repassword.equals(password)){
            try {
                DAOFactory.getPersonDAOInstance().register(per);
                response.sendRedirect("main.html");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            response.sendRedirect("reg.html");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
