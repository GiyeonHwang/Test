/**
 * 
 */
 
// <!-- id 중복 확인 체크  -->
//     아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
    var idTF = true;
    document.getElementById('id-success').style.display = 'none';
	document.getElementById('id-danger').style.display = 'none';
    $("#id").keyup(function checkId() {
        var inputed = $('#id').val();
        $.ajax({
        	type:"POST",
            url : "checkid.lg",
            dataType:"text",
            data : {id : inputed},
        }).done(function(data) {
               if (data == "true") {
            	    document.getElementById('id-success').style.display = 'none';
                	document.getElementById('id-danger').style.display = '';
                	idTF = true;
                } else if (data == "false") {
                	document.getElementById('id-danger').style.display = 'none';
                    document.getElementById('id-success').style.display = '';
                    idTF = false;
                } 
            }).error(function(data){
            	document.getElementById('id-success').style.display = 'none';
            	document.getElementById('id-danger').style.display = '';
            	idTF = true;
            })
        });

