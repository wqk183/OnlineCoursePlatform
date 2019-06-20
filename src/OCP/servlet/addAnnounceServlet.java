package OCP.servlet;

import OCP.factory.DAOFactory;
import OCP.vo.announce;
import OCP.vo.video;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet( "/addAnnounceServlet")
public class addAnnounceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //response.setContentType("text/html");
        PrintWriter out=response.getWriter();

        String announce_title=request.getParameter("announce_title");
        String announce_content =request.getParameter("announce_content");
        String announce_date = request.getParameter("announce_date");

        announce announce = new announce();
        announce.setAnnounce_title(announce_title);
        announce.setAnnounce_content(announce_content);
        announce.setAnnounce_date(announce_date);
        try {
            DAOFactory.getAnnounceDAOInstance().add(announce);
            response.sendRedirect("admin_Announce.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
