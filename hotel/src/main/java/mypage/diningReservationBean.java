package mypage;

import java.sql.Date;

public class diningReservationBean {
  private int DN_RSV_KEY;
  private Date DN_RSV_DATE;
  private int DN_RSV_ADULT;
  private String DN_RSV_NAME;
  private String DN_RSV_PHONE;
  private String DN_RSV_PW;
  private String DN_RSV_USE;
  private int RS_KEY;
  private int ML_KEY;
  private int MEM_KEY;
  private String RS_NAME;
  private String ML_TIME;

  public int getDN_RSV_KEY() {
    return DN_RSV_KEY;
  }

  public void setDN_RSV_KEY(int DN_RSV_KEY) {
    this.DN_RSV_KEY = DN_RSV_KEY;
  }

  public Date getDN_RSV_DATE() {
    return DN_RSV_DATE;
  }

  public void setDN_RSV_DATE(Date DN_RSV_DATE) {
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

  public void setDN_RSV_PHONE(String DN_RSV_PHONE) {
    this.DN_RSV_PHONE = DN_RSV_PHONE;
  }

  public String getDN_RSV_PW() {
    return DN_RSV_PW;
  }

  public void setDN_RSV_PW(String DN_RSV_PW) {
    this.DN_RSV_PW = DN_RSV_PW;
  }

  public String getDN_RSV_USE() {
    return DN_RSV_USE;
  }

  public void setDN_RSV_USE(String DN_RSV_USE) {
    this.DN_RSV_USE = DN_RSV_USE;
  }

  public int getRS_KEY() {
    return RS_KEY;
  }

  public void setRS_KEY(int RS_KEY) {
    this.RS_KEY = RS_KEY;
  }

  public int getML_KEY() {
    return ML_KEY;
  }

  public void setML_KEY(int ML_KEY) {
    this.ML_KEY = ML_KEY;
  }

  public int getMEM_KEY() {
    return MEM_KEY;
  }

  public void setMEM_KEY(int MEM_KEY) {
    this.MEM_KEY = MEM_KEY;
  }

  public String getRS_NAME() {
    return RS_NAME;
  }

  public void setRS_NAME(String RS_NAME) {
    this.RS_NAME = RS_NAME;
  }

  public String getML_TIME() {
    return ML_TIME;
  }

  public void setML_TIME(String ML_TIME) {
    this.ML_TIME = ML_TIME;
  }
}
