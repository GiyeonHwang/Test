<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ajaxtest.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Material Design for Bootstrap</title>
<!-- MDB icon -->
<link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon" />
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
<!-- Google Fonts Roboto -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
<!-- MDB -->
<link rel="stylesheet" href="css/mdb.min.css" />

<!-- Prism -->
<link rel="stylesheet"
	href="https://mdbgo.io/mikolaj-smolenski/mdb5-demo-pro/dev/css/new-prism.css" />
<!-- Custom styles -->
<style>
main {
	padding-left: 240px;
}

body {
	background: #f5f5f5;
	margin-top: 20px;
	position: relative;
	padding-top: 0;
}

.ui-w-80 {
	width: 80px !important;
	height: auto;
}

.btn-default {
	border-color: rgba(24, 28, 33, 0.1);
	background: rgba(0, 0, 0, 0);
	color: #4E5155;
}

label.btn {
	margin-bottom: 0;
}

.btn-outline-primary {
	border-color: #26B4FF;
	background: transparent;
	color: #26B4FF;
}

.btn {
	cursor: pointer;
}

.text-light {
	color: #6c757c !important;
}

.btn-facebook {
	border-color: rgba(0, 0, 0, 0);
	background: #3B5998;
	color: #fff;
}

.btn-instagram {
	border-color: rgba(0, 0, 0, 0);
	background: #000;
	color: #fff;
}

.card {
	background-clip: padding-box;
	box-shadow: 0 1px 4px rgba(24, 28, 33, 0.012);
}

.row-bordered {
	overflow: hidden;
}

.account-settings-fileinput {
	position: absolute;
	visibility: hidden;
	width: 1px;
	height: 1px;
	opacity: 0;
}

.account-settings-links .list-group-item.active {
	font-weight: bold !important;
}

html:not(.dark-style) .account-settings-links .list-group-item.active {
	background: transparent !important;
}

.account-settings-multiselect ~ .select2-container {
	width: 100% !important;
}

.light-style .account-settings-links .list-group-item {
	padding: 0.85rem 1.5rem;
	border-color: rgba(24, 28, 33, 0.03) !important;
}

.light-style .account-settings-links .list-group-item.active {
	color: #4e5155 !important;
}

.material-style .account-settings-links .list-group-item {
	padding: 0.85rem 1.5rem;
	border-color: rgba(24, 28, 33, 0.03) !important;
}

.material-style .account-settings-links .list-group-item.active {
	color: #4e5155 !important;
}

.dark-style .account-settings-links .list-group-item {
	padding: 0.85rem 1.5rem;
	border-color: rgba(255, 255, 255, 0.03) !important;
}

.dark-style .account-settings-links .list-group-item.active {
	color: #fff !important;
}

.light-style .account-settings-links .list-group-item.active {
	color: #4E5155 !important;
}

.light-style .account-settings-links .list-group-item {
	padding: 0.85rem 1.5rem;
	border-color: rgba(24, 28, 33, 0.03) !important;
}
</style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">

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
</head>

<body data-mdb-spy="scroll" data-mdb-target="#scrollspy1"
	data-mdb-offset="1" class="scrollspy-example">
	<!-- YOUR WORK HERE -->
	<jsp:include page="Nav.jsp"></jsp:include>

	<div class="container light-style flex-grow-1 container-p-y">

		<h4 class="font-weight-bold py-3 mb-4">Account settings</h4>

		<div class="card overflow-hidden">
			<div class="row no-gutters row-bordered row-border-light">
				<div class="col-md-3 pt-0">
					<div class="list-group list-group-flush account-settings-links">
						<a class="list-group-item list-group-item-action active"
							data-toggle="list" href="#account-general">정보</a> <a
							class="list-group-item list-group-item-action" data-toggle="list"
							href="#account-change-password">비밀번호 변경</a> <a
							class="list-group-item list-group-item-action" data-toggle="list"
							href="#account-info">신청현황</a> <a
							class="list-group-item list-group-item-action" data-toggle="list"
							href="#account-social-links">Social links</a> <a
							class="list-group-item list-group-item-action" data-toggle="list"
							href="#account-connections">Connections</a> <a
							class="list-group-item list-group-item-action" data-toggle="list"
							href="#account-notifications">Notifications</a>
					</div>
				</div>
				<div class="col-md-9">
					<div class="tab-content">
						<div class="tab-pane fade active show" id="account-general">

							<div class="card-body media align-items-center">
								<div id="editor" class="d-block ui-w-80" contenteditable="true">
									<img id='output' alt="" class="d-block ui-w-80"
										src="https://bootdey.com/img/Content/avatar/avatar1.png">
								</div>
								<!-- 								<div alt="" class="d-block ui-w-80"> -->
								<!-- 									<img src="https://bootdey.com/img/Content/avatar/avatar1.png" -->
								<!-- 										alt="" class="d-block ui-w-80"> -->
								<!-- 								</div> -->
								<div class="media-body ml-4">
									<label class="btn btn-outline-primary"> Upload new
										photo<input id="img-selector"
										class="account-settings-fileinput" type="file"
										accept="image/*" onchange='openFile(event)'>
									</label> &nbsp;
									<button type="button" class="btn btn-default md-btn-flat"
										onclick=resetimg()>Reset</button>

									<div class="text-light1 small mt-1" style="color: #6c757d">Allowed
										JPG, GIF or PNG. Max size of 800K</div>
								</div>
							</div>
							<hr class="border-light m-0">
							
							<div class="card-body">
							<form name="userinfo">
								<div class="form-group">
									<label class="form-label">Name</label> <input type="text"
										class="form-control" id="name" name ="name"
										value=<%out.println((String) session.getAttribute("name"));%>
										required minlength="2" maxlength="10" placeholder="2자 이상">
								</div>
								<div class="form-group">
									<label class="form-label">E-mail</label> <input type="email"
										id="email" required
										pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
										maxlength="30" placeholder="ex)abc123@gmail.com"
										class="form-control mb-1"
										value=<%out.println((String) session.getAttribute("email"));%>>
								</div>
								<div class="form-group">
									<label class="form-label">phone</label> <input type="text"
										class="form-control"
										value=<%out.println((String) session.getAttribute("phone"));%>
										id="phoneNum" required
										pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13"
										placeholder=" - 자동">
								</div>
								<div class="form-group">
								</form>
								<div class="text-right mt-3">
			<button type="button" class="btn btn-primary" onclick= changeinfo()>정보 저장</button>
			&nbsp;
			<button type="button" class="btn btn-primary" onclick= cancleinfo()>취소</button>
							</div>
							</div>

		</div>
						</div>
						<div class="tab-pane fade" id="account-change-password">
							<div class="card-body pb-2">

								<div class="form-group">
									<label class="form-label">Current password</label> <input
										type="password" class="form-control">
								</div>

								<div class="form-group">
									<label class="form-label">New password</label> <input
										type="password" class="form-control">
								</div>

								<div class="form-group">
									<label class="form-label">Repeat new password</label> <input
										type="password" class="form-control">
								</div>
								<div class="form-group">
								<div class="text-right mt-3">
			<button type="button" class="btn btn-primary" onclick= change()>정보 저장</button>
			&nbsp;
			<button type="button" class="btn btn-primary" >취소</button>
							</div>
							</div>

							</div>
						</div>
						<div class="tab-pane fade" id="account-info">
							<div class="card-body pb-2">

								<div class="form-group">
									<label class="form-label">Bio</label>
									<textarea class="form-control" rows="5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nunc arcu, dignissim sit amet sollicitudin iaculis, vehicula id urna. Sed luctus urna nunc. Donec fermentum, magna sit amet rutrum pretium, turpis dolor molestie diam, ut lacinia diam risus eleifend sapien. Curabitur ac nibh nulla. Maecenas nec augue placerat, viverra tellus non, pulvinar risus.</textarea>
								</div>
								<div class="form-group">
									<label class="form-label">Birthday</label> <input type="text"
										class="form-control" value="May 3, 1995">
								</div>
								<div class="form-group">
									<label class="form-label">Country</label> <select
										class="custom-select">
										<option>USA</option>
										<option selected="">Canada</option>
										<option>UK</option>
										<option>Germany</option>
										<option>France</option>
									</select>
								</div>


							</div>
							<hr class="border-light m-0">
							<div class="card-body pb-2">

								<h6 class="mb-4">Contacts</h6>
								<div class="form-group">
									<label class="form-label">Phone</label> <input type="text"
										class="form-control" value="+0 (123) 456 7891">
								</div>
								<div class="form-group">
									<label class="form-label">Website</label> <input type="text"
										class="form-control" value="">
								</div>

							</div>

						</div>
						<div class="tab-pane fade" id="account-social-links">
							<div class="card-body pb-2">

								<div class="form-group">
									<label class="form-label">Twitter</label> <input type="text"
										class="form-control" value="https://twitter.com/user">
								</div>
								<div class="form-group">
									<label class="form-label">Facebook</label> <input type="text"
										class="form-control" value="https://www.facebook.com/user">
								</div>
								<div class="form-group">
									<label class="form-label">Google+</label> <input type="text"
										class="form-control" value="">
								</div>
								<div class="form-group">
									<label class="form-label">LinkedIn</label> <input type="text"
										class="form-control" value="">
								</div>
								<div class="form-group">
									<label class="form-label">Instagram</label> <input type="text"
										class="form-control" value="https://www.instagram.com/user">
								</div>

							</div>
						</div>
						<div class="tab-pane fade" id="account-connections">
							<div class="card-body">
								<button type="button" class="btn btn-twitter">
									Connect to <strong>Twitter</strong>
								</button>
							</div>
							<hr class="border-light m-0">
							<div class="card-body">
								<h5 class="mb-2">
									<a href="javascript:void(0)"
										class="float-right text-muted text-tiny"><i
										class="ion ion-md-close"></i> Remove</a> <i
										class="ion ion-logo-google text-google"></i> You are connected
									to Google:
								</h5>
								nmaxwell@mail.com
							</div>
							<hr class="border-light m-0">
							<div class="card-body">
								<button type="button" class="btn btn-facebook">
									Connect to <strong>Facebook</strong>
								</button>
							</div>
							<hr class="border-light m-0">
							<div class="card-body">
								<button type="button" class="btn btn-instagram">
									Connect to <strong>Instagram</strong>
								</button>
							</div>
						</div>
						<div class="tab-pane fade" id="account-notifications">
							<div class="card-body pb-2">

								<h6 class="mb-4">Activity</h6>

								<div class="form-group">
									<label class="switcher"> <input type="checkbox"
										class="switcher-input" checked=""> <span
										class="switcher-indicator"> <span class="switcher-yes"></span>
											<span class="switcher-no"></span>
									</span> <span class="switcher-label">Email me when someone
											comments on my article</span>
									</label>
								</div>
								<div class="form-group">
									<label class="switcher"> <input type="checkbox"
										class="switcher-input" checked=""> <span
										class="switcher-indicator"> <span class="switcher-yes"></span>
											<span class="switcher-no"></span>
									</span> <span class="switcher-label">Email me when someone
											answers on my forum thread</span>
									</label>
								</div>
								<div class="form-group">
									<label class="switcher"> <input type="checkbox"
										class="switcher-input"> <span
										class="switcher-indicator"> <span class="switcher-yes"></span>
											<span class="switcher-no"></span>
									</span> <span class="switcher-label">Email me when someone
											follows me</span>
									</label>
								</div>
							</div>
							<hr class="border-light m-0">
							<div class="card-body pb-2">

								<h6 class="mb-4">Application</h6>

								<div class="form-group">
									<label class="switcher"> <input type="checkbox"
										class="switcher-input" checked=""> <span
										class="switcher-indicator"> <span class="switcher-yes"></span>
											<span class="switcher-no"></span>
									</span> <span class="switcher-label">News and announcements</span>
									</label>
								</div>
								<div class="form-group">
									<label class="switcher"> <input type="checkbox"
										class="switcher-input"> <span
										class="switcher-indicator"> <span class="switcher-yes"></span>
											<span class="switcher-no"></span>
									</span> <span class="switcher-label">Weekly product updates</span>
									</label>
								</div>
								<div class="form-group">
									<label class="switcher"> <input type="checkbox"
										class="switcher-input" checked=""> <span
										class="switcher-indicator"> <span class="switcher-yes"></span>
											<span class="switcher-no"></span>
									</span> <span class="switcher-label">Weekly blog digest</span>
									</label>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		

	</div>

	<!-- Prism -->

	<script type="text/javascript"
		src="https://mdbgo.io/mikolaj-smolenski/mdb5-demo-pro/dev/js/new-prism.js"></script>
	<script type="text/javascript"
		src="https://mdbgo.io/mikolaj-smolenski/mdb5-demo-pro/dev/js/dist/mdbsnippet.min.js"></script>
	<!-- MDB -->
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<!-- Custom scripts -->
	<script type="text/javascript"></script>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

	<!-- YOUR WORK HERE -->
	<script>
 var openFile = function(event) {
        var input = event.target;

        var reader = new FileReader();
        reader.onload = function(){
          var dataURL = reader.result;
          var output = document.getElementById('output');
          output.src = dataURL;
//           var editor = document.getElementById('editor');
//           editor.src = dataURL;
        };
        reader.readAsDataURL(input.files[0]);
      };
      
      function resetimg(){
    	  var output = document.getElementById('output');
          output.src = "https://bootdey.com/img/Content/avatar/avatar1.png";
      }
      
    
      
      function cancleinfo(){
//     	  var name = document.forms['userinfo']['name'];
//     	  console.log(name.value);
    	  <%
    	  String name = (String)session.getAttribute("name");
    	  String email = (String)session.getAttribute("email");
    	  String phone = (String)session.getAttribute("phone");

    	  %>
<%--     	  name.setAttribute('value','<%out.print(name);%>'); --%>
    	  document.getElementById('name').value='<%out.print(name);%>';
    	  document.getElementById('email').value='<%out.print(email);%>';
    	  $('#phoneNum').val('<%out.print(phone);%>');
      }
      </script>

	<script src="js/telcheck.js"></script>
	<script src="js/repeatPW.js"></script>

</body>

</html>