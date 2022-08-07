<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
 
//     아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
    $("#id").onkeyup(function checkId() {
        var inputed = $('.id').val();
        $.ajax({
        	type:"post",
            data : {
                id : inputed
            },
            url : "checkid",
            done : function(data) {
                if(inputed=="" && data=='0') {
                    alert("gggg");
                } else if (data == '0') {
                    alert("gg");
                } else if (data == '1') {
                    alert("gggggggg");
                } 
            }
        });
    }

</body>
</html>