package OCP.servlet;

import OCP.dao.PersonDao;
import OCP.factory.DAOFactory;
import OCP.vo.person;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.DataInput;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/addServlet")
public class addServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        String account=request.getParameter("account");
        String password=request.getParameter("password");
        String sex=request.getParameter("sex");
        String image=request.getParameter("image");
        String identity=request.getParameter("identity");

        person person=new person();
        person.setAccount(account);
        person.setPassword(password);
        person.setSex(sex);
        person.setImage(image);
        person.setIdentity(identity);

        try {
            DAOFactory.getPersonDAOInstance().add(person);
            response.sendRedirect("addManagement.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
