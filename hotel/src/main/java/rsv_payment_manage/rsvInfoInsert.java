package rsv_payment_manage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/rsvinfoinsert")
public class rsvInfoInsert extends HttpServlet {
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

		// 이 서블렛은 현장 예약을 하는 서블렛입니다.

		rsvBean.setRM_RSV_CHK_IN(request.getParameter("RM_RSV_CHK_IN"));
		rsvBean.setRM_RSV_CHK_OUT(request.getParameter("RM_RSV_CHK_OUT"));
		rsvBean.setRM_RSV_NUM(Integer.parseInt(request.getParameter("RM_RSV_NUM")));
		rsvBean.setRM_RSV_ADULT(Integer.parseInt(request.getParameter("RM_RSV_ADULT")));
		rsvBean.setRM_RSV_NAME(request.getParameter("MEM_NAME"));
		rsvBean.setRM_RSV_EMAIL(request.getParameter("MEM_EMAIL"));
		rsvBean.setRM_RSV_PHONE(request.getParameter("MEM_PHONE"));
		rsvBean.setRM_RSV_PW(request.getParameter("MEM_PW"));
		rsvBean.setRM_RSV_USE("이용 예정");
		
		rsvBean.setRM_RSV_CONTENT(request.getParameter("rm_rsv_content"));
		rsvBean.setMEM_KEY(Integer.parseInt(request.getParameter("MEM_KEY")));
		rsvBean.setAD_UC_KEY(Integer.parseInt(request.getParameter("ad_uc_key")));
		rsvBean.setRM_CLS(request.getParameter("RM_CLS"));
		

		if (rsvBean.getRM_RSV_PW() != null && rsvBean.getRM_RSV_PW() != "") {
			if ((rsvBean.getRM_RSV_NAME() != null || rsvBean.getRM_RSV_NAME() == "")
					&& (rsvBean.getRM_RSV_PHONE() != null || rsvBean.getRM_RSV_PHONE() == "")) {
				for (int i = 0; i < rsvBean.getRM_RSV_NUM(); i++) {
					rsvBean.setRM_KEY(room.roomSelect(rsvBean.getRM_RSV_CHK_IN(), rsvBean.getRM_RSV_CHK_OUT(),
							rsvBean.getRM_CLS()));
					
					rsvBean.setRM_RSV_PRI(rsvBean.getRM_RSV_CHK_IN() + room.roomSelect(rsvBean.getRM_RSV_CHK_IN(),
							rsvBean.getRM_RSV_CHK_OUT(), rsvBean.getRM_CLS()));
					
					room.RSV_info_insert_nomember(rsvBean.getRM_RSV_CHK_IN(), rsvBean.getRM_RSV_CHK_OUT(),
							rsvBean.getRM_RSV_NUM(), rsvBean.getRM_RSV_ADULT(), rsvBean.getRM_RSV_NAME(),
							rsvBean.getRM_RSV_PHONE(), rsvBean.getRM_RSV_EMAIL(), rsvBean.getRM_RSV_PW(),
							rsvBean.getRM_RSV_USE(), rsvBean.getRM_RSV_CONTENT(), rsvBean.getRM_RSV_PRI(),
							rsvBean.getRM_KEY(), rsvBean.getAD_UC_KEY());
				}
				request.setAttribute("MEM_BBB", "abc");
				request.setAttribute("name", rsvBean.getRM_RSV_NAME());
				request.setAttribute("phone", rsvBean.getRM_RSV_PHONE());
				request.setAttribute("pwd", rsvBean.getRM_RSV_PW());
				request.setAttribute("rmNum", rsvBean.getRM_RSV_NUM());

				request.getRequestDispatcher("./manage/rsv_payment_manage/datatest.jsp").forward(request, response);
				// request.getSession().setAttribute("messageContent", "예약 완료");
				// response.sendRedirect("./rsvComplete.jsp");

			} else {

				request.getSession().setAttribute("messageType", "예약 실패");
				request.getSession().setAttribute("messageContent", "예약 정보가 다 입력되지 않았습니다.");
				response.sendRedirect("/datatest.jsp");

			}
		} else if (rsvBean.getMEM_KEY() != 0) {

			if ((rsvBean.getRM_RSV_NAME() != null || rsvBean.getRM_RSV_NAME() == "")
					&& (rsvBean.getRM_RSV_PHONE() != null || rsvBean.getRM_RSV_PHONE() == "")) {
				for (int i = 0; i < rsvBean.getRM_RSV_NUM(); i++) {
					rsvBean.setRM_KEY(room.roomSelect(rsvBean.getRM_RSV_CHK_IN(), rsvBean.getRM_RSV_CHK_OUT(),
							rsvBean.getRM_CLS()));
					
					rsvBean.setRM_RSV_PRI(rsvBean.getRM_RSV_CHK_IN() + room.roomSelect(rsvBean.getRM_RSV_CHK_IN(),
							rsvBean.getRM_RSV_CHK_OUT(), rsvBean.getRM_CLS()));
					
					room.RSV_info_insert_member(rsvBean.getRM_RSV_CHK_IN(), rsvBean.getRM_RSV_CHK_OUT(),
							rsvBean.getRM_RSV_NUM(), rsvBean.getRM_RSV_ADULT(), rsvBean.getRM_RSV_NAME(),
							rsvBean.getRM_RSV_PHONE(), rsvBean.getRM_RSV_EMAIL(), rsvBean.getRM_RSV_USE(),
							rsvBean.getRM_RSV_CONTENT(), rsvBean.getRM_RSV_PRI(), rsvBean.getRM_KEY(),
							rsvBean.getMEM_KEY(), rsvBean.getAD_UC_KEY());

				}
				request.setAttribute("MEM_AAA", "abc");
				request.setAttribute("name", rsvBean.getRM_RSV_NAME());
				request.setAttribute("phone", rsvBean.getRM_RSV_PHONE());
				request.getRequestDispatcher("./manage/rsv_payment_manage/datatest.jsp").forward(request, response);

				// request.getSession().setAttribute("messageContent", "예약 완료");
				// response.sendRedirect("./rsvComplete.jsp");

			} else {
				request.getSession().setAttribute("messageType", "예약 실패");
				request.getSession().setAttribute("messageContent", "예약 정보가 다 입력되지 않았습니다.");
				response.sendRedirect("/datatest.jsp");
			}
		}
	}

}
