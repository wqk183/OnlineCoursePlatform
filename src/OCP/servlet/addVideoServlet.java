package OCP.servlet;

import OCP.factory.DAOFactory;
import OCP.vo.video;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/addVideoServlet")
public class addVideoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //response.setContentType("text/html");
        PrintWriter out=response.getWriter();

        String video_name=request.getParameter("video_name");
        String link =request.getParameter("link");

        video video=new video();
        video.setVideo_name(video_name);
        video.setLink(link);

        try {
            DAOFactory.getVideoDAOInstance().add(video);
            response.sendRedirect("add_resourceManagement.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
