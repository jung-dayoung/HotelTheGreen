<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="member_manage.member_bean" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.text.DecimalFormat" %>
<jsp:useBean id="function" class="member_manage.member_function" />
<%
  DecimalFormat decFormat = new DecimalFormat("###,###");

  int key = 1;
  int name = 1;
  int id = 1;
  int phone = 1;
  int mail = 1;
  int ad_key = 1;
  String mem_key = "";
  String mem_name = "";
  String mem_id = "";
  String mem_phone = "";
  String mem_mail = "";
  String ad_uc_key = "";


  if (request.getAttribute("key") != null) { key = (int) request.getAttribute("key"); }
  if (request.getAttribute("name") != null) { name = (int) request.getAttribute("name"); }
  if (request.getAttribute("id") != null) { id = (int) request.getAttribute("id"); }
  if (request.getAttribute("phone") != null) { phone = (int) request.getAttribute("phone"); }
  if (request.getAttribute("mail") != null) { mail = (int) request.getAttribute("mail"); }
  if (request.getAttribute("ad_key") != null) { ad_key = (int) request.getAttribute("ad_key"); }
  if (request.getAttribute("mem_key") != null) { mem_key = (String) request.getAttribute("mem_key"); }
  if (request.getAttribute("mem_name") != null) { mem_name = (String) request.getAttribute("mem_name"); }
  if (request.getAttribute("mem_id") != null) { mem_id = (String) request.getAttribute("mem_id"); }
  if (request.getAttribute("mem_phone") != null) { mem_phone = (String) request.getAttribute("mem_phone"); }
  if (request.getAttribute("mem_mail") != null) { mem_mail = (String) request.getAttribute("mem_mail"); }
  if (request.getAttribute("ad_uc_key") != null) { ad_uc_key = (String) request.getAttribute("ad_uc_key"); }

  if (request.getAttribute("dis") != null) {
%>
<script>
  alert("내용이 다 입력되지 않았습니다.");
</script>
<% } else if (request.getAttribute("delete") != null) {%>
<script>
    alert("삭제가 완료 되었습니다.");
</script>
<% } else if (request.getAttribute("update") != null) {%>
<script>
    alert("수정이 완료 되었습니다.");
</script>
<% } %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="../../css/salse_expendse.css">
</head>
<body style="background-color: #686C7F;">

<%@include file="../include/navbar.jsp"%>


<div class="container text-center">

  <!-- 회원 정보 검색 도구 선택 -->
  <form method="post" action="../../selTermServlet">
    <div class="w-100" style="display: flex; justify-content: center; align-items: center; margin-top: 3%;">
      <label class="text-light" for="key">회원 번호 : </label>
      <input type="checkbox" id="key" value="key" name="key" class="m-3">
      <label class="text-light" for="name">이름 : </label>
      <input type="checkbox" id="name" value="name" name="name" class="m-3">
      <label class="text-light" for="id">아이디 : </label>
      <input type="checkbox" id="id" value="id" name="id" class="m-3">
      <label class="text-light" for="phone">연락처 : </label>
      <input type="checkbox" id="phone" value="phone" name="phone" class="m-3">
      <label class="text-light" for="mail">이메일 : </label>
      <input type="checkbox" id="mail" value="mail" name="mail" class="m-3">
      <label class="text-light" for="ad_key">등급 : </label>
      <input type="checkbox" id="ad_key" value="ad_key" name="ad_key" class="m-3">
      <input type="hidden" name="mem_key" value="<%=mem_key%>">
      <input type="hidden" name="mem_name" value="<%=mem_name%>">
      <input type="hidden" name="mem_id" value="<%=mem_id%>">
      <input type="hidden" name="mem_phone" value="<%=mem_phone%>">
      <input type="hidden" name="mem_mail" value="<%=mem_mail%>">
      <input type="hidden" name="ad_uc_key" value="<%=ad_uc_key%>">
      <button type="submit" class="btn btn-light m-3">선택</button>
    </div>
  </form>
  <%
    Vector<member_bean> memlist = function.member_list(mem_key, mem_name, mem_id, mem_phone, mem_mail, ad_uc_key);
  %>

  <!-- 회원 정보 검색 도구들 -->
  <form method="post" action="../../memberListServlet">
    <div class="w-100" style="display: flex; justify-content: center; align-items: center; margin-top: 3%;">
      <% if (key != 1) { %>
      <h5 class="text-light">회원 번호 : </h5>
      <input type="text" name="mem_key" value="" style="width:5vw;" class="form-control m-2">
      <% }
        if (name != 1) { %>
      <h5 class="text-light">이름 : </h5>
      <input type="text" name="mem_name" value="" style="width:5vw;" class="form-control m-2">
      <% }
        if (id != 1) { %>
      <h5 class="text-light">아이디 : </h5>
      <input type="text" name="mem_id" value="" style="width:5vw;" class="form-control m-2">
      <% }
        if (phone != 1) { %>
      <h5 class="text-light">연락처 : </h5>
      <input type="text" name="mem_phone" value="" style="width:5vw;" class="form-control m-2">
      <% }
        if (mail != 1) { %>
      <h5 class="text-light">이메일 : </h5>
      <input type="text" name="mem_mail" value="" style="width:5vw;" class="form-control m-2">
      <% }
        if (ad_key != 1) { %>
      <h5 class="text-light">등급 : </h5>
      <input type="text" name="ad_uc_key" value="" style="width:2vw;" class="form-control m-2">
      <% } %>
      <button type="submit" class="btn btn-light m-3">조회</button>
      <h5 class="text-light">총 : <%=memlist.size()%>명</h5>
    </div>
  </form>

  <div class="card text-start bg-transparent" style="max-width: 100%; margin: 1%; border:0px;">
    <table style="border: 0px;">

      <!-- 회원 내역 조회 결과 값 -->
    <%
      for (int i = 0; i < memlist.size(); i++) {
        member_bean bean = memlist.get(i);

        String str1 = decFormat.format(function.show_total(bean.getMEM_KEY()));
    %>
      <tr class="border-bottom text-light p-2">
        <td><small>회원 번호 : <span><%=bean.getMEM_KEY()%></span></small></td><td class="p-2">|</td>
        <td><small>이름 : <span><%=bean.getMEM_NAME()%></span></small></td><td class="p-2">|</td>
        <td><small>ID : <span><%=bean.getMEM_ID()%></span></small></td><td class="p-2">|</td>
        <td><small>연락처 : <span><%=bean.getMEM_PHONE()%></span></small></td><td class="p-2">|</td>
        <td><small>이메일 : <span><%=bean.getMEM_MAIL()%></span></small></td><td class="p-2">|</td>
        <td><small>결제 합계 : <span><%=str1%>원</span></small></td>
        <td class="text-end"><button class="btn btn-light mb-1 mt-1" data-bs-toggle="modal" data-bs-target="#rsv<%=i%>"><small>이용 내역</small></button></td>
        <td class="text-end"><button class="btn btn-light mb-1 mt-1" data-bs-toggle="modal" data-bs-target="#point<%=i%>"><small>포인트 내역</small></button></td>
        <td class="text-end"><button class="btn btn-secondary mb-1 mt-1" data-bs-toggle="modal" data-bs-target="#specific<%=i%>"><small>특이 사항</small></button></td>
        <td class="text-end"><button class="btn btn-dark mb-1 mt-1" data-bs-toggle="modal" data-bs-target="#update<%=i%>"><small>수정/삭제</small></button></td>
      </tr>

      <!-- 포인트 내역 모달 -->
      <div class="modal fade" id="point<%=i%>" tabindex="-1" aria-labelledby="pointList" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="pointList">포인트 내역</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <h5>잔여 : <%=function.total_point(bean.getMEM_KEY())%></h5>
              <%
                Vector<member_bean> pointlist = function.check_point(bean.getMEM_KEY());

                for (int j = 0; j < pointlist.size(); j++) {
                  member_bean bean2 = pointlist.get(j);
              %>
              <p><small>날짜 : <span><%=bean2.getPL_DATE()%></span> |
                <% if (bean2.getPL_SAVE_USE().equals("use")) {%>
                <span>사용</span>
                <% } else { %>
                <span>적립</span>
                <% } %>
                | <span><%=bean2.getPL_VALUE()%></span></small></p>
                <% } %>
            </div>
            <div class="modal-footer">
            </div>
          </div>
        </div>
      </div>

      <!-- 아용 내역 모달 -->
      <div class="modal fade" id="rsv<%=i%>" tabindex="-1" aria-labelledby="rsvList" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="rsvList">객실 / 다이닝 이용 내역</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
              <div class="modal-body">
                <h5>객실</h5>
                <%
                  Vector<member_bean> rmrsvlist = function.show_rm_list(bean.getMEM_KEY());

                  for (int k = 0; k < rmrsvlist.size(); k++) {

                    member_bean bean3 = rmrsvlist.get(k);
                %>
                <p><small>예약 번호 : <%=bean3.getRM_RSV_PRI()%></small></p>
                <p><small>&nbsp;- <%=bean3.getRM_RSV_USE()%> | <%=bean3.getRM_RSV_CHK_IN()%> ~ <%=bean3.getRM_RSV_CHK_OUT()%> | <%=bean3.getRM_CLS()%> | 객실수 : <%=bean3.getRM_RSV_NUM()%></small></p>
                <br>
                <% } %>
              </div>
              <div class="modal-body">
                <h5>다이닝</h5>
                <%
                  Vector<member_bean> dnrsvlist = function.show_dn_list(bean.getMEM_KEY());

                  for (int l = 0; l < dnrsvlist.size(); l++){

                    member_bean bean4 = dnrsvlist.get(l);
                %>
                <p><small><%=bean4.getDN_RSV_DATE()%> | <%=bean4.getRS_NAME()%> | <%=bean4.getML_TIME()%></small></p>
                <% } %>
              </div>
              <div class="modal-footer">
              </div>
          </div>
        </div>
      </div>

      <!-- 특이 사항 모달 -->
      <div class="modal fade" id="specific<%=i%>" tabindex="-1" aria-labelledby="content" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="content">회원 특이사항</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="post" action="../../memberUpdateServlet">
              <div class="modal-body">
                <% if (bean.getMEM_SPECIFIC() != null && bean.getMEM_SPECIFIC() != "") {%>
                <input type="textarea" class="form-control" row="3" name="mem_specific" value="<%=bean.getMEM_SPECIFIC()%>">
                <% } else { %>
                <input type="textarea" class="form-control" row="3" name="mem_specific" value="">
                <% } %>
                <input type="hidden" name="mem_key_u" value="<%=bean.getMEM_KEY()%>">
              </div>
              <div class="modal-footer">
                <button type="submit" name="ud" value="3" class="btn btn-dark">수정</button>
              </div>
            </form>
          </div>
        </div>
      </div>

      <!-- 회원 정보 모달 -->
      <div class="modal fade" id="update<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">회원 정보 수정 / 삭제</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="post" action="../../memberUpdateServlet">
              <div class="modal-body">
                ID <input name="mem_id_u" value="<%=bean.getMEM_ID()%>" class="text-dark fs-6 border-0 border-bottom bg-transparent w-100" type="text">
                PW <input name="mem_pw_u" value="<%=bean.getMEM_PW()%>" class="text-dark fs-6 border-0 border-bottom bg-transparent w-100" type="text">
                이름 <input name="mem_name_u" value="<%=bean.getMEM_NAME()%>" class="text-dark fs-6 border-0 border-bottom bg-transparent w-100" type="text">
                연락처 <input name="mem_phone_u" value="<%=bean.getMEM_PHONE()%>" class="text-dark fs-6 border-0 border-bottom bg-transparent w-100" type="text">
                이메일 <input name="mem_mail_u" value="<%=bean.getMEM_MAIL()%>" class="text-dark fs-6 border-0 border-bottom bg-transparent w-100" type="text">
                생년월일 <input name="mem_birth_u" value="<%=bean.getMEM_BIRTH()%>" class="text-dark fs-6 border-0 border-bottom bg-transparent w-100" type="text">
                등급 <input name="ad_uc_key_u" value="<%=bean.getAD_UC_KEY()%>" class="text-dark fs-6 border-0 border-bottom bg-transparent w-100" type="text">
                <input type="hidden" name="mem_key_u" value="<%=bean.getMEM_KEY()%>">
                <input type="hidden" name="mem_key" value="<%=mem_key%>">
                <input type="hidden" name="mem_name" value="<%=mem_name%>">
                <input type="hidden" name="mem_id" value="<%=mem_id%>">
                <input type="hidden" name="mem_phone" value="<%=mem_phone%>">
                <input type="hidden" name="mem_mail" value="<%=mem_mail%>">
                <input type="hidden" name="ad_uc_key" value="<%=ad_uc_key%>">
              </div>
              <div class="modal-footer">
                <button type="submit" name="ud" value="2" class="btn btn-danger">삭제</button>
                <button type="submit" name="ud" value="1" class="btn btn-dark">수정</button>
              </div>
            </form>
          </div>
        </div>
      </div>

      <% } %>

    </table>
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>