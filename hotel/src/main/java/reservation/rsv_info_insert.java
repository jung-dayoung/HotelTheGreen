package reservation;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

@WebServlet("/rsv_info_insert")
public class rsv_info_insert extends HttpServlet {
  private static final long serialVersionUID = 1L;
  
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	HttpSession session = request.getSession();
	
	System.out.println("도착");
	
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    room room = new room();

    roomReservationBean rsvBean = new roomReservationBean();
    
    rsvBean.setRM_RSV_CHK_IN(request.getParameter("rm_rsv_chk_in"));
    rsvBean.setRM_RSV_CHK_OUT(request.getParameter("rm_rsv_chk_out"));
    rsvBean.setRM_RSV_NUM(Integer.parseInt(request.getParameter("rm_rsv_num")));
    rsvBean.setRM_RSV_ADULT(Integer.parseInt(request.getParameter("rm_rsv_adult")));
    rsvBean.setRM_RSV_NAME(request.getParameter("rm_rsv_name"));
    rsvBean.setRM_RSV_EMAIL(request.getParameter("rm_rsv_mail"));
    rsvBean.setRM_RSV_PHONE(request.getParameter("rm_rsv_phone"));
    rsvBean.setRM_RSV_PW(request.getParameter("rm_rsv_pw"));
    rsvBean.setRM_RSV_USE("이용 예정");
    rsvBean.setRM_RSV_CONTENT(request.getParameter("rm_rsv_content"));
    rsvBean.setMEM_KEY(Integer.parseInt(request.getParameter("mem_key")));
    rsvBean.setAD_UC_KEY(Integer.parseInt(request.getParameter("ad_uc_key")));
    String rm_cls = request.getParameter("rm_cls");
    String rm_rsv_pri = request.getParameter("rm_rsv_pri");
    
    if (rsvBean.getRM_RSV_PW() != null && rsvBean.getRM_RSV_PW() != "") {
    	
      if ((rsvBean.getRM_RSV_NAME() != null || rsvBean.getRM_RSV_NAME() == "")
          && (rsvBean.getRM_RSV_PHONE() != null || rsvBean.getRM_RSV_PHONE() == "")
          && (rsvBean.getRM_RSV_EMAIL() != null || rsvBean.getRM_RSV_EMAIL() == "")) {
    	  for (int i = 0; i < rsvBean.getRM_RSV_NUM(); i++) {
    		rsvBean.setRM_KEY(room.roomSelect(rsvBean.getRM_RSV_CHK_IN(), rsvBean.getRM_RSV_CHK_OUT(), rm_cls));
    		
    		room.RSV_info_insert_nomember(rsvBean.getRM_RSV_CHK_IN(),
            rsvBean.getRM_RSV_CHK_OUT(), rsvBean.getRM_RSV_NUM(), rsvBean.getRM_RSV_ADULT(),
            rsvBean.getRM_RSV_NAME(), rsvBean.getRM_RSV_PHONE(), rsvBean.getRM_RSV_EMAIL(),
            rsvBean.getRM_RSV_PW(), rsvBean.getRM_RSV_USE(), rsvBean.getRM_RSV_CONTENT(), rm_rsv_pri, 
            rsvBean.getRM_KEY(), rsvBean.getAD_UC_KEY());
    	  }
		session.setAttribute("phone", rsvBean.getRM_RSV_PHONE());
		session.setAttribute("pwd", rsvBean.getRM_RSV_PW());
		
        request.getSession().setAttribute("messageContent", "예약 완료");
        response.sendRedirect("./reservation_check_nomember/room_reservation_check_plan_nomember.jsp");
        
      } else {
    	  
        request.getSession().setAttribute("messageType", "예약 실패");
        request.getSession().setAttribute("messageContent", "예약 정보가 다 입력되지 않았습니다.");
        response.sendRedirect("/rooms_reservation3_member.jsp");
        
      }
    } else if (rsvBean.getMEM_KEY() != 0) {
    	
      if ((rsvBean.getRM_RSV_NAME() != null || rsvBean.getRM_RSV_NAME() == "")
          && (rsvBean.getRM_RSV_PHONE() != null || rsvBean.getRM_RSV_PHONE() == "")
          && (rsvBean.getRM_RSV_EMAIL() != null || rsvBean.getRM_RSV_EMAIL() == "")) {
    	  for (int i = 0; i < rsvBean.getRM_RSV_NUM(); i++) {
    		rsvBean.setRM_KEY(room.roomSelect(rsvBean.getRM_RSV_CHK_IN(), rsvBean.getRM_RSV_CHK_OUT(), rm_cls));

    	  
    		room.RSV_info_insert_member(rsvBean.getRM_RSV_CHK_IN(),
            rsvBean.getRM_RSV_CHK_OUT(), rsvBean.getRM_RSV_NUM(), rsvBean.getRM_RSV_ADULT(),
            rsvBean.getRM_RSV_NAME(), rsvBean.getRM_RSV_PHONE(), rsvBean.getRM_RSV_EMAIL(),
            rsvBean.getRM_RSV_USE(), rsvBean.getRM_RSV_CONTENT(), rm_rsv_pri, rsvBean.getRM_KEY(),
            rsvBean.getMEM_KEY(), rsvBean.getAD_UC_KEY());
    	  }

        request.getSession().setAttribute("messageContent", "예약 완료");
        response.sendRedirect("./mypage/room_reservation_check_plan_member.jsp");
        
      } else {
        request.getSession().setAttribute("messageType", "예약 실패");
        request.getSession().setAttribute("messageContent", "예약 정보가 다 입력되지 않았습니다.");
        response.sendRedirect("/rooms_reservation3_member.jsp");
      }
    } else {
    	request.setAttribute("mis", "a");
        //request.getSession().setAttribute("messageType", "예약 실패");
        //request.getSession().setAttribute("messageContent", "예약 정보가 다 입력되지 않았습니다.");
        //response.sendRedirect("./room/rooms_reservation3_member.jsp");
        request.getRequestDispatcher("./room/rooms_reservation3_member.jsp").forward(request, response);

    }
  }
}