package rsv_payment_manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/answerServlet")
public class answerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		System.out.println("도착");

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		memberAnsidMothod room = new memberAnsidMothod();

		MemFindBean rsvBean = new MemFindBean();

		
		//이 서블렛은 회원의 멤버 키를 찾는 서블렛입니다.
		
		rsvBean.setMEM_NAME(request.getParameter("MEM_NAME"));
		rsvBean.setMEM_PHONE(request.getParameter("MEM_PHONE"));

		if (rsvBean.getMEM_NAME() != null && rsvBean.getMEM_PHONE() != "") {
			room.key(rsvBean.getMEM_NAME(), rsvBean.getMEM_PHONE());

			request.setAttribute("MEM_DDD", "abc");
			request.setAttribute("memName", rsvBean.getMEM_NAME());
			request.setAttribute("memPhone", rsvBean.getMEM_PHONE());
	

			request.getRequestDispatcher("./manage/rsv_payment_manage/datatest.jsp").forward(request, response);
			// request.getSession().setAttribute("messageContent", "예약 완료");
			// response.sendRedirect("./rsvComplete.jsp");

		}
		
	}
}