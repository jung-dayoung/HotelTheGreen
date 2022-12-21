package mypage;

import java.sql.Date;

public class pointBean {
  private Date PL_DATE;
  private String PL_SAVE_USE;
  private int PL_VALUE;
  private int PL_TOTAL;

  public Date getPL_DATE() {
    return PL_DATE;
  }

  public void setPL_DATE(Date PL_DATE) {
    this.PL_DATE = PL_DATE;
  }

  public String getPL_SAVE_USE() {
    return PL_SAVE_USE;
  }

  public void setPL_SAVE_USE(String PL_SAVE_USE) {
    this.PL_SAVE_USE = PL_SAVE_USE;
  }

  public int getPL_VALUE() {
    return PL_VALUE;
  }

  public void setPL_VALUE(int PL_VALUE) {
    this.PL_VALUE = PL_VALUE;
  }

  public int getPL_TOTAL() {
    return PL_TOTAL;
  }

  public void setPL_TOTAL(int PL_TOTAL) {
    this.PL_TOTAL = PL_TOTAL;
  }
}
