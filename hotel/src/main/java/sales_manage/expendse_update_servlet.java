package sales_manage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class expendse_update_servlet
 */
@WebServlet("/expendseUpdateServlet")
public class expendse_update_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");

	    sales_function function = new sales_function();

	    String date = null;
	    String sec = null;
	    String content = null;
	    int value = 0;
	    int key = 0;
	    String start = null;
	    String end = null;
	    request.setAttribute("start", request.getParameter("start"));
	    request.setAttribute("end", request.getParameter("end"));
	    request.setAttribute("sort", request.getParameter("sort"));
	    request.setAttribute("sec", request.getParameter("sec1"));
	    int ad = 0;
	    if (request.getParameter("ud") != null && request.getParameter("ud") != "") {
	      ad = Integer.parseInt(request.getParameter("ud"));
	    }

	    if (ad == 1) {
	      key = Integer.parseInt(request.getParameter("key"));

	      function.deleteExpendse(key);

	    } else if (ad == 2) {


	      if (request.getParameter("date") != null && request.getParameter("date") != "" &&
	          request.getParameter("sec") != null && request.getParameter("sec") != "" &&
	          request.getParameter("content") != null && request.getParameter("content") != "" &&
	          request.getParameter("value") != null && request.getParameter("value") != "") {


	        date = request.getParameter("date");
	        sec = request.getParameter("sec");
	        content = request.getParameter("content");
	        value = Integer.parseInt(request.getParameter("value"));
	        key = Integer.parseInt(request.getParameter("key"));

	        function.updateExpendse(date, sec, content, value, key);

	      }
	    }
	    
	    request.getRequestDispatcher("./manage/salesMgr/expendse.jsp").forward(request, response);

	}

}
