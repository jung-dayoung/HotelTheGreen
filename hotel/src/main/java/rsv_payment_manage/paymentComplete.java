package rsv_payment_manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/paymentCompleteServlet")
public class paymentComplete extends HttpServlet {
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

		
		//이 페이지는 결제에 대한 서블렛입니다.
		
		rsvBean.setMEM_NAME(request.getParameter("MEM_NAME"));
		rsvBean.setMEM_PHONE(request.getParameter("MEM_PHONE"));
		rsvBean.setMEM_KEY(Integer.parseInt(request.getParameter("MEM_KEY")));
		rsvBean.setPOINT_USE(request.getParameter("POINT_USE"));
		rsvBean.setPAY_DATE(request.getParameter("SL_DATE"));
		rsvBean.setPAY_BASHO(request.getParameter("SL_RSV_SEC"));
		rsvBean.setPAYMENT(request.getParameter("SL_MT_SEC"));
		rsvBean.setPOINT_VALUE(Integer.parseInt(request.getParameter("SAVE_POINT")));
	
		rsvBean.setPOINT_VALUE_USE(Integer.parseInt(request.getParameter("USE_POINT")));
		
		
		if (rsvBean.getMEM_NAME() != null && rsvBean.getPAY_DATE() != null &&
			rsvBean.getPOINT_USE().equals("적립")) {
			room.insert_point(rsvBean.getPAY_DATE(), rsvBean.getPOINT_USE(),
							  rsvBean.getPOINT_VALUE(), rsvBean.getMEM_KEY(),
							  room.memberFindid(rsvBean.getMEM_NAME(), rsvBean.getMEM_PHONE()));

			room.insert_sales(rsvBean.getPAY_DATE(), rsvBean.getPAY_BASHO(), rsvBean.getPAYMENT(),
							  room.memberFindid(rsvBean.getMEM_NAME(), rsvBean.getMEM_PHONE()),
							  room.findPlKey(rsvBean.getMEM_KEY()));
			
			room.rsv_using(room.findRm_Rsv_Key(rsvBean.getMEM_NAME(),
						   rsvBean.getMEM_PHONE(),
						   room.findRoom(rsvBean.getMEM_NAME(),rsvBean.getMEM_PHONE()),
						   "이용 예정"));
			
			room.room_using(room.findRoom(rsvBean.getMEM_NAME(), rsvBean.getMEM_PHONE()));
			
			request.setAttribute("MEM_EEE", "abc");
			request.setAttribute("GARA1", "asd");
			request.setAttribute("payName", rsvBean.getMEM_NAME());
			request.setAttribute("payPhone", rsvBean.getMEM_PHONE());
			request.getRequestDispatcher("./manage/rsv_payment_manage/paymentPage.jsp").forward(request, response);
			// request.getSession().setAttribute("messageContent", "예약 완료");
			// response.sendRedirect("./rsvComplete.jsp");
	
		} else {
			request.setAttribute("dragon", room.sumPoint(Integer.parseInt(request.getParameter("MEM_KEY"))));
			room.insert_point(rsvBean.getPAY_DATE(), rsvBean.getPOINT_USE(),
							  rsvBean.getPOINT_VALUE_USE(), rsvBean.getMEM_KEY(),
							  room.memberFindid(rsvBean.getMEM_NAME(), rsvBean.getMEM_PHONE()));
			
			room.insert_sales(rsvBean.getPAY_DATE(), rsvBean.getPAY_BASHO(), rsvBean.getPAYMENT(),
					  room.memberFindid(rsvBean.getMEM_NAME(), rsvBean.getMEM_PHONE()),
					  room.findPlKey(rsvBean.getMEM_KEY()));
			
			room.rsv_using(room.findRm_Rsv_Key(rsvBean.getMEM_NAME(),
						   rsvBean.getMEM_PHONE(),
						   room.findRoom(rsvBean.getMEM_NAME(),rsvBean.getMEM_PHONE()),
						   "이용 예정"));
			
			room.room_using(room.findRoom(rsvBean.getMEM_NAME(), rsvBean.getMEM_PHONE()));
			
			request.setAttribute("MEM_FFF", "abc");
			request.setAttribute("GARA2", "qwe");
			request.setAttribute("payName", rsvBean.getMEM_NAME());
			request.setAttribute("payPhone", rsvBean.getMEM_PHONE());
			
			request.getRequestDispatcher("./manage/rsv_payment_manage/paymentPage.jsp").forward(request, response);
		}
	}
}