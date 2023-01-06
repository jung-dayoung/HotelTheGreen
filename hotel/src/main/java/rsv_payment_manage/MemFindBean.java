package rsv_payment_manage;
import java.sql.*;

public class MemFindBean {
	private	String MEM_NAME = "";
	private String MEM_PHONE = "";
	private int MEM_KEY = 0;
	private String RM_RSV_CHK_IN = "";
	private String RM_RSV_CHK_OUT = "";
	private int RM_RSV_NUM = 0;
	private int RM_RSV_ADULT = 0;
	private String RM_RSV_NAME = "";
	private String RM_RSV_EMAIL	= "";
	private String RM_RSV_PHONE	= "";
	private String RM_RSV_PW = "";
	private String RM_RSV_USE = "";
	private String RM_RSV_CONTENT = "";
	private int RM_KEY = 0;
	private int AD_UC_KEY = 0;
	private String RM_RSV_PRI = "";
	private String RM_CLS = "";
	private String PAYMENT = "";
	private String PAY_BASHO = "";
	private String PAY_DATE = "";
	private String POINT_USE = "";
	private int POINT_VALUE = 0;
	private int POINT_VALUE_USE = 0;
	
	public int getPOINT_VALUE_USE() {
		return POINT_VALUE_USE;
	}
	public void setPOINT_VALUE_USE(int POINT_VALUE_USE) {
		this.POINT_VALUE_USE = POINT_VALUE_USE;
	}
	
	
	public int getPOINT_VALUE() {
		return POINT_VALUE;
	}
	public void setPOINT_VALUE(int POINT_VALUE) {
		this.POINT_VALUE = POINT_VALUE;
	}
	
	
	public String getPOINT_USE() {
		return POINT_USE;
	}
	public void setPOINT_USE(String POINT_USE) {
		this.POINT_USE = POINT_USE;
	}
	
	
	public String getPAYMENT() {
		return PAYMENT;
	}
	public void setPAYMENT(String PAYMENT) {
		this.PAYMENT = PAYMENT;
	}
	
	
	public String getPAY_BASHO() {
		return PAY_BASHO;
	}
	public void setPAY_BASHO(String PAY_BASHO) {
		this.PAY_BASHO = PAY_BASHO;
	}
	
	public String getPAY_DATE() {
		return PAY_DATE;
	}
	public void setPAY_DATE(String PAY_DATE) {
		this.PAY_DATE = PAY_DATE;
	}
	


	
	public String getRM_CLS() {
		return RM_CLS;
	}
	public void setRM_CLS(String RM_CLS) {
		this.RM_CLS = RM_CLS;
	}
	
	public String getRM_RSV_PRI() {
		return RM_RSV_PRI;
	}
	public void setRM_RSV_PRI(String RM_RSV_PRI) {
		this.RM_RSV_PRI = RM_RSV_PRI;
	}
	
	public String getMEM_NAME() {
		return MEM_NAME;
	}
	public void setMEM_NAME(String MEM_NAME) {
		this.MEM_NAME = MEM_NAME;
	}
	public String getMEM_PHONE() {
		return MEM_PHONE;
	}
	public void setMEM_PHONE(String MEM_PHONE) {
		this.MEM_PHONE = MEM_PHONE;
	}
	public int getMEM_KEY() {
		return MEM_KEY;
	}
	public void setMEM_KEY(int MEM_KEY) {
		this.MEM_KEY = MEM_KEY;
	}
	public String getRM_RSV_CHK_IN() {
		return RM_RSV_CHK_IN;
	}
	public void setRM_RSV_CHK_IN(String RM_RSV_CHK_IN) {
		this.RM_RSV_CHK_IN = RM_RSV_CHK_IN;
	}
	public String getRM_RSV_CHK_OUT() {
		return RM_RSV_CHK_OUT;
	}
	public void setRM_RSV_CHK_OUT(String RM_RSV_CHK_OUT) {
		this.RM_RSV_CHK_OUT = RM_RSV_CHK_OUT;
	}
	public int getRM_RSV_NUM() {
		return RM_RSV_NUM;
	}
	public void setRM_RSV_NUM(int RM_RSV_NUM) {
		this.RM_RSV_NUM = RM_RSV_NUM;
	}
	public int getRM_RSV_ADULT() {
		return RM_RSV_ADULT;
	}
	public void setRM_RSV_ADULT(int RM_RSV_ADULT) {
		this.RM_RSV_ADULT = RM_RSV_ADULT;
	}
	public String getRM_RSV_NAME() {
		return RM_RSV_NAME;
	}
	public void setRM_RSV_NAME(String RM_RSV_NAME) {
		this.RM_RSV_NAME = RM_RSV_NAME;
	}
	public String getRM_RSV_EMAIL() {
		return RM_RSV_EMAIL;
	}
	public void setRM_RSV_EMAIL(String RM_RSV_EMAIL) {
		this.RM_RSV_EMAIL = RM_RSV_EMAIL;
	}
	public String getRM_RSV_PHONE() {
		return RM_RSV_PHONE;
	}
	public void setRM_RSV_PHONE(String RM_RSV_PHONE) {
		this.RM_RSV_PHONE = RM_RSV_PHONE;
	}
	public String getRM_RSV_PW() {
		return RM_RSV_PW;
	}
	public void setRM_RSV_PW(String RM_RSV_PW) {
		this.RM_RSV_PW = RM_RSV_PW;
	}
	public String getRM_RSV_USE() {
		return RM_RSV_USE;
	}
	public void setRM_RSV_USE(String RM_RSV_USE) {
		this.RM_RSV_USE = RM_RSV_USE;
	}
	public String getRM_RSV_CONTENT() {
		return RM_RSV_CONTENT;
	}
	public void setRM_RSV_CONTENT(String RM_RSV_CONTENT) {
		this.RM_RSV_CONTENT = RM_RSV_CONTENT;
	}
	public int getRM_KEY() {
		return RM_KEY;
	}
	public void setRM_KEY(int RM_KEY) {
		this.RM_KEY = RM_KEY;
	}
	public int getAD_UC_KEY() {
		return AD_UC_KEY;
	}
	public void setAD_UC_KEY(int AD_UC_KEY) {
		this.AD_UC_KEY = AD_UC_KEY;
	}

}
