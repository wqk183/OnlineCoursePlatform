package OCP.servlet;



import OCP.dao.PersonDao;
import OCP.daoImpl.PersonDaoImpl;
import OCP.factory.DAOFactory;
import OCP.vo.person;
import javafx.scene.control.Alert;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String account=request.getParameter("account");
		String password=request.getParameter("password");
		String identity=request.getParameter("identity");

		HttpSession session=request.getSession();
		String input= (String) session.getAttribute("rand");
		String ouput=request.getParameter("verify");

		person person=new person();
		person.setAccount(account);
		person.setPassword(password);
		person.setIdentity(identity);
		PersonDao personDao=new PersonDaoImpl();
		try {
			if(personDao.login(person)&& input.equals(ouput)) {
				//System.out.println(request.getContextPath());
				List<person> list=DAOFactory.getPersonDAOInstance().queryAll(account);
				HttpSession httpSession=request.getSession(true);
				httpSession.setMaxInactiveInterval(60);
				httpSession.setAttribute("account",account);
				httpSession.setAttribute("password",list.get(0).getPassword());
				httpSession.setAttribute("id",DAOFactory.getPersonDAOInstance().QueryId(person));
				httpSession.setAttribute("image",list.get(0).getImage());
				httpSession.setAttribute("name",list.get(0).getName());
				httpSession.setAttribute("sex",list.get(0).getSex());
				httpSession.setAttribute("age",list.get(0).getAge());
				httpSession.setAttribute("address",list.get(0).getAddress());
				httpSession.setAttribute("introducing",list.get(0).getIntroducing());
				httpSession.setAttribute("job",list.get(0).getJob());
				httpSession.setAttribute("job_direction",list.get(0).getJob_direction());
				httpSession.setAttribute("identity",list.get(0).getIdentity());

				//System.out.println(list.get(0).getIdentity());
				//request.getRequestDispatcher("/loginNext.jsp").forward(request,response);
				//response.sendRedirect(request.getContextPath()+ "/main_next.jsp");
				if(identity.equals(list.get(0).getIdentity()) && identity.equals("普通用户")){
						response.sendRedirect(request.getContextPath()+ "/user_main_next.jsp");
				}
				else {
					response.sendRedirect(request.getContextPath()+ "/admin_main_next.jsp");
				}
			}else {
				response.sendRedirect("log.html");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
