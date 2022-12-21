package mypage;

//counsel 자바 빈즈 파일
import java.sql.*;

public class hamBeanCounsel{
	
	private Date CS_DATE;
	private String CS_TITLE = "";
	private String CS_CONTENTS;
	private String CC_SEC = "";
	private String AD_ANSWER = "";

	public Date getCS_DATE() {
		return CS_DATE;
	}
	public void setCS_DATE(Date CS_DATE) {
		this.CS_DATE = CS_DATE;
	}
	public String getCS_TITLE() {
		return CS_TITLE;
	}
	public void setCS_TITLE(String CS_TITLE) {
		this.CS_TITLE = CS_TITLE;
	}
	public String getCS_CONTENTS() {
		return CS_CONTENTS;
	}
	public void setCS_CONTENTS(String CS_CONTENTS) {
		this.CS_CONTENTS = CS_CONTENTS;
	}
	public String getCC_SEC() {
		return CC_SEC;
	}
	public void setCC_SEC(String CC_SEC) {
		this.CC_SEC = CC_SEC;
	}
	public String getAD_ANSWER() {
		return AD_ANSWER;
	}
	public void setAD_ANSWER(String AD_ANSWER) {
		this.AD_ANSWER = AD_ANSWER;
	}
	
	
}

