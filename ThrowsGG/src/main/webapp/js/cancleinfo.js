/**
 * 
 */
  function changeinfo(){
    	  var userinfo = document.userinfo;  
    	  var name = document.getElementById('name');
    	  var phoneNum = document.getElementById('phoneNum');
    	  var email = document.getElementById('email');
    	  if(name.checkValidity()&&phoneNum.checkValidity()&&email.checkValidity()){
    		  frmLogin.method = "post";
    	      frmLogin.action = "infochange.lg";
    	      frmLogin.submit();    // 자바스크립트에서 서블릿으로 전송
    	  }
      }