// function register(){
//   
//   var name = document.getElementById('name');
//   var phoneNum = document.getElementById('phoneNum');
//   var email = document.getElementById('email');
//   var id = document.getElementById('id');
//   var password = repeatpw;
//   if(name.checkValidity()&&phoneNum.checkValidity()&&email.checkValidity()&&id.checkValidity()&&password&&!idTF){
//         $.ajax({
//            type: "post",
//            url: "insert.lg",
//            dataType:"text",
//            data: {name : name.value,
//            phoneNum : phoneNum.value,
//            email : email.value,
//            id : id.value,
//            password: repeatpassword.value,
//            }
//            }).done(function(data){
//               if(data == "true"){
//                  window.location.href="Welcome.jsp"; //가입 환영 페이지로 이동
//               }else{
//                  
//               }
//            }).error(function(data){
//               alert("가입 실패");
//         })
//
//   }else{
//      
//   }
//}



 function register(){
	
   var formregister = document.formregister;    
   var name = document.getElementById('name');
   var phoneNum = document.getElementById('phoneNum');
   var email = document.getElementById('email');
   var id = document.getElementById('id');
   var password = repeatpw;
   if(name.checkValidity()&&phoneNum.checkValidity()&&email.checkValidity()&&id.checkValidity()&&password&&!idTF){
       formregister.method = "post";
       formregister.action = "insert.lg";
       formregister.submit();    // 자바스크립트에서 서블릿으로 전송

   }else{
      
   }
}