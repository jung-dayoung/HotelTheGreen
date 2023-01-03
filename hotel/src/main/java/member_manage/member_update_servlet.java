package member_manage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class member_update_servlet
 */
@WebServlet("/memberUpdateServlet")
public class member_update_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");

	    member_function function = new member_function();

	    int key;
	    request.setAttribute("mem_key", request.getParameter("mem_key"));
	    request.setAttribute("mem_name", request.getParameter("mem_name"));
	    request.setAttribute("mem_id", request.getParameter("mem_id"));
	    request.setAttribute("mem_phone", request.getParameter("mem_phone"));
	    request.setAttribute("mem_mail", request.getParameter("mem_mail"));
	    request.setAttribute("ad_uc_key", request.getParameter("ad_uc_key"));

	    if (Integer.parseInt(request.getParameter("ud")) == 1) {

	      if (request.getParameter("mem_id_u") != null && request.getParameter("mem_id_u") != "" && request.getParameter("mem_pw_u") != null && request.getParameter("mem_pw_u") != "" &&
	          request.getParameter("mem_name_u") != null && request.getParameter("mem_name_u") != "" && request.getParameter("mem_phone_u") != null && request.getParameter("mem_phone_u") != "" &&
	          request.getParameter("mem_mail_u") != null && request.getParameter("mem_mail_u") != "" && request.getParameter("mem_birth_u") != null && request.getParameter("mem_birth_u") != "" &&
	          request.getParameter("ad_uc_key_u") != null && Integer.parseInt(request.getParameter("ad_uc_key_u")) != 0) {

	        String id = request.getParameter("mem_id_u");
	        String pw = request.getParameter("mem_pw_u");
	        String name = request.getParameter("mem_name_u");
	        String phone = request.getParameter("mem_phone_u");
	        String mail = request.getParameter("mem_mail_u");
	        String birth = request.getParameter("mem_birth_u");
	        int ad_key = Integer.parseInt(request.getParameter("ad_uc_key_u"));
	        key = Integer.parseInt(request.getParameter("mem_key_u"));
	        request.setAttribute("update", "update");
	        function.updateinfo(id, pw, name, phone, mail, birth, ad_key, key);

	      } else {

	        request.setAttribute("dis", "dis");
	      }
	    } else if (Integer.parseInt(request.getParameter("ud")) == 2) {

	      request.setAttribute("delete", "delete");
	      key = Integer.parseInt(request.getParameter("mem_key_u"));
	      function.deleteinfo(key);

	    } else if (Integer.parseInt(request.getParameter("ud")) == 3) {

	      request.setAttribute("update", "update");
	      function.updatespecific(request.getParameter("mem_specific"), Integer.parseInt(request.getParameter("mem_key_u")));
	    }
	    request.getRequestDispatcher("./manage/member_manage/member_manage.jsp").forward(request, response);
	}

}
