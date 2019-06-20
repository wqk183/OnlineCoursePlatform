package OCP.servlet;

import OCP.factory.DAOFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateAnnounceServlet")
public class updateAnnounceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String announce_title=request.getParameter("announce_title");
        String announce_content=request.getParameter("announce_content");
        String announce_date=request.getParameter("announce_date");
        DAOFactory.getAnnounceDAOInstance().updateAnnounceInfor(announce_title,announce_content,announce_date);
        response.sendRedirect("admin_Manage_Announce.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
