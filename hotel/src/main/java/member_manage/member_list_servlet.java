package member_manage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class member_list_servlet
 */
@WebServlet("/memberListServlet")
public class member_list_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");

	    if (request.getParameter("mem_key") != null && request.getParameter("mem_key") != "") {
	      request.setAttribute("mem_key", request.getParameter("mem_key"));
	    }
	    if (request.getParameter("mem_name") != null && request.getParameter("mem_name") != "") {
	      request.setAttribute("mem_name", request.getParameter("mem_name"));
	    }
	    if (request.getParameter("mem_id") != null && request.getParameter("mem_id") != "") {
	      request.setAttribute("mem_id", request.getParameter("mem_id"));
	    }
	    if (request.getParameter("mem_phone") != null && request.getParameter("mem_phone") != "") {
	      request.setAttribute("mem_phone", request.getParameter("mem_phone"));
	    }
	    if (request.getParameter("mem_mail") != null && request.getParameter("mem_mail") != "") {
	      request.setAttribute("mem_mail", request.getParameter("mem_mail"));
	    }
	    if (request.getParameter("ad_uc_key") != null && request.getParameter("ad_uc_key") != "") {
	      request.setAttribute("ad_uc_key", request.getParameter("ad_uc_key"));
	    }
	    if ((request.getParameter("mem_key") == null || request.getParameter("mem_key") == "") && (request.getParameter("mem_name") == null || request.getParameter("mem_name") == "") &&
	        (request.getParameter("mem_id") == null || request.getParameter("mem_id") == "") && (request.getParameter("mem_phone") == null || request.getParameter("mem_phone") == "") &&
	        (request.getParameter("mem_mail") == null || request.getParameter("mem_mail") == "") && (request.getParameter("ad_key") == null || request.getParameter("ad_key") == "")) {
	      request.setAttribute("dis", "dis");
	    }
	    request.getRequestDispatcher("./manage/member_manage/member_manage.jsp").forward(request, response);

	}

}
