package rsv_payment_manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/testSerVlet")
public class forTestServlet extends HttpServlet {
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

		
		//이 서블렛은 예약 가능한 룸이 있는지 확인하는 서블렛입니다.
		
		
		rsvBean.setRM_RSV_CHK_IN(request.getParameter("RM_RSV_CHK_IN"));
		rsvBean.setRM_RSV_CHK_OUT(request.getParameter("RM_RSV_CHK_OUT"));
		rsvBean.setRM_RSV_NUM(Integer.parseInt(request.getParameter("RM_RSV_NUM")));
		rsvBean.setRM_CLS(request.getParameter("RM_CLS"));

		if (rsvBean.getRM_RSV_CHK_IN() != null && rsvBean.getRM_RSV_CHK_IN() != "") {
			room.roomSpareCheck(rsvBean.getRM_RSV_CHK_IN(), rsvBean.getRM_RSV_CHK_OUT(), rsvBean.getRM_CLS(),
					rsvBean.getRM_RSV_NUM());

			request.setAttribute("chkIn", rsvBean.getRM_RSV_CHK_IN());
			request.setAttribute("chkOut", rsvBean.getRM_RSV_CHK_OUT());
			request.setAttribute("rmNum", rsvBean.getRM_RSV_NUM());
			request.setAttribute("rmCls", rsvBean.getRM_CLS());

			request.getRequestDispatcher("./manage/rsv_payment_manage/datatest.jsp").forward(request, response);
			// request.getSession().setAttribute("messageContent", "예약 완료");
			// response.sendRedirect("./rsvComplete.jsp");

		}
	}
}