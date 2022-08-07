
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.*"%>
<%@page import="javax.*"%>
<%@page import="java.lang.reflect.Parameter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vo.*"%>
<%@page import="gg.*"%>
<%@page import="java.util.*"%>

<jsp:useBean id="abandonList" class="vo.AbandonList"></jsp:useBean>
<jsp:useBean id="mapAddresChange" class="gg.MapAddresChange"
	scope="request"></jsp:useBean>
<%
String desertionNo = (String)request.getAttribute("desertionNo");//현재 페이지의 유기동물의 유기번호
ArrayList<IndexCommentsVO> commentList = (ArrayList<IndexCommentsVO>)request.getAttribute("commentList");//현재 페이지의 유기동물의 유기번호
DateAbandon dateAbandon = abandonList.searchDesertionNo(desertionNo);//해당 유기번호 동물의 데이터
String[] addresses = mapAddresChange.geocoding(dateAbandon.getCareAddr()).split(",");// 해당 동물의 보호소의 주소를 좌표값으로 변환하는 함수를 호출하여 x,y 값을 string 배열로 받음
// System.out.println("blog-single.jsp 유기번호 = " + desertionNo);
// System.out.println("blog-single.jsp 유기번호 = " + commentList.toString());
String userID = "mkc";
%>
<!DOCTYPE html>
<html lang="kr">
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<title>Pet Sitting - Free Bootstrap 4 Template by Colorlib</title>
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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=qhzingc5km"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function (){
	$("input[name='buttonSubmit']").click(function() { // 제출 버튼 이벤트 지정
		console.log('ajax실행');
		<%-- 		<% --%>
		// 		if(id == null){
		<%-- 		%> --%>
		// 		alert("로그인이 필요합니다.");
		// 		location.href='./login.do';
		<%-- 		<% --%>
		// 		}else{
					
		<%-- 		%> --%>
		const id = 'mkc';
		$.ajax({
			type: "POST", // HTTP Method
			url: "blog-singleInsert.do", // 목적지
			data: {userid : id,			   // 전송 데이터
				   content :$("#messageCM").val(),
					desertionNo : <%=desertionNo%>
			}
		}).done(function(data){
// 			location.reload()
			console.log(data)
			const jsonInfo = JSON.parse(data)
			let memberInfo=""
                for(const i in jsonInfo.members) {
                    memberInfo += '<li class="comment">'
                    memberInfo += '<div class="vcard bio">'
                    memberInfo += '<img src="images/person_1.jpg" alt="Image placeholder">'
                    memberInfo += '</div>'
                    memberInfo += '<div class="comment-body">'
                    memberInfo += '<p>' + jsonInfo.members[i].comment+ '</p>'
                    memberInfo += '<p>'
                    memberInfo += '<button class="reply" id="reply" onclick="fnMove('
                    memberInfo += '\'<%=userID%>\''
                    memberInfo += ');" type="button" >Reply</button>'
                    memberInfo += '<button class="reply" id="Del" type="button" onclick="Commentdelete('+jsonInfo.members[i].indexComment+');">Del</button>'
                    memberInfo += '</div></li>'
                   $('#commentListUL').html(memberInfo)
                }
			}).fail(function (Response) {
				console.log('에러')
            });
		});
	});
function Commentdelete(indexCom) { // 제출 버튼 이벤트 지정
	console.log('ajax실행');
	const commentNum = indexCom;
	const id = 'mkc';
	$.ajax({
		type: "POST", // HTTP Method
		url: "blog-singleDelete.do", // 목적지
		data: {userid : id,			   // 전송 데이터
				desertionNo : <%=desertionNo%>,
				indexComments:commentNum
		}
	}).done(function(data){
//			location.reload()
		console.log(data)
		const jsonInfo = JSON.parse(data)
		let memberInfo=""
            for(const i in jsonInfo.members) {
                memberInfo += '<li class="comment">'
                    memberInfo += '<div class="vcard bio">'
                    memberInfo += '<img src="images/person_1.jpg" alt="Image placeholder">'
                    memberInfo += '</div>'
                    memberInfo += '<div class="comment-body">'
                    memberInfo += '<p>' + jsonInfo.members[i].comment+ '</p>'
                    memberInfo += '<p>'
                    memberInfo += '<button class="reply" id="reply" onclick="fnMove('
                    memberInfo += '\'<%=userID%>\''
                        memberInfo += ');" type="button" >Reply</button>'
                            memberInfo += '<button class="reply" id="Del" type="button" onclick="Commentdelete('+jsonInfo.members[i].indexComment+');">Del</button>'
                    memberInfo += '</div></li>'
                   $('#commentListUL').html(memberInfo)
            }
		}).fail(function (Response) {
			console.log('에러')
        });
	}
</script>
<body>
	 <jsp:include page="Nav.jsp"></jsp:include>
	<!-- END nav -->
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs mb-2">
						<span class="mr-2"><a href="index.html">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a
							href="blog.html">Blog <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog
							Single <i class="ion-ios-arrow-forward"></i>
						</span>
					</p>
					<h1 class="mb-0 bread">Blog</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-degree-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 ftco-animate">
					<p>
						<img src="<%=dateAbandon.getPopfile()%>" alt="" class="img-fluid">
					</p>
					<h2 class="mb-3"></h2>
					<h2 class="mb-3 mt-5">특이사항</h2>
					<table style="width: 100%;" border= 1px solidblack; >
						<tbody>
							<tr>
								<td
									style="width: 18.2668%; background-color: rgb(98, 99, 99); text-align: center;"><div
										style="text-align: center;">
										<span style="font-size: 14px;"><span
											style="color: rgb(255, 255, 255);">종</span></span><span
											style="font-size: 13px;"><br></span>
									</div></td>
								<td style="width: 31.7989%; text-align: center;"><div
										style="text-align: center;"><%=dateAbandon.getKindCd()%></div></td>
								<td
									style="width: 16.82%; background-color: rgb(98, 99, 99); text-align: center;"><div
										style="text-align: center;">
										<span style="font-size: 14px;"><span
											style="color: rgb(255, 255, 255);">나이</span></span><span
											style="font-size: 13px;"><br></span>
									</div></td>
								<td style="width: 33.1143%; text-align: center;"><div
										style="text-align: center;"><%=dateAbandon.getAge()%></div></td>
							</tr>
							<tr>
								<td
									style="width: 18.2668%; background-color: rgb(98, 99, 99); text-align: center;"><div
										style="text-align: center;">
										<span style="font-size: 14px;"><span
											style="color: rgb(255, 255, 255);">성별</span></span><span
											style="font-size: 13px;"><br></span>
									</div></td>
								<td style="width: 31.7989%; text-align: center;"><div
										style="text-align: center;"><%=dateAbandon.getSexCd()%></div></td>
								<td
									style="width: 16.82%; background-color: rgb(98, 99, 99); text-align: center;"><div
										style="text-align: center;">
										<span style="font-size: 14px;"><span
											style="color: rgb(255, 255, 255);">체중</span></span><span
											style="font-size: 13px;"><br></span>
									</div></td>
								<td style="width: 33.1143%; text-align: center;"><div
										style="text-align: center;"><%=dateAbandon.getWeight()%></div></td>
							</tr>
							<tr>
								<td
									style="width: 18.2668%; background-color: rgb(98, 99, 99); text-align: center;"><div
										style="text-align: center;">
										<span style="font-size: 14px;"><span
											style="color: rgb(255, 255, 255);">상태</span></span><span
											style="font-size: 13px;"><br></span>
									</div></td>
								<td style="width: 31.7989%; text-align: center;"><div
										style="text-align: center;"><%=dateAbandon.getProcessState()%></div></td>
								<td
									style="width: 16.82%; background-color: rgb(98, 99, 99); text-align: center;"><div
										style="text-align: center;">
										<span style="font-size: 14px;"><span
											style="color: rgb(255, 255, 255);">중성화유무</span></span><span
											style="font-size: 13px;"><br></span>
									</div></td>
								<td style="width: 33.1143%; text-align: center;"><div
										style="text-align: center;"><%=dateAbandon.getNeuterYn()%></div></td>
							</tr>
							<tr>
								<td
									style="width: 18.2668%; background-color: rgb(98, 99, 99); text-align: center;"><div
										style="text-align: center;">
										<span style="color: rgb(255, 255, 255); font-size: 14px;">발견장소</span>
									</div></td>
								<td style="width: 31.7989%; text-align: center;"><div
										style="text-align: center;"><%=dateAbandon.getHappenPlace()%></div></td>
								<td
									style="width: 16.82%; background-color: rgb(98, 99, 99); text-align: center;"><div
										style="text-align: center;">
										<span style="color: rgb(255, 255, 255); font-size: 14px;">특징</span>
									</div></td>
								<td style="width: 33.1143%; text-align: center;"><div
										style="text-align: center;"><%=dateAbandon.getSpecialMark()%></div></td>
							</tr>
							<tr>
								<td
									style="width: 18.2668%; background-color: rgb(98, 99, 99); text-align: center;"><div
										style="text-align: center;">
										<span style="color: rgb(255, 255, 255); font-size: 14px;">보호소
											이름</span>
									</div></td>
								<td style="width: 31.7989%; text-align: center;"><div
										style="text-align: center;"><%=dateAbandon.getCareNm()%></div></td>
								<td
									style="width: 16.82%; background-color: rgb(98, 99, 99); text-align: center;"><div
										style="text-align: center;">
										<span style="color: rgb(255, 255, 255); font-size: 14px;">보호소
											전화번호</span>
									</div></td>
								<td style="width: 33.1143%; text-align: center;"><div
										style="text-align: center;"><%=dateAbandon.getCareTel()%></div></td>
							</tr>
						</tbody>
					</table>
					<h2 class="mb-3 mt-5 googleft">보호소 위치정보</h2>
					<p>
					<div id="map" style="width: 100%; height: 400px;"></div></p>
					<div class="tag-widget post-tag-container mb-5 mt-5">
						<div class="tagcloud">
							<a href="#" class="tag-cloud-link">Life</a> <a href="#"
								class="tag-cloud-link">Sport</a> <a href="#"
								class="tag-cloud-link">Tech</a> <a href="#"
								class="tag-cloud-link">Travel</a>
						</div>
					</div>

					<div class="about-author d-flex p-4 bg-light">
						<div class="bio mr-5">
							<img src="images/person_1.jpg" alt="Image placeholder"
								class="img-fluid mb-4">
						</div>
						<div class="desc">
							<h3>George Washington</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Ducimus itaque, autem necessitatibus voluptate quod mollitia
								delectus aut, sunt placeat nam vero culpa sapiente consectetur
								similique, inventore eos fugit cupiditate numquam!</p>
						</div>
					</div>


					<div class="pt-5 mt-5" id="ajaxASDiv">
						<h3 class="mb-5"><%=commentList.size()%>
							Comments
						</h3>
						<ul class="comment-list" id="commentListUL">
							<%
							for (IndexCommentsVO vo : commentList) {
							%>
							<li class="comment">
								<div class="vcard bio">
									<img src="images/person_1.jpg" alt="Image placeholder">
								</div>
								<div class="comment-body">
									<h3>John Doe</h3>
									<div class="meta">April 7, 2020 at 10:05pm</div>
									<p><%=vo.getComment()%></p>
									<p>
										<button class="reply" id="reply" onclick="fnMove('<%=userID%>');" type="button" >Reply</button>
										<button class="reply" id="Del" value="<%=vo.getIndexComments() %>" onclick="Commentdelete(<%=vo.getIndexComments() %>);" type="button" >Del</button>
								</div>
							</li>
							<%
							}
							%>
							<!--  <li class="comment">
								<div class="vcard bio">
									<img src="images/person_1.jpg" alt="Image placeholder">
								</div>
								<div class="comment-body">
									<h3>John Doe</h3>
									<div class="meta">April 7, 2020 at 10:05pm</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Pariatur quidem laborum necessitatibus, ipsam impedit
										vitae autem, eum officia, fugiat saepe enim sapiente iste
										iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
									<p>
										<a href="#" class="reply">Reply</a>
									</p>
								</div>

								<ul class="children">
									<li class="comment">
										<div class="vcard bio">
											<img src="images/person_1.jpg" alt="Image placeholder">
										</div>
										<div class="comment-body">
											<h3>John Doe</h3>
											<div class="meta">April 7, 2020 at 10:05pm</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit. Pariatur quidem laborum necessitatibus, ipsam impedit
												vitae autem, eum officia, fugiat saepe enim sapiente iste
												iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
											<p>
												<a href="#" class="reply">Reply</a>
											</p>
										</div>


										<ul class="children">
											<li class="comment">
												<div class="vcard bio">
													<img src="images/person_1.jpg" alt="Image placeholder">
												</div>
												<div class="comment-body">
													<h3>John Doe</h3>
													<div class="meta">April 7, 2020 at 10:05pm</div>
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing
														elit. Pariatur quidem laborum necessitatibus, ipsam
														impedit vitae autem, eum officia, fugiat saepe enim
														sapiente iste iure! Quam voluptas earum impedit
														necessitatibus, nihil?</p>
													<p>
														<a href="#" class="reply">Reply</a>
													</p>
												</div>

												<ul class="children">
													<li class="comment">
														<div class="vcard bio">
															<img src="images/person_1.jpg" alt="Image placeholder">
														</div>
														<div class="comment-body">
															<h3>John Doe</h3>
															<div class="meta">April 7, 2020 at 10:05pm</div>
															<p>Lorem ipsum dolor sit amet, consectetur
																adipisicing elit. Pariatur quidem laborum
																necessitatibus, ipsam impedit vitae autem, eum officia,
																fugiat saepe enim sapiente iste iure! Quam voluptas
																earum impedit necessitatibus, nihil?</p>
															<p>
																<a href="#" class="reply">Reply</a>
															</p>
														</div>
													</li>
												</ul>
											</li>
										</ul>
									</li>
								</ul>
							</li>

							<li class="comment">
								<div class="vcard bio">
									<img src="images/person_1.jpg" alt="Image placeholder">
								</div>
								<div class="comment-body">
									<h3>John Doe</h3>
									<div class="meta">April 7, 2020 at 10:05pm</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Pariatur quidem laborum necessitatibus, ipsam impedit
										vitae autem, eum officia, fugiat saepe enim sapiente iste
										iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
									<p>
										<a href="#" class="reply">Reply</a>
									</p>
								</div>
							</li> -->
						</ul>
						<!-- END comment-list -->
<!-- 						코멘트 입력 창 -->
						<div class="comment-form-wrap pt-5" id="leaveCommFrm">
							<h3 class="mb-5">Leave a comment</h3>
<!-- 							<form action="#" class="p-5 bg-light" > -->
								<div class="form-group">
									<label for="name">NickName *</label> <input type="text"
										class="form-control" id="name" value="" readonly="readonly">
								</div>

								<div class="form-group">
									<label for="messageCM">Message</label>
									<textarea name="messageCM" id="messageCM" cols="30" rows="10"
										class="form-control"></textarea>
								</div>
								<div class="form-group">
									<input type="button" value="Post Comment"
										class="btn py-3 px-4 btn-primary" name="buttonSubmit">
								</div>

<!-- 							</form> -->
						</div>
					</div>

				</div>
				<!-- .col-md-8 -->
				<div class="col-lg-4 sidebar pl-lg-5 ftco-animate">
					<div class="sidebar-box">
						<form action="#" class="search-form">
							<div class="form-group">
								<span class="fa fa-search"></span> <input type="text"
									class="form-control" placeholder="Type a keyword and hit enter">
							</div>
						</form>
					</div>
					<div class="sidebar-box ftco-animate">
						<div class="categories">
							<h3>Services</h3>
							<li><a href="#">Pet Sitting <span
									class="fa fa-chevron-right"></span></a></li>
							<li><a href="#">Pet Daycare <span
									class="fa fa-chevron-right"></span></a></li>
							<li><a href="#">Pet Grooming <span
									class="fa fa-chevron-right"></span></a></li>
							<li><a href="#">Pet Spa <span
									class="fa fa-chevron-right"></span></a></li>
						</div>
					</div>

					<div class="sidebar-box ftco-animate">
						<h3>Recent Blog</h3>
						<div class="block-21 mb-4 d-flex">
							<a class="blog-img mr-4"
								style="background-image: url(images/image_1.jpg);"></a>
							<div class="text">
								<h3 class="heading">
									<a href="#">Even the all-powerful Pointing has no control
										about the blind texts</a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> April 7,
											2020</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> Admin</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
								</div>
							</div>
						</div>
						<div class="block-21 mb-4 d-flex">
							<a class="blog-img mr-4"
								style="background-image: url(images/image_2.jpg);"></a>
							<div class="text">
								<h3 class="heading">
									<a href="#">Even the all-powerful Pointing has no control
										about the blind texts</a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> April 7,
											2020</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> Admin</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
								</div>
							</div>
						</div>
						<div class="block-21 mb-4 d-flex">
							<a class="blog-img mr-4"
								style="background-image: url(images/image_3.jpg);"></a>
							<div class="text">
								<h3 class="heading">
									<a href="#">Even the all-powerful Pointing has no control
										about the blind texts</a>
								</h3>
								<div class="meta">
									<div>
										<a href="#"><span class="icon-calendar"></span> April 7,
											2020</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> Admin</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="sidebar-box ftco-animate">
						<h3>Tag Cloud</h3>
						<div class="tagcloud">
							<a href="#" class="tag-cloud-link">cat</a> <a href="#"
								class="tag-cloud-link">dog</a> <a href="#"
								class="tag-cloud-link">pet</a> <a href="#"
								class="tag-cloud-link">bird</a> <a href="#"
								class="tag-cloud-link">husky</a> <a href="#"
								class="tag-cloud-link">bulldog</a> <a href="#"
								class="tag-cloud-link">food</a>
						</div>
					</div>

					<div class="sidebar-box ftco-animate">
						<h3>Paragraph</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ducimus itaque, autem necessitatibus voluptate quod mollitia
							delectus aut, sunt placeat nam vero culpa sapiente consectetur
							similique, inventore eos fugit cupiditate numquam!</p>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- .section -->

	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
					<h2 class="footer-heading">Petsitting</h2>
					<p>A small river named Duden flows by their place and supplies
						it with the necessary regelialia.</p>
					<ul class="ftco-footer-social p-0">
						<li class="ftco-animate"><a href="#" data-toggle="tooltip"
							data-placement="top" title="Twitter"><span
								class="fa fa-twitter"></span></a></li>
						<li class="ftco-animate"><a href="#" data-toggle="tooltip"
							data-placement="top" title="Facebook"><span
								class="fa fa-facebook"></span></a></li>
						<li class="ftco-animate"><a href="#" data-toggle="tooltip"
							data-placement="top" title="Instagram"><span
								class="fa fa-instagram"></span></a></li>
					</ul>
				</div>
				<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
					<h2 class="footer-heading">Latest News</h2>
					<div class="block-21 mb-4 d-flex">
						<a class="img mr-4 rounded"
							style="background-image: url(images/image_1.jpg);"></a>
						<div class="text">
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about</a>
							</h3>
							<div class="meta">
								<div>
									<a href="#"><span class="icon-calendar"></span> April 7,
										2020</a>
								</div>
								<div>
									<a href="#"><span class="icon-person"></span> Admin</a>
								</div>
								<div>
									<a href="#"><span class="icon-chat"></span> 19</a>
								</div>
							</div>
						</div>
					</div>
					<div class="block-21 mb-4 d-flex">
						<a class="img mr-4 rounded"
							style="background-image: url(images/image_2.jpg);"></a>
						<div class="text">
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about</a>
							</h3>
							<div class="meta">
								<div>
									<a href="#"><span class="icon-calendar"></span> April 7,
										2020</a>
								</div>
								<div>
									<a href="#"><span class="icon-person"></span> Admin</a>
								</div>
								<div>
									<a href="#"><span class="icon-chat"></span> 19</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 pl-lg-5 mb-4 mb-md-0">
					<h2 class="footer-heading">Quick Links</h2>
					<ul class="list-unstyled">
						<li><a href="#" class="py-2 d-block">Home</a></li>
						<li><a href="#" class="py-2 d-block">About</a></li>
						<li><a href="#" class="py-2 d-block">Services</a></li>
						<li><a href="#" class="py-2 d-block">Works</a></li>
						<li><a href="#" class="py-2 d-block">Blog</a></li>
						<li><a href="#" class="py-2 d-block">Contact</a></li>
					</ul>
				</div>
				<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
					<h2 class="footer-heading">Have a Questions?</h2>
					<div class="block-23 mb-3">
						<ul>
							<li><span class="icon fa fa-map"></span><span class="text">203
									Fake St. Mountain View, San Francisco, California, USA</span></li>
							<li><a href="#"><span class="icon fa fa-phone"></span><span
									class="text">+2 392 3929 210</span></a></li>
							<li><a href="#"><span class="icon fa fa-paper-plane"></span><span
									class="text">info@yourdomain.com</span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-md-12 text-center">

					<p class="copyright">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib.com</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>




	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	-->
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript" src="js/mkc_javascript.js"></script>

<script>
/*네이버 지도 api 좌표로 맵 마크 표시 함수*/

var cityhall = new naver.maps.LatLng(<%=addresses[0]%>, <%=addresses[1]%>),
    map = new naver.maps.Map('map', {
        center: cityhall.destinationPoint(0, 500),
        zoom: 15
    }),
    marker = new naver.maps.Marker({
        map: map,
        position: cityhall
    });

var contentString = [
        '<div class="iw_inner">',
        '   <h4 class="google_ft"><%=dateAbandon.getCareNm()%></h4>',
        '   <p class="google_ft"><%=dateAbandon.getCareAddr()%><br />',
        '   <%=dateAbandon.getOfficetel()%>',
		'   </p>', '</div>' ]
				.join('');

		var infowindow = new naver.maps.InfoWindow({
			content : contentString
		});

		naver.maps.Event.addListener(marker, "click", function(e) {
			if (infowindow.getMap()) {
				infowindow.close();
			} else {
				infowindow.open(map, marker);
			}
		});

		infowindow.open(map, marker);
</script>

</body>
</html>