package memberPackage;

//서블릿 페이지
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import memberPackage.memberFindidMethod;
import java.util.*;
import java.sql.*;

@WebServlet("/memberFindidServlet")
public class memberFindidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String MEM_NAME = request.getParameter("MEM_NAME");
		String MEM_PHONE = request.getParameter("MEM_PHONE");

		try {

			memberFindidMethod findid = new memberFindidMethod();

			if (MEM_NAME == null || MEM_NAME.equals("") && MEM_PHONE == null || MEM_PHONE.equals("")) {

				request.getSession().setAttribute("messageType", "error!");
				request.getSession().setAttribute("messageContent", "모든 내용을 입력해주세요.");

				return;
			}
			if (findid.memberFindid(MEM_NAME, MEM_PHONE)) {

				request.getSession().setAttribute("messageType", "success!");
				request.getSession().setAttribute("messageContent", "아이디 찾기 성공!");
				response.sendRedirect("./member/member_ansid.jsp");

			} else {
				request.getSession().setAttribute("messageType", "오류 메세지");
				request.getSession().setAttribute("messageContent", "로그인 실패");

			}
		}

		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
