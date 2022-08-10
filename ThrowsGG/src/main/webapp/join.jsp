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
body {
	position: relative;
	padding-top: 0;
}

main {
	padding-left: 240px;
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

	<main>
		<div class="container my-5">
			<div class="row">
				<!-- Left column -->
				<div class="col-md-10 mb-4 mb-md-0">
					<!--Section: Docs content-->
					<section>

						<!--Section: login register example-->
						<section id="section-login-register-example">
							<!-- Section title -->
							<h2 class="my-5 mb-2">Login - register</h2>
							<!-- Section: Demo -->
							<section class="border p-4 text-center w-100 rounded-top">
								<div class="container d-flex flex-column w-50">
									<!-- Pills navs -->
									<ul class="nav nav-pills nav-justified mb-3" id="ex1"
										role="tablist">
										<li class="nav-item" role="presentation"><a
											class="nav-link active" id="tab-login" data-mdb-toggle="pill"
											href="#pills-login" role="tab" aria-controls="pills-login"
											aria-selected="true">Login</a></li>
										<li class="nav-item" role="presentation"><a
											class="nav-link" id="tab-register" data-mdb-toggle="pill"
											href="#pills-register" role="tab"
											aria-controls="pills-register" aria-selected="false">Register</a>
										</li>
									</ul>
									<!-- Pills navs -->

									<!-- Pills content -->
									<!-- 로그인 시작 -->
									<div class="tab-content">
										<div class="tab-pane fade show active" id="pills-login"
											role="tabpanel" aria-labelledby="tab-login">
											<!-- 											<form> -->

											<!-- Email input -->
											<div class="form-outline mb-4">
												<input type="text" id="loginid" class="form-control" /> <label
													class="form-label" for="loginName">id</label>
											</div>

											<!-- Password input -->
											<div class="form-outline mb-4">
												<input type="password" id="loginPassword"
													class="form-control" /> <label class="form-label"
													for="loginPassword">Password</label>
											</div>
											<div class="alert alert-danger" id="login-danger">아이디나
												비밀번호를 다시 확인하세요.</div>

											<!-- 2 column grid layout -->
											<div class="row mb-4">
												<div class="col-md-6 d-flex justify-content-center">
													<!-- Checkbox -->
													<div class="form-check mb-3 mb-md-0">
														<input class="form-check-input-check" type="checkbox"
															value="" id="loginCheck" checked /> <label
															class="form-check-label" for="loginCheck">
															Remember me </label>
													</div>
												</div>

												<div class="col-md-6 d-flex justify-content-center">
													<!-- Simple link -->
													<a href="#!">Forgot password?</a>
												</div>
											</div>

											<!-- Submit button -->
											<button type="submit" onclick=signup() id="loginbutton"
												class="btn btn-primary btn-block mb-4">Sign in</button>
											<!-- 로그인 부분 끝 -->
											<!-- 회원 가입 부분 -->
											<!-- Register buttons -->
											<div class="text-center">
												<p>
													Not a member? <a href="#!">Register</a>
												</p>
											</div>
											<!-- 											</form> -->
										</div>
										<div class="tab-pane fade" id="pills-register" role="tabpanel"
											aria-labelledby="tab-register">
											<form class="row g-3 needs-validation" novalidate
												name="formregister" method="post" action="insert.lg"
												encType="UTF-8">
												<!-- Nickname input -->
												<div class="form-outline mb-4">
													<input type="text" id="name" class="form-control" name="name" required
														minlength="2" maxlength="10" placeholder="2자 이상" /> <label
														class="form-label" for="registerName">Nickname</label>
												</div>

												<!-- phone input -->
												<div class="form-outline mb-4">
													<input type="tel" class="form-control" name="phone"
														id="phone" required
														pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13" 
														placeholder=" - 자동" /> <label class="form-label"
														for="registerUsername">phone number</label>
												</div>

												<!-- Email input -->
												<div class="form-outline mb-4">
													<input type="email" id="email" name="email" class="form-control"
														required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
														maxlength="30" placeholder="ex)abc123@gmail.com" /> <label
														class="form-label" for="loginName">Email</label>
												</div>


												<!-- id input -->
												<div class="form-outline mb-4">
													<input type="text" id="id" name="id" class="form-control" required
														minlength="5" maxlength="20" placeholder="5자 이상" /> <label
														class="form-label" for="registerEmail">id</label>
												</div>
												<div class="alert alert-danger" id="id-danger">사용중인
													아이디 입니다.</div>
												<div class="alert alert-success" id="id-success">사용
													가능한 아이디 입니다.</div>



												<!-- Password input -->
												<div class="form-outline mb-4">
													<input type="password" id="registerPassword" name="password"
														class="form-control" required
														pattern="(?=.*\d)(?=.*[a-zA-Z])(?=.*[0-9]).{8,}"
														minlength="8" maxlength="20" placeholder="숫자와 영어 포함 8자 이상" />
													<label class="form-label" for="registerPassword">Password</label>
												</div>

												<!-- Repeat Password input -->
												<div class="form-outline mb-4">
													<input type="password" id="registerRepeatPassword"
														class="form-control" required
														pattern="(?=.*\d)(?=.*[a-zA-Z])(?=.*[0-9]).{8,}"
														minlength="8" maxlength="20" /> <label class="form-label"
														for="registerRepeatPassword">Repeat password</label>
												</div>

												<div class="alert alert-danger" id="alert-danger">비밀번호가
													일치하지 않습니다.</div>
												<div class="alert alert-success" id="alert-success">비밀번호가
													일치합니다.</div>

												<!-- Checkbox -->
												<div class="form-check d-flex justify-content-center mb-4">
													<input class="form-check-input-check me-2" type="checkbox"
														value="" id="registerCheck" checked
														aria-describedby="registerCheckHelpText" /> <label
														class="form-check-label" for="registerCheck"> I
														have read and agree to the terms </label>
												</div>

												<!-- Submit button -->
												<button type="submit" onclick=register()
													class="btn btn-primary btn-block mb-3" id="submit">회원
													가입</button>
											</form>
										</div>
									</div>
									<!-- Pills content -->
								</div>
							</section>

							<!-- Section: Demo -->

						</section>
						<!--Section: login register example-->

					</section>

				</div>
				<!-- Left column -->


			</div>
		</div>
	</main>

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
	<script src="js/telcheck.js"></script>
	<script src="js/login-check.js"></script>
	<script src="js/repeatPW.js"></script>
	<script src="js/idoverlapcheck.js"></script>
	<script src="js/join.js"></script>
	<script src="js/signup.js"></script>


</body>

</html>