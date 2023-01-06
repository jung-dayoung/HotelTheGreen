package rsv_payment_manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/paymentServlet")
public class paymentServlet extends HttpServlet {
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

		
		//이 페이지는 예약자 결제 조회에 대한 서블릿입니다.
		
		rsvBean.setMEM_NAME(request.getParameter("MEM_NAME"));
		rsvBean.setMEM_PHONE(request.getParameter("MEM_PHONE"));
		rsvBean.setMEM_KEY(Integer.parseInt(request.getParameter("MEM_KEY")));
		rsvBean.setPAY_DATE(request.getParameter("SL_DATE"));
		rsvBean.setPAY_BASHO(request.getParameter("SL_RSV_SEC"));
		rsvBean.setPAYMENT(request.getParameter("SL_MT_SEC"));

		if (rsvBean.getMEM_NAME() != null && rsvBean.getPAY_DATE() == null) {
			room.pointData(rsvBean.getMEM_KEY());

			request.setAttribute("MEM_CCC", "abc");
			request.setAttribute("memName", rsvBean.getMEM_NAME());
			request.setAttribute("memPhone", rsvBean.getMEM_PHONE());
			request.setAttribute("memKey", rsvBean.getMEM_KEY());

			request.getRequestDispatcher("./manage/rsv_payment_manage/paymentPage.jsp").forward(request, response);
			// request.getSession().setAttribute("messageContent", "예약 완료");
			// response.sendRedirect("./rsvComplete.jsp");
		}
	}
}