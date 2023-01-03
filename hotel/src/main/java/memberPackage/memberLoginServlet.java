package memberPackage;

//서블릿 페이지
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberPackage.memberRegisterMethod;

import java.util.*;
import java.sql.*;
import java.sql.Date;
import java.text.SimpleDateFormat;

@WebServlet("/memberLoginServlet")
public class memberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String MEM_ID = request.getParameter("MEM_ID");
		String MEM_PW = request.getParameter("MEM_PW");
		
		try {

			memberLoginMethod login = new memberLoginMethod();

			if (MEM_ID == null || MEM_ID.equals("") && MEM_PW == null || MEM_PW.equals("")) {

				request.getSession().setAttribute("messageType", "error!");
				request.getSession().setAttribute("messageContent", "모든 내용을 입력해주세요.");

				return;
			}
			if (login.memberLogin(MEM_ID, MEM_PW)) {
				
				request.setAttribute("MEM_ID", MEM_ID);
				request.setAttribute("MEM_PW", MEM_PW);
				request.getSession().setAttribute("messageType", "success");
				request.getSession().setAttribute("messageContent", "로그인에 성공");
				request.getRequestDispatcher("./index.jsp").forward(request, response);
				//response.sendRedirect("index.jsp");

			} else {
				request.getSession().setAttribute("messageType", "오류 메세지");
				request.getSession().setAttribute("messageContent", "로그인 실패");
				response.sendRedirect("./member/memberLoginFailProc.jsp");
			}
		}

		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
