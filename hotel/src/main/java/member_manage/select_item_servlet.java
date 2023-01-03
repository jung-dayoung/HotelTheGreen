package member_manage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class select_item_servlet
 */
@WebServlet("/selTermServlet")
public class select_item_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    request.setAttribute("mem_key", request.getParameter("mem_key"));
	    request.setAttribute("mem_name", request.getParameter("mem_name"));
	    request.setAttribute("mem_id", request.getParameter("mem_id"));
	    request.setAttribute("mem_phone", request.getParameter("mem_phone"));
	    request.setAttribute("mem_mail", request.getParameter("mem_mail"));
	    request.setAttribute("ad_uc_key", request.getParameter("ad_uc_key"));

	    if (request.getParameter("key") != null) {
	      request.setAttribute("key", 2);
	    }
	    if (request.getParameter("name") != null) {
	      request.setAttribute("name", 2);
	    }
	    if (request.getParameter("id") != null) {
	      request.setAttribute("id", 2);
	    }
	    if (request.getParameter("phone") != null) {
	      request.setAttribute("phone", 2);
	    }
	    if (request.getParameter("mail") != null) {
	      request.setAttribute("mail", 2);
	    }
	    if (request.getParameter("ad_key") != null) {
	      request.setAttribute("ad_key", 2);
	    }
	    request.getRequestDispatcher("./manage/memberMgr/member_manage.jsp").forward(request, response);


	}

}
