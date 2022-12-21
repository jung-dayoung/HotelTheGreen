package mypage;

import java.sql.Date;

public class roomReservationBean {
  private int RM_RSV_KEY;
  private Date RM_RSV_CHK_IN;
  private Date RM_RSV_CHK_OUT;
  private int RM_RSV_NUM;
  private int RM_RSV_ADULT;
  private String RM_RSV_NAME;
  private String RM_RSV_PHONE;
  private String RM_RSV_EMAIL;
  private String RM_RSV_PW;
  private String RM_RSV_USE;
  private int RM_KEY;
  private int MEM_key;
  private int AD_UC_key;
  private String RM_CLS;
  private int RM_COST;

  public int getRM_RSV_KEY() {
    return RM_RSV_KEY;
  }

  public void setRM_RSV_KEY(int RM_RSV_KEY) {
    this.RM_RSV_KEY = RM_RSV_KEY;
  }

  public Date getRM_RSV_CHK_IN() {
    return RM_RSV_CHK_IN;
  }

  public void setRM_RSV_CHK_IN(Date RM_RSV_CHK_IN) {
    this.RM_RSV_CHK_IN = RM_RSV_CHK_IN;
  }

  public Date getRM_RSV_CHK_OUT() {
    return RM_RSV_CHK_OUT;
  }

  public void setRM_RSV_CHK_OUT(Date RM_RSV_CHK_OUT) {
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

  public String getRM_RSV_PHONE() {
    return RM_RSV_PHONE;
  }

  public void setRM_RSV_PHONE(String RM_RSV_PHONE) {
    this.RM_RSV_PHONE = RM_RSV_PHONE;
  }

  public String getRM_RSV_EMAIL() {
    return RM_RSV_EMAIL;
  }

  public void setRM_RSV_EMAIL(String RM_RSV_EMAIL) {
    this.RM_RSV_EMAIL = RM_RSV_EMAIL;
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

  public int getRM_KEY() {
    return RM_KEY;
  }

  public void setRM_KEY(int RM_KEY) {
    this.RM_KEY = RM_KEY;
  }

  public int getMEM_key() {
    return MEM_key;
  }

  public void setMEM_key(int MEM_key) {
    this.MEM_key = MEM_key;
  }

  public int getAD_UC_key() {
    return AD_UC_key;
  }

  public void setAD_UC_key(int AD_UC_key) {
    this.AD_UC_key = AD_UC_key;
  }

  public String getRM_CLS() {
    return RM_CLS;
  }

  public void setRM_CLS(String RM_CLS) {
    this.RM_CLS = RM_CLS;
  }

  public int getRM_COST() {
    return RM_COST;
  }

  public void setRM_COST(int RM_COST) {
    this.RM_COST = RM_COST;
  }
}
