package dining;

public class diningBean {
		
	/* 다이닝 예약 변수 */
	private String DN_RSV_DATE;
	private int DN_RSV_ADULT;
	private String DN_RSV_NAME;
	private String DN_RSV_PHONE;
	private String DN_RSV_PW;
	private String DN_RSV_PW2;
	private String restaurantName;
	private String restaurantTime;
	private String RS_KEY;
	private String ML_KEY;
	
	/* 회원 정보 변수 */
	private int MEM_KEY;
	private String MEM_ID;
	private String MEM_PHONE;
	private String MEM_NAME;
	
	/* 리뷰 변수 */

	private String RV_KEY;	
	private String DN_RSV_KEY;
	private int RV_SC_KEY;
	private String RV_CONTENTS;
	private int RV_SCORE;
	private int RV_AVG;
	
	public int getRV_AVG() {
		return RV_AVG;
	}
	public void setRV_AVG(int RV_AVG) {
		this.RV_AVG = RV_AVG;
	}
	public int getRV_SCORE() {
		return RV_SCORE;
	}
	public void setRV_SCORE(int RV_SCORE) {
		this.RV_SCORE = RV_SCORE;
	}
	
	public String getRV_KEY() {
		return RV_KEY;
	}

	public void setRV_KEY(String RV_KEY) {
		this.RV_KEY = RV_KEY;
	}

	public String getDN_RSV_KEY() {
		return DN_RSV_KEY;
	}
	public void setDN_RSV_KEY(String DN_RSV_KEY) {
		this.DN_RSV_KEY = DN_RSV_KEY;
	}
	public int getRV_SC_KEY() {
		return RV_SC_KEY;
	}
	public void setRV_SC_KEY(int RV_SC_KEY) {
		this.RV_SC_KEY = RV_SC_KEY;
	}
	public String getRV_CONTENTS() {
		return RV_CONTENTS;
	}
	public void setRV_CONTENTS(String rV_CONTENTS) {
		RV_CONTENTS = rV_CONTENTS;
	}
	public String getMEM_ID() {
		return MEM_ID;
	}
	public void setMEM_ID(String MEM_ID) {
		this.MEM_ID = MEM_ID;
	}
	public String getMEM_PHONE() {
		return MEM_PHONE;
	}
	public void setMEM_PHONE(String MEM_PHONE) {
		this.MEM_PHONE = MEM_PHONE;
	}
	public String getMEM_NAME() {
		return MEM_NAME;
	}
	public void setMEM_NAME(String MEM_PHONE) {
		this.MEM_NAME = MEM_PHONE;
	}
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	
	public String getRestaurantTime() {
		return restaurantTime;
	}
	public void setRestaurantTime(String restaurantTime) {
		this.restaurantTime = restaurantTime;
	}
	public String getDN_RSV_DATE() {
		return DN_RSV_DATE;
	}
	public void setDN_RSV_DATE(String DN_RSV_DATE) {
		this.DN_RSV_DATE = DN_RSV_DATE;
	}
	public int getDN_RSV_ADULT() {
		return DN_RSV_ADULT;
	}
	public void setDN_RSV_ADULT(int DN_RSV_ADULT) {
		this.DN_RSV_ADULT = DN_RSV_ADULT;
	}
	public String getDN_RSV_NAME() {
		return DN_RSV_NAME;
	}
	public void setDN_RSV_NAME(String DN_RSV_NAME) {
		this.DN_RSV_NAME = DN_RSV_NAME;
	}
	public String getDN_RSV_PHONE() {
		return DN_RSV_PHONE;
	}
	public void setDN_RSV_PHONE(String dN_RSV_PHONE) {
		this.DN_RSV_PHONE = dN_RSV_PHONE;
	}
	public String getDN_RSV_PW() {
		return DN_RSV_PW;
	}
	public void setDN_RSV_PW(String DN_RSV_PW) {
		this.DN_RSV_PW = DN_RSV_PW;
	}
	public String getDN_RSV_PW2() {
		return DN_RSV_PW2;
	}
	public void setDN_RSV_PW2(String DN_RSV_PW2) {
		this.DN_RSV_PW2 = DN_RSV_PW2;
	}
	public String getRS_KEY() {
		return RS_KEY;
	}
	public void setRS_KEY(String RS_KEY) {
		this.RS_KEY = RS_KEY;
	}
	public String getML_KEY() {
		return ML_KEY;
	}
	public void setML_KEY(String ML_KEY) {
		this.ML_KEY = ML_KEY;
	}
	public void setMEM_KEY(int MEM_KEY) {
		this.MEM_KEY = MEM_KEY;
	}	
	
	public int getMEM_KEY() {
		return MEM_KEY;
	}

}
