package sales_manage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * Servlet implementation class date_select_servlet
 */
@WebServlet("/duaDisServlet")
public class date_select_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      request.setCharacterEncoding("UTF-8");
	      response.setContentType("text/html; charset=UTF-8");

	    sales_function function = new sales_function();

	    SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");

	    if (request.getParameter("start") == null || request.getParameter("start") == "" ||
	    request.getParameter("end") == null || request.getParameter("end") == ""){

	      request.setAttribute("start", request.getParameter("start"));
	      request.setAttribute("end", request.getParameter("end"));
	      request.setAttribute("year", Integer.parseInt(request.getParameter("year")));
	      request.setAttribute("month", Integer.parseInt(request.getParameter("month")));
	      request.setAttribute("mis", "mis");
	      request.getRequestDispatcher("./manage/salesMgr/sales.jsp").forward(request, response);
	    }

	    try {

	      Date date1 = format.parse(request.getParameter("start"));
	      Date date2 = format.parse(request.getParameter("end"));

	      if (date1.compareTo(date2) < 0 || date1.compareTo(date2) == 0) {

	        request.setAttribute("start", request.getParameter("start"));
	        request.setAttribute("end", request.getParameter("end"));
	        request.setAttribute("year", Integer.parseInt(request.getParameter("year")));
	        request.setAttribute("month", Integer.parseInt(request.getParameter("month")));


	      } else {

	        request.setAttribute("start", request.getParameter("start"));
	        request.setAttribute("end", request.getParameter("end"));
	        request.setAttribute("year", Integer.parseInt(request.getParameter("year")));
	        request.setAttribute("month", Integer.parseInt(request.getParameter("month")));
	        request.setAttribute("mis", "mis");

	      }

	      request.getRequestDispatcher("./manage/salesMgr/sales.jsp").forward(request, response);

	    } catch (Exception e) {
	      System.out.println(e);
	    }
	}

}
