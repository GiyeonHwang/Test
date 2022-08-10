<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="mvc.model.BoardDTO"%>

<%
   BoardDTO notice = (BoardDTO) request.getAttribute("board");
   int num = ((Integer) request.getAttribute("num")).intValue();
   int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<c:set var="session_userid" value="${id}"></c:set>
<html>

<head>
<script src="js/bootstrap.min.js">
</script>
<link rel="stylesheet"
href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">


<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">

<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/style.css">
<title>Board</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<script type="text/javascript">
function goData() {
    var edit=document.getElementById('editor').innerHTML
    var form = document.newWrite;
    $('input[name=content]').attr('value', edit);
    console.log(edit)
    console.log(form)
 }
</script>
<body>
   <jsp:include page="../Nav.jsp" />
       <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5 fadeInUp ftco-animated">
             <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">커뮤니티 <i class="ion-ios-arrow-forward"></i></a></span> <span>글내용 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread"><%=notice.getSubject()%></h1>
          </div>
        </div>
      </div>
    </section>
    
<section class="ftco-section bg-light">

   <div class="container">
      <form name="newUpdate"
         action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"
         class="form-horizontal" method="post">
               <input type="hidden" value="" name="content">
         <div class="form-group row">
            <label class="col-sm-2 control-label" >성명</label>
            <div class="col-sm-3">
               <c:set var="userId" value="<%=notice.getId()%>" />
               <c:choose>
                  <c:when test="${session_userid==userId}">
                     <p>
                        <input name="name" class="form-control"
                           value=" <%=notice.getName()%>">
                  </c:when>
                  <c:otherwise>
                     <label class="col-sm-8 control-label"><%=notice.getName()%></label>
                  </c:otherwise>
               </c:choose>
            </div>
         </div>
         <hr>
         <div class="form-group row">
            <label class="col-sm-2 control-label" >제목</label>
            <div class="col-sm-5">
               <c:set var="userId" value="<%=notice.getId()%>" />
               <c:choose>
                  <c:when test="${session_userid==userId}">
                     <p>
                        <input name="subject" class="form-control"   value=" <%=notice.getSubject()%>" >
                  </c:when>
                  <c:otherwise>
                     <label class="col-sm-8 control-label"><%=notice.getSubject()%></label>
                  </c:otherwise>
               </c:choose>
            </div>
         </div>
         <hr>
         <div class="form-group row">
            <label class="col-sm-2 control-label" >내용</label>
            <div class="col-sm-8" style="word-break: break-all;">
               <c:choose>
                  <c:when test="${session_userid==userId}">
                     <p>                                          
<%--                      <textarea name="content" class="form-control" cols="50" rows="5"> <%=notice.getContent()%></textarea> --%>
                     <div id="editor" class="form-control" contenteditable="true" ><%=notice.getContent()%></div>
                  </c:when>
                  <c:otherwise>
<%--                      <textarea name="content" class="form-control" cols="50" rows="5" readonly> <%=notice.getContent()%></textarea> --%>
                        <div id="editor" class="form-control"><%=notice.getContent()%></div>
                  </c:otherwise>
               </c:choose>
            </div>
         </div>
         <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10 ">
               <c:set var="userId" value="<%=notice.getId()%>" />
               <c:if test="${session_userid==userId}">
                  <p>
                     <a href="BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="btn btn-danger"> 삭제</a> 
                     <input type="submit" class="btn btn-success" value="수정 " onclick="goData();">
               </c:if>
               <a href="BoardListAction.do?pageNum=<%=nowpage%>" class="btn btn-primary"> 목록</a>
            </div>
         </div>
      </form>
      <hr>
   </div>
      </section>
</body>
</html>

<style>
   div#editor {
       padding: 16px 24px;
        border: 1px solid #D6D6D6;
        border-radius: 4px;
    }
    
    #editor img {
   max-width: 100%;
}

</style>