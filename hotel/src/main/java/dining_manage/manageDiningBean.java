package dining_manage;

public class manageDiningBean {
	
//	1번째 줄 다이닝 예약 현황
	private int breakfast;
	private int lunch;
	private int dinner;

	
	public int getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(int breakfast) {
		this.breakfast = breakfast;
	}
	public int getLunch() {
		return lunch;
	}
	public void setLunch(int lunch) {
		this.lunch = lunch;
	}
	public int getDinner() {
		return dinner;
	}
	public void setDinner(int dinner) {
		this.dinner = dinner;
	}
	
	
	//	2번째 줄 예약 내역 조회
	private String DN_RSV_DATE;
	private String restaurantTime;
	private String DN_RSV_NAME;
	private int DN_RSV_ADULT;
	private String DN_RSV_PHONE;
	private String restaurantName;
	private String RS_KEY;
	private String ML_KEY;
	
	
	
	public String getDN_RSV_DATE() {
		return DN_RSV_DATE;
	}
	public void setDN_RSV_DATE(String DN_RSV_DATE) {
		this.DN_RSV_DATE = DN_RSV_DATE;
	}
	public String getRestaurantTime() {
		return restaurantTime;
	}
	public void setRestaurantTime(String restaurantTime) {
		this.restaurantTime = restaurantTime;
	}
	public String getDN_RSV_NAME() {
		return DN_RSV_NAME;
	}
	public void setDN_RSV_NAME(String DN_RSV_NAME) {
		this.DN_RSV_NAME = DN_RSV_NAME;
	}
	public int getDN_RSV_ADULT() {
		return DN_RSV_ADULT;
	}
	public void setDN_RSV_ADULT(int DN_RSV_ADULT) {
		this.DN_RSV_ADULT = DN_RSV_ADULT;
	}
	public String getDN_RSV_PHONE() {
		return DN_RSV_PHONE;
	}
	public void setDN_RSV_PHONE(String DN_RSV_PHONE) {
		this.DN_RSV_PHONE = DN_RSV_PHONE;
	}
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
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

	
//	2번째 줄 레스토랑 그래프
	private int chinese;
	private int itylian;
	private int japanese;
	private int korean;
	private int mexican;
	private int thai;
	private int seafood;


	public int getChinese() {
		return chinese;
	}
	public void setChinese(int chinese) {
		this.chinese = chinese;
	}
	public int getItylian() {
		return itylian;
	}
	public void setItylian(int itylian) {
		this.itylian = itylian;
	}
	public int getJapanese() {
		return japanese;
	}
	public void setJapanese(int japanese) {
		this.japanese = japanese;
	}
	public int getKorean() {
		return korean;
	}
	public void setKorean(int korean) {
		this.korean = korean;
	}
	public int getMexican() {
		return mexican;
	}
	public void setMexican(int mexican) {
		this.mexican = mexican;
	}
	public int getThai() {
		return thai;
	}
	public void setThai(int thai) {
		this.thai = thai;
	}
	public int getSeafood() {
		return seafood;
	}
	public void setSeafood(int seafood) {
		this.seafood = seafood;
	}
	
	
	private String countBreakfast;
	private String countLunch;
	private String countDinner;
	private String CountMonth;


	public String getCountBreakfast() {
		return countBreakfast;
	}
	public void setCountBreakfast(String countBreakfast) {
		this.countBreakfast = countBreakfast;
	}
	public String getCountLunch() {
		return countLunch;
	}
	public void setCountLunch(String countLunch) {
		this.countLunch = countLunch;
	}
	public String getCountDinner() {
		return countDinner;
	}
	public void setCountDinner(String countDinner) {
		this.countDinner = countDinner;
	}
	public String getCountMonth() {
		return CountMonth;
	}
	public void setCountMonth(String countMonth) {
		this.CountMonth = countMonth;
	}
	
	
	
	

	
}
