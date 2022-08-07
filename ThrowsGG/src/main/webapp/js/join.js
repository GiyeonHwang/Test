/**
 * 
 */


 var repeatpassword = document.getElementById('registerRepeatPassword');
	document.getElementById('alert-success').style.display = 'none';
	document.getElementById('alert-danger').style.display = 'none';
var repeatpw = null;		
	repeatpassword.onkeyup = function repeat(){
		var p1 = document.getElementById('registerPassword').value;
      	var p2 = document.getElementById('registerRepeatPassword').value;
      	if(p1 !="" || p2 != ""){
			 if( p1 != p2 ) {
				document.getElementById('alert-success').style.display = 'none';
				document.getElementById('alert-danger').style.display = '';
				repeatpw = false;
		      } else{
				document.getElementById('alert-danger').style.display = 'none';
		        document.getElementById('alert-success').style.display = '';
		        repeatpw = true;
		      }
}

};


 function register(){
	
	var name = document.getElementById('name');
	var phoneNum = document.getElementById('phoneNum');
	var email = document.getElementById('email');
	var id = document.getElementById('id');
	var password = repeatpw;
	
	if(name.checkValidity()&&phoneNum.checkValidity()&&email.checkValidity()&&id.checkValidity()&&password){
		window.location.href="join.jsp";
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
