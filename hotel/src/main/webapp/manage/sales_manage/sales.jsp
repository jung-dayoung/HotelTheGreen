<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Vector" %>
<%@ page import="sales_manage.sales_bean" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<jsp:useBean id="function" class="sales_manage.sales_function" />
<%
  request.setAttribute("commonURL", request.getContextPath());
  DecimalFormat decFormat = new DecimalFormat("###,###");

  DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
  Date nowDate = new Date();
  String today = sdFormat.format(nowDate);
  Calendar date = Calendar.getInstance();


  String start = today;
  String end = today;
  int deg = (int) Math.round(function.mtPer() * 3.6);
  int cash = 100 - function.mtPer();
  int secCash = function.yearTotal() - function.rsvSecPri();
  int secCashNum = function.totalRsv() - function.rsvSecNum();
  int year = date.get(Calendar.YEAR);
  int month = date.get(Calendar.MONTH) + 1;
  int tax = (int)Math.round((float)function.yearTotal() * 0.113);
  int tep = function.yearTotal() - function.totalExp() - tax;


  if (request.getAttribute("start") != null) {
    start = (String) request.getAttribute("start");
  }
  if (request.getAttribute("end") != null) {
    end = (String) request.getAttribute("end");
  }
  if (request.getAttribute("year") != null) {
    year = (int) request.getAttribute("year");
  }
  if (request.getAttribute("month") != null) {
    month = (int) request.getAttribute("month");
  }

  if (request.getAttribute("mis") != null) {
%>
<script>
  alert("기간을 다시 선택하세요.")
</script>
<% } %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 조회</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/charts.css/dist/charts.min.css">
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="${commonURL}/css/salse_expendse.css">
  <style>
    .cash_card_chart-bar{
        width: inherit;
        height: inherit;
        border-radius: 50%;
        background: conic-gradient(#6a78b9 <%=deg%>deg, #735ba5 <%=deg%>deg);
    }
  </style>  
</head>
<body style="background-color: #686C7F;">

<%@include file="../include/navbar.jsp"%>

<%@include file="navbar.jsp"%>

<div id="mainCon">

  <div style="width: 19%;">
    <h3 class="fs-4 text-light" style="padding:10px;">매출 금액</h3>
    <div class="w-100" id="conSec1">
      <div class="bg-dark" style="padding-top:3px"><span id="conNav1" class="text-light text-start fs-5">결제 합계</span></div>
      <table class="charts-css bar show-heading hide-data" id="table1" cellspacing="0">
        <caption class="text-center text-light"> 총 결제 금액</caption>
        <caption class="text-center text-light" style="margin-bottom:10%" id="total"></caption>
        <tbody style="height: 10%;">
        <tr style="margin-left: 12.5%;" class="w-75 bg-dark">
          <td style="--size: calc(<%=function.yearTotal()%>/485450000); background-color: #e56aa0;"><span class="data">총액</span></td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
  <script>
      let price;
      price = <%=function.yearTotal()%>;
      let total1 = price.toLocaleString();
      document.getElementById("total").innerHTML = total1 + "원";
  </script>

  <div style="width: 72%; margin-left: 1%;">
    <h3 class="fs-4 text-light" style="padding:10px;">매출 통계</h3>
    <div id="conSec2">

      <div class="w-50 border-end border-dark" style="background-color: #363c52;">
        <div class="bg-dark" style="padding-top:3px"><span id="conNav2" class="text-light text-start fs-5 w-100">매출 / 건</span></div>
        <div style="display:flex;">

          <!--월별 매출 반복 처리-->
          <%
            Vector<sales_bean> list = function.totalMon();

            for (int i = 0; i < list.size(); i++) {

              sales_bean bean = list.get(i);

              String str1 = decFormat.format(bean.getSalesEA());
          %>
          <div style="width:16%; margin:0 2%;">
            <table class="charts-css column show-heading hide-data show-labels data-spacing-15" cellspacing="0" style="margin-top: 15%; height:25vh;">
              <tr>
                <th scope="row" class="text-light">매출</th>
                <td id="monthSales<%=i%>" style="--size: calc(<%=bean.getSalesEA()%>/39900000); background-color: #6a78b9;" data-bs-toggle="tooltip" data-bs-title="<%=str1%>원"><span class="data"></span></td>
              </tr>
              <tr>
                <th scope="row" class="text-light">건</th>
                <td style="--size: calc(<%=bean.getRsvEA()%>/120); background-color: #735ba5;" data-bs-toggle="tooltip" data-bs-title="<%=bean.getRsvEA()%>건"><span class="data"></span></td>
              </tr>
              <caption class="text-center text-light"><%=bean.getMonth()%></caption>
            </table>
          </div>
          <% } %>
          <!-- 끝 -->
        </div>
      </div>

      <%
        String str2 = decFormat.format(function.totalDuaPri(start, end));
        String str3 = decFormat.format(function.totalDuaRsv(start, end));
      %>
      <div class="w-50" style="background-color: #363c52;">
        <div class="bg-dark" style="padding-top:3px"><span id="conNav3" class="text-light text-start fs-5">기간 조회</span></div>
        <table class="charts-css bar show-heading hide-data show-labels reverse data-spacing-15" cellspacing="0" style="background-color: #363c52; height: 10vh;">
          <div style="display: flex; justify-content: center; align-items: center; margin-top: 6%;">
            <form method="post" action="../../duaDisServlet">
              <input type="date" name="start" class="form-control w-25" value="<%=start%>">
              <input type="date" name="end" class="form-control w-25 text-dark" value="<%=end%>" style="margin-left: 5%;">
              <input type="hidden" name="year" value="<%=year%>">
              <input type="hidden" name="month" value="<%=month%>">
              <button type="submit" class="btn btn-light" style="margin-left: 5%;">조회</button>
            </form>
          </div>
          <% if (function.totalDuaPri(start, end) != 0) { %>
          <tbody style="height: 10%; margin-top: 6%;">
          <tr style="margin-left: 10%;" class="w-75">
            <th scope="row" class="text-light text-end">메출</th>
            <td style="--size: calc(<%=function.totalDuaPri(start, end)%>/<%=function.totalDuaMax(start, end)%>>); background-color: #6a78b9;" data-bs-toggle="tooltip" data-bs-title="<%=str2%>원"><span class="data">금액</span></td>
          </tr>
          <tr style="margin-left: 10%;" class="w-75">
            <th scope="row" class="text-light text-end">건</th>
            <td style="--size: calc(<%=function.totalDuaRsv(start, end)%>/<%=function.totalDuaRsvMax(start, end)%>>); background-color: #735ba5;" data-bs-toggle="tooltip" data-bs-title="<%=str3%>건"><span class="data">건</span></td>
          </tr>
          </tbody>
          <% } %>
        </table>
      </div>

    </div>
  </div>
</div>

<div style="display:flex; width:100%; margin: 2% 4%;">
  <div style="width: 45.5%;">
    <h3 class="fs-4 text-light" style="padding:10px;">현금 / 카드 비율</h3>
    <div class="w-100" id="csCrSec">
      <div class="cash_card_chart">
        <div class="cash_card_chart-bar" data-deg="50">
          <div class="cash_card_chart_center">
            <div class="text-center text-light fs-4" style="margin-top: 40%;">현금 / 카드<br><%=cash%>% / <%=function.mtPer()%>%</div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%
    String str4 = decFormat.format(function.rsvSecPri());
    String str5 = decFormat.format(secCash);
  %>
  <div style="width: 45.5%; margin-left: 1%;">
    <h3 class="fs-4 text-light" style="padding:10px;">현장 / 예약별 건 및 매출 비교</h3>
    <div class="w-100" style="background-color: #363c52; padding:0; height: 45vh;">
      <table class="charts-css bar show-heading hide-data show-labels reverse data-spacing-15" cellspacing="0" style="height: 10vh;">
        <caption class="text-center text-light fs-4 mt-5">예약</caption>
        <tbody style="height: 10%; margin-top: 0%;">
        <tr style="margin-left:9%;" class="w-75 mt-4">
          <th scope="row" class="text-light text-end">매출</th>
          <td style="--size: calc(<%=function.rsvSecPri()%>/<%=function.rsvSecPri()%>); background-color: #6a78b9;" data-bs-toggle="tooltip" data-bs-title="<%=str4%>원"><span class="data">총액</span></td>
        </tr>
        <tr style="margin-left: 9%;" class="w-75">
          <th scope="row" class="text-light text-end">건</th>
          <td style="--size: calc(<%=function.rsvSecNum()%>/<%=function.rsvSecNum()%>); background-color: #735ba5;" data-bs-toggle="tooltip" data-bs-title="<%=function.rsvSecNum()%>건"><span class="data">총액</span></td>
        </tr>
        </tbody>
      </table>
      <table class="charts-css bar show-heading hide-data show-labels reverse data-spacing-15" cellspacing="0" style="height: 10vh;margin-top: 15%;">
        <caption class="text-center text-light fs-4">현장</caption>
        <tbody style="height: 10%;">
        <tr style="margin-left:9%;" class="w-75 mt-4">
          <th scope="row" class="text-light text-end">매출</th>
          <td style="--size: calc(<%=secCash%>/<%=function.rsvSecPri()%>); background-color: #6a78b9;" data-bs-toggle="tooltip" data-bs-title="<%=str5%>원"><span class="data">총액</span></td>
        </tr>
        <tr style="margin-left: 9%;" class="w-75">
          <th scope="row" class="text-light text-end">건</th>
          <td style="--size: calc(<%=secCashNum%>/<%=function.rsvSecNum()%>); background-color: #735ba5;" data-bs-toggle="tooltip" data-bs-title="<%=secCashNum%>건"><span class="data">총액</span></td>
        </tr>
        </tbody>
      </table>
    </div>
    <%
      String str6 = decFormat.format(function.mondiv(year, month));
      String str7 = decFormat.format(function.monExp(year, month));
    %>
    <h3 class="fs-4 text-light" style="padding:10px;">매출 / 지출 월별 비교</h3>
    <div class="w-100" id="monSec">
      <div style="display: flex; justify-content: center; align-items: center;">
        <form method="post" action="../../monDivServlet">
          <input name="year" class="text-light text-center fs-5 border-0 border-bottom bg-transparent m-4" style="width:8%" type="text" value="<%=year%>">
          <input name="month" class="text-light text-center fs-5 border-0 border-bottom bg-transparent m-4" style="width:5%" type="text" value="<%=month%>">
          <input type="hidden" name="start" value="<%=start%>">
          <input type="hidden" name="end" value="<%=end%>">
          <button type="submit" class="btn btn-light m-4">조회</button>
        </form>
      </div>
      <table class="charts-css bar show-heading hide-data show-labels reverse data-spacing-15 mt-1" cellspacing="0" style="height: 10vh;">
        <%
          if (function.mondiv(year, month) != 0) {
        %>
        <tbody style="height: 10%;">
        <tr style="margin-left:9%;" class="w-75">
          <th scope="row" class="text-light text-end">매출</th>
          <td style="--size: calc(<%=function.mondiv(year, month)%>/39900000); background-color: #e56aa0;" data-bs-toggle="tooltip" data-bs-title="<%=str6%>원"><span class="data">총액</span></td>
        </tr>
        <tr style="margin-left: 9%;" class="w-75">
          <th scope="row" class="text-light text-end">지출</th>
          <% if (function.monExp(year, month) < 39900000) {%>
          <td style="--size: calc(<%=function.monExp(year, month)%>/39900000);" class="bg-dark" data-bs-toggle="tooltip" data-bs-title="<%=str7%>원"><span class="data">총액</span></td>
          <% } else { %>
          <td style="--size: calc(<%=function.monExp(year, month)%>/<%=function.monExp(year, month)%>);" class="bg-dark" data-bs-toggle="tooltip" data-bs-title="<%=str7%>원"><span class="data">총액</span></td>
          <% } %>
        </tr>
        </tbody>
        <% } %>
      </table>
    </div>
  </div>
</div>
<%
  String str8 = decFormat.format(function.yearTotal());
  String str9 = decFormat.format(function.totalExp());
  String str10 = decFormat.format(tax);
  String str11 = decFormat.format(tep);
%>


<div style="width:92%; margin: 2% 4% 10% 4%;">
  <h3 class="fs-4 text-light" style="padding:10px;">총 매출 / 지출 합계</h3>
  <div class="w-100" style="background-color: #363c52; padding:0; height: 50vh;">
    <table class="charts-css bar show-heading hide-data show-labels data-spacing-20" cellspacing="0" style="height: 10vh;">
      <tbody style="height: 10%;">
      <tr style="margin-left:9%;" class="w-75 mt-5">
        <th scope="row" class="text-light text-end">총 매출</th>
        <td style="--size: calc(<%=function.yearTotal()%>/485450000); background-color: #e56aa0;" data-bs-toggle="tooltip" data-bs-title="<%=str8%>원"><span class="data">총액</span></td>
      </tr>
      <tr style="margin-left: 9%;" class="w-75 mt-5">
        <th scope="row" class="text-light text-end">총 지출</th>
        <td style="--size: calc(<%=function.totalExp()%>/388360000);" class="bg-dark" data-bs-toggle="tooltip" data-bs-title="<%=str9%>원"><span class="data">총액</span></td>
      </tr>
      <tr style="margin-left: 9%;" class="w-75 mt-5">
        <th scope="row" class="text-light text-end">세금</th>
        <td style="--size: calc(<%=tax%>/54855850); background-color: #6a78b9;" data-bs-toggle="tooltip" data-bs-title="<%=str10%>원"><span class="data">총액</span></td>
      </tr>
      <tr style="margin-left: 9%;" class="w-75 mt-5">
        <th scope="row" class="text-light text-end">순 매출</th>
        <td style="--size: calc(<%=tep%>/<%=tep * 1.4%>); background-color: #735ba5;" data-bs-toggle="tooltip" data-bs-title="<%=str11%>원"><span class="data">총액</span></td>
      </tr>
      </tbody>
    </table>
  </div>
</div>
<!-- JavaScript Bundle with Popper -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
</script>
</body>
</html>