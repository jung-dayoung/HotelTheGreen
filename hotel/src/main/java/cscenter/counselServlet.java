package cscenter;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class counselServlet
 */
@WebServlet("/counselServlet")
public class counselServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int MEM_KEY = Integer.parseInt(request.getParameter("MEM_KEY"));
		int CC_KEY = Integer.parseInt(request.getParameter("CC_KEY"));
		int CR_KEY = Integer.parseInt(request.getParameter("CR_KEY"));
		String CS_EMAIL = request.getParameter("CS_EMAIL");
		String CS_TITLE = request.getParameter("CS_TITLE");
		String CS_CONTENTS = request.getParameter("CS_CONTENTS");
		String CS_DATE = request.getParameter("CS_DATE");
		
		if(CS_EMAIL==null||CS_EMAIL.equals("")||CS_TITLE==null||CS_TITLE.equals("")||CS_CONTENTS==null||CS_CONTENTS.equals("")||CS_DATE==null||CS_DATE.equals("")) {
			
			request.getSession().setAttribute("messageType", "Error");
			request.getSession().setAttribute("messageContent", "모든 내용을 입력해주세요.");
			
			response.sendRedirect("./cscenter/cscenter_counsel.jsp");
			return;
		}
		//memberDao 의 insert 메서드 실행.
		int result = new counsel().insertMessage(MEM_KEY, CC_KEY, CR_KEY, CS_EMAIL, CS_TITLE, CS_CONTENTS, CS_DATE);
		
		if(result == 1) {
			request.getSession().setAttribute("messageType", "success!");
			request.getSession().setAttribute("messageContent", "Submit.");
			response.sendRedirect("./mypage/my_counsel.jsp");
			return;
			
		}
		else {
			request.getSession().setAttribute("messageType", "오류 메세지");
			request.getSession().setAttribute("messageContent", "Submit Error");
			response.sendRedirect("./cecenter/cscenter_counsel.jsp");
			return;
		}
	}
	
		
	}
