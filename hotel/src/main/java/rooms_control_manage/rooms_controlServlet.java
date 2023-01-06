package rooms_control_manage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/rooms_controlServlet")
public class rooms_controlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("test/html; charset=UTF-8");
		
		rooms_controlDao controlDao = new rooms_controlDao();
		
		rooms_controlBean controlBean = new rooms_controlBean();
		
		
		if(Integer.parseInt(request.getParameter("button_key")) == 1) {
			if((request.getParameter("year") != null && request.getParameter("year") != "")&&(request.getParameter("month") != null && request.getParameter("month") != "")&&
				(request.getParameter("normal") != null || request.getParameter("normal") != "")&&(request.getParameter("superial") != null || request.getParameter("superial") != "")&&
				(request.getParameter("deluxe") != null || request.getParameter("deluxe") != "")&&(request.getParameter("royal") != null || request.getParameter("royal") != "")) {
				
				controlBean.setYear(Integer.parseInt(request.getParameter("year")));
				controlBean.setMonth(Integer.parseInt(request.getParameter("month")));
				controlBean.setNormal(Integer.parseInt(request.getParameter("normal")));
				controlBean.setSuperial(Integer.parseInt(request.getParameter("superial")));
				controlBean.setDeluxe(Integer.parseInt(request.getParameter("deluxe")));
				controlBean.setRoyal(Integer.parseInt(request.getParameter("royal")));
				
				controlDao.month_select(controlBean.getYear(), controlBean.getMonth(), controlBean.getNormal());
				controlDao.month_select(controlBean.getYear(), controlBean.getMonth(), controlBean.getSuperial());
				controlDao.month_select(controlBean.getYear(), controlBean.getMonth(), controlBean.getDeluxe());
				controlDao.month_select(controlBean.getYear(), controlBean.getMonth(), controlBean.getRoyal());
			}
		} else if(Integer.parseInt(request.getParameter("button_key")) == 2) {
			if((request.getParameter("year") != null && request.getParameter("year") != "")&&(request.getParameter("month") != null && request.getParameter("month") != "")&&
					(request.getParameter("normal") != null || request.getParameter("normal") != "")&&(request.getParameter("superial") != null || request.getParameter("superial") != "")&&
					(request.getParameter("deluxe") != null || request.getParameter("deluxe") != "")&&(request.getParameter("royal") != null || request.getParameter("royal") != "")&&
					(request.getParameter("day") != null || Integer.parseInt(request.getParameter("day")) != 0)) {
				
				controlBean.setYear(Integer.parseInt(request.getParameter("year")));
				controlBean.setMonth(Integer.parseInt(request.getParameter("month")));
				controlBean.setNormal(Integer.parseInt(request.getParameter("normal")));
				controlBean.setSuperial(Integer.parseInt(request.getParameter("superial")));
				controlBean.setDeluxe(Integer.parseInt(request.getParameter("deluxe")));
				controlBean.setRoyal(Integer.parseInt(request.getParameter("royal")));
				controlBean.setDay(Integer.parseInt(request.getParameter("day")));
				
				controlDao.day_select(controlBean.getYear(), controlBean.getMonth(), controlBean.getDay(), controlBean.getNormal());
				controlDao.day_select(controlBean.getYear(), controlBean.getMonth(), controlBean.getDay(), controlBean.getSuperial());
				controlDao.day_select(controlBean.getYear(), controlBean.getMonth(), controlBean.getDay(), controlBean.getDeluxe());
				controlDao.day_select(controlBean.getYear(), controlBean.getMonth(), controlBean.getDay(), controlBean.getRoyal());
			}
		} else if(Integer.parseInt(request.getParameter("button_key")) == 3) {
			System.out.println("1");
			if((request.getParameter("RM_NUM") != null && request.getParameter("RM_NUM") != "")&&(request.getParameter("RM_USE") != null && request.getParameter("RM_USE") != "")){
				System.out.println("2");
				controlDao.room_usedate(request.getParameter("RM_USE"), request.getParameter("RM_NUM"));
			}
		} else if(Integer.parseInt(request.getParameter("button_key")) == 4) {
			System.out.println("3");
			if((request.getParameter("RM_NUM") != null && request.getParameter("RM_NUM") != "")&&(request.getParameter("RM_CLEAN") != null && request.getParameter("RM_CLEAN") != "")){
				System.out.println("4");
				controlDao.clean_update(request.getParameter("RM_NUM"), request.getParameter("RM_CLEAN"));
			}
		}
		
		
		System.out.println(controlBean.getNormal());
		System.out.println(controlBean.getSuperial());
		System.out.println(controlBean.getDeluxe());
		System.out.println(controlBean.getRoyal());
		
		
		request.getRequestDispatcher("./manage/rooms_control_manage/rooms_total_reservation_select.jsp").forward(request, response);
		
	}

}
