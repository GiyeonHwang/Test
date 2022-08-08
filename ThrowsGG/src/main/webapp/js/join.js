/**
 * 
 */


//     아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
//    아이디 체크하여 가입버튼 비활성화, 중복확인.

  
 function register(){
	
	var name = document.getElementById('name');
	var phoneNum = document.getElementById('phoneNum');
	var email = document.getElementById('email');
	var id = document.getElementById('id');
	var password = repeatpw;
	if(name.checkValidity()&&phoneNum.checkValidity()&&email.checkValidity()&&id.checkValidity()&&password&&!idTF){
			$.ajax({
				type: "post",
				url: "insert.lg",
				dataType:"text",
				data: {name : name.value,
				phoneNum : phoneNum.value,
				email : email.value,
				id : id.value,
				password: repeatpassword.value,
				}
				}).done(function(data){
					alert("done");
					if(data == true){
						window.location.href="welcome.jsp";
					}else{
						
					}
				}).error(function(data){
					alert("가입 실패");
			})

	}else{
		
	}
}

 
 
// var mysql = require('mysql');
// 
// var client = mysql.createConnection({
//	user: 'root',
//	password: '1234'
//})
//
//client.query('use people');
//
//alert(client.query('select * from member;'));
