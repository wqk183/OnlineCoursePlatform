package OCP.servlet;

import OCP.factory.DAOFactory;
import OCP.vo.board;
import OCP.vo.person;
import OCP.vo.reply;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/replyBoardServlet")
public class replyBoardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        try {
            String reply_content=request.getParameter("reply_content");
            String account=request.getParameter("account");
            String board_account=request.getParameter("board_account");
            List<person> list=DAOFactory.getPersonDAOInstance().queryAll(account);
            List<board> list1=DAOFactory.getBoardDAOInstance().queryAll(board_account);

//        System.out.println(accounting);
            Date date = new Date();
            SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
//        System.out.println(dateFormat.format(date));

            reply reply=new reply();
            reply.setReply_image(list.get(0).getImage());
            reply.setReply_account(account);
            reply.setReply_content(reply_content);
            reply.setReply_date(dateFormat.format(date));
            reply.setBoard_account(list1.get(0).getBoard_account());
            reply.setBoard_content(list1.get(0).getBoard_content());
            reply.setBoard_date(list1.get(0).getBoard_date());
            reply.setBoard_image(list1.get(0).getBoard_image());

            DAOFactory.getReplyDAOInstance().add(reply);
            response.sendRedirect("user_Manage_Board.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
