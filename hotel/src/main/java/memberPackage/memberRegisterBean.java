package memberPackage;

import java.sql.*;

public class memberRegisterBean {

	private String MEM_NAME = "";
	private String MEM_BIRTH = "";
	private String MEM_ID = "";
	private String MEM_PW = "";
	private String MEM_PHONE = "";
	private String MEM_MAIL = "";
	private int AD_UC_KEY = 0;

	public int getAD_UC_KEY() {
		return AD_UC_KEY;
	}

	public void setAD_UC_KEY(int AD_UC_KEY) {
		this.AD_UC_KEY = AD_UC_KEY;
	}

	public String getMEM_NAME() {
		return MEM_NAME;
	}

	public void setMEM_NAME(String MEM_NAME) {
		this.MEM_NAME = MEM_NAME;
	}

	public String getMEM_BIRTH() {
		return MEM_BIRTH;
	}

	public void setMEM_BIRTH(String MEM_BIRTH) {
		this.MEM_BIRTH = MEM_BIRTH;
	}

	public String getMEM_ID() {
		return MEM_ID;
	}

	public void setMEM_ID(String MEM_ID) {
		this.MEM_ID = MEM_ID;
	}

	public String getMEM_PW() {
		return MEM_PW;
	}

	public void setMEM_PW(String MEM_PW) {
		this.MEM_PW = MEM_PW;
	}

	public String getMEM_PHONE() {
		return MEM_PHONE;
	}

	public void setMEM_PHONE(String MEM_PHONE) {
		this.MEM_PHONE = MEM_PHONE;
	}

	public String getMEM_MAIL() {
		return MEM_MAIL;
	}

	public void setMEM_MAIL(String MEM_MAIL) {
		this.MEM_MAIL = MEM_MAIL;
	}
}
