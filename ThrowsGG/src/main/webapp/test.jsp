<script>
var autocheckid = function(str){
	var id = $('#id').val();
	$.ajax({
		url : "join.html",
		type : "post",
		data : {id:id},
		dataType : "text",
		success : funcion(result){
			return str;
		}
		error:function(){
			alert("error");
		}
	});
};
)}
	
</script>
<script>
var id = document.getElementById('id');
id.onkeyup = function(){
	console.log(this.value);
	this.value = autocheckid(this.value);
}
</script>


<!-- ajax({ -->
<!-- 	type:"post", -->
<!-- 	url:"/ajaxTest", -->
<!-- 	data:"", -->
<!-- 	dataType:"html", -->
<!-- 	success: function(res){ -->
<!-- 		console.log("success :: "+res); -->
<!-- 	} -->
<!-- }) -->