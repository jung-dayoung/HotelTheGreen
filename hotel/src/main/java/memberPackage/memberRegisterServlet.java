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

@WebServlet("/memberRegisterServlet")
public class memberRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String MEM_NAME = request.getParameter("MEM_NAME");
		String MEM_BIRTH = request.getParameter("MEM_BIRTH");
		String MEM_ID = request.getParameter("MEM_ID");
		String MEM_PW = request.getParameter("MEM_PW");
		String MEM_PHONE = request.getParameter("MEM_PHONE");
		String MEM_MAIL = request.getParameter("MEM_MAIL");

		try {

			if (MEM_NAME == null || MEM_NAME.equals("") || MEM_BIRTH == null || MEM_BIRTH.equals("") || MEM_ID == null
					|| MEM_ID.equals("") || MEM_PW == null || MEM_PW.equals("") || MEM_PHONE == null
					|| MEM_PHONE.equals("") || MEM_MAIL == null || MEM_MAIL.equals("")) {

				request.getSession().setAttribute("messageType", "error!");
				request.getSession().setAttribute("messageContent", "모든 내용을 입력해주세요.");
				response.sendRedirect("./");
				return;
			}

			int result = new memberRegisterMethod().memberInsert(MEM_NAME, MEM_BIRTH, MEM_ID, MEM_PW, MEM_PHONE,
					MEM_MAIL);

			if (result == 1) {
				request.getSession().setAttribute("messageType", "success!");
				request.getSession().setAttribute("messageContent", "회원가입에 성공했습니다!");
				response.sendRedirect("member/member_reg_complete.jsp");
				return;

			} else {
				request.getSession().setAttribute("messageType", "오류 메세지");
				request.getSession().setAttribute("messageContent", "이미 존재하는 회원 입니다.");
				response.sendRedirect("./");
				return;
			}
		}

		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
