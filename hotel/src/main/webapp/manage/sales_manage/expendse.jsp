<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="sales_manage.expendse_bean" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<jsp:useBean id="function" class="sales_manage.sales_function"/>

<%
  DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
  Date nowDate = new Date();
  String today = sdFormat.format(nowDate);

  String start = today;
  String end = today;
  String sec = "";
  String sort = "desc";

  if (request.getAttribute("sort") != null) {
    sort = (String) request.getAttribute("sort");
  }

  if (request.getAttribute("sec") != null && request.getAttribute("sec") != "") {
    sec = (String) request.getAttribute("sec");
  }


  if (request.getAttribute("start") != null && request.getAttribute("start") != "" &&
  request.getAttribute("end") != null && request.getAttribute("end") != "") {
    start = (String) request.getAttribute("start");
    end = (String) request.getAttribute("end");
  }

  if (request.getAttribute("dis") != null) {

%>
  <script>
    alert("내용이 다 기입되지 않았습니다.");
  </script>
<%
  }

if (request.getAttribute("mis") != null) {
%>
<script>
    alert("날짜를 다시 선택하세요..");
</script>
<%
  }
%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>지출 내역</title>
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="../../css/salse_expendse.css">
</head>
<body style="background-color: #686C7F;">

<%@include file="../include/navbar.jsp"%>

<%@include file="navbar.jsp"%>

<div style="margin-left:33%">
  <h2  class="fs-2 text-light">지출 내역</h2><br>
  <div class="w-50 h-auto" id="conSec1">
    <div class="bg-dark" style="padding-top:3px"><span id="conNav1" class="text-light text-start fs-5">지출 추가</span></div>
    <form method="post" action="../../expendseInsert">
      <table style="margin:3% 25%;">
        <tr>
          <td class="text-center fs-6 text-light w-25">날짜</td>
          <td class="text-center fs-6 text-light" style="width:10%;">:</td>
          <td>
            <input name="date" class="text-light fs-5 border-0 border-bottom bg-transparent w-100" type="text">
          </td>
        </tr>
        <tr>
          <td class="text-center fs-6 text-light">지출 구분</td>
          <td class="text-center fs-6 text-light">:</td>
          <td>
            <input name="sec" class="text-light fs-5 border-0 border-bottom bg-transparent w-100" type="text">
          </td>
        </tr>
        <tr>
          <td class="text-center fs-6 text-light">내용</td>
          <td class="text-center fs-6 text-light">:</td>
          <td>
            <input name="content" class="text-light fs-5 border-0 border-bottom bg-transparent w-100" type="text">
          </td>
        </tr>
        <tr>
          <td class="text-center fs-6 text-light">금액</td>
          <td class="text-center fs-6 text-light">:</td>
          <td>
            <input name="value" class="text-light fs-5 border-0 border-bottom bg-transparent w-100" type="text">
          </td>
        </tr>
        <tr>
          <td colspan="3" class="text-center p-3">
            <input type="hidden" name="start" value="<%=start%>">
            <input type="hidden" name="end" value="<%=end%>">
            <input type="hidden" name="sec1" value="<%=sec%>">
            <input type="hidden" name="sort" value="<%=sort%>">
            <button type="submit" class="btn btn-light">입력</button>
          </td>
        </tr>
      </table>
    </form>

  </div>
</div>



<div class="container text-center">
  <form method="post" action="../../expendseListServlet">
    <div style="display: flex; justify-content: center; align-items: center; margin-top: 6%;">
      <input type="date" name="start" id="start" value="<%=start%>" onchange="dateChange();" class="form-control w-auto m-3">
      <input type="date" name="end" id="end" value="<%=end%>" class="form-control w-auto m-3">
      <% if (sec != null && sec != "") { %>
      <span class="text-end fs-6 text-light">지출 구분 : </span><input type="text" name="sec" class="form-control w-auto m-3" value="<%=sec%>">
      <% } else { %>
      <span class="text-end fs-6 text-light">지출 구분 : </span><input type="text" name="sec" class="form-control w-auto m-3">
      <% } %>
      <select name="sort" class="form-control w-auto m-3">
        <% if (sort.equals("desc")) { %>
        <option value="desc" selected>내림차순</option>
        <option value="asc">오름차순</option>
        <% } else { %>
        <option value="desc">내림차순</option>
        <option value="asc" selected>오름차순</option>
        <% } %>
      </select>
      <button type="submit" class="btn btn-light m-3">조회</button>
    </div>
    <script>
        function dateChange() {
            let date_input = document.getElementById("start").value;
            document.getElementById("end").setAttribute("min", date_input);
        };
    </script>
  </form>

  <div class="card text-start bg-transparent" style="max-width: 70%; margin: 1% 15%; border:0px;">
    <table style="border: 0px; margin-bottom: 10vh;">

      <%
        Vector<expendse_bean> list = null;
        if (sec != null && sec != "") {
          if (sort.equals("desc")) {
            list = function.epListSecDesc(start, end, sec);
          } else {
            list = function.epListSecAsc(start, end, sec);
          }
        } else  {
          if (sort.equals("desc")) {
            list = function.epListDesc(start, end);
          } else {
            list = function.epListAsc(start, end);
          }
        }
        for (int i = 0; i < list.size(); i++) {

          expendse_bean bean = list.get(i);

      %>

      <tr class="border-bottom text-light p-2">
        <td>날짜 : <span><%=bean.getEP_DATE()%></span></td>
        <td>지출 구분 : <span><%=bean.getEP_SEC()%></span></td>
        <td>내용 : <%=bean.getEP_CONTENT()%></td>
        <td class="text-end"><%=bean.getEP_VALUE()%>원</td>
        <td class="text-end"><button type="submit" class="btn btn-light m-3" data-bs-toggle="modal" data-bs-target="#update<%=i%>">수정/삭제</button></td>
      </tr>
      <div class="modal fade" id="update<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">지출 내역 수정</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="post" action="../../expendseUpdateServlet">
              <div class="modal-body">
                날짜 <input name="date" value="<%=bean.getEP_DATE()%>" class="text-dark fs-6 border-0 border-bottom bg-transparent w-100" type="text">
                구분 <input name="sec" value="<%=bean.getEP_SEC()%>" class="text-dark fs-6 border-0 border-bottom bg-transparent w-100" type="text">
                내용 <input name="content" value="<%=bean.getEP_CONTENT()%>" class="text-dark fs-6 border-0 border-bottom bg-transparent w-100" type="text">
                금액 <input name="value" value="<%=bean.getEP_VALUE()%>" class="text-dark fs-6 border-0 border-bottom bg-transparent w-100" type="text">
                <input type="hidden" name="start" value="<%=start%>">
                <input type="hidden" name="end" value="<%=end%>">
                <input type="hidden" name="sort" value="<%=sort%>">
                <input type="hidden" name="sec1" value="<%=sec%>">
                <input type="hidden" name="key" value="<%=bean.getEP_KEY()%>">
              </div>
              <div class="modal-footer">
                <button type="submit" name="ud" value="1" class="btn btn-danger">삭제</button>
                <button type="submit" name="ud" value="2" class="btn btn-dark">수정</button>
              </div>
            </form>
          </div>
        </div>
      </div>

      <%
        }
      %>
    </table>
  </div>
</div>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>

</html>