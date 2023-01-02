package memberPackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/memberIdCheckServlet")
public class memberIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		memberRegisterBean bean = new memberRegisterBean();
		
		bean.setMEM_ID(request.getParameter("MEM_ID"));
		
		int result = new memberIdCheckMgr().checkId(request.getParameter(bean.getMEM_ID()));
		
	
		
		
		
		if(result == 1) {
			request.getSession().setAttribute("messageType", "성공");
			request.getSession().setAttribute("messageContent", "Success");			
			response.sendRedirect("./memberLogin.jsp");	
			return;
		}else {
			request.getSession().setAttribute("messageType", "오류 메세지");
			request.getSession().setAttribute("messageContent", "Submit Error");
			response.sendRedirect("./memberRegister.jsp");
			return;
		}
	}
}
