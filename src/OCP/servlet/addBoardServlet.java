package OCP.servlet;

import OCP.factory.DAOFactory;

import OCP.vo.board;
import OCP.vo.person;
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

@WebServlet("/addBoardServlet")
public class addBoardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        try {
        String board_content=request.getParameter("board_content");
        String accounting=request.getParameter("accounting");
        List<person> list=DAOFactory.getPersonDAOInstance().queryAll(accounting);

//        System.out.println(accounting);
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
//        System.out.println(dateFormat.format(date));

            board board=new board();
            board.setBoard_account(accounting);
            board.setBoard_content(board_content);
            board.setBoard_date(dateFormat.format(date));
            board.setBoard_image(list.get(0).getImage());

            DAOFactory.getBoardDAOInstance().add(board);
            response.sendRedirect("user_Manage_Board.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
