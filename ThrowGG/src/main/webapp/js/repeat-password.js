  	
  	document.getElementById('alert-danger').style.display = 'none';
	document.getElementById('alert-success').style.display = 'none';
	

	var repeatpassword = document.getElementById('registerRepeatPassword');
	repeatpassword.onkeyup = function(){
		var p1 = document.getElementById('registerPassword').value;
      	var p2 = document.getElementById('registerRepeatPassword').value;
      	
      	if(p1 !="" || p2 != ""){
			 if( p1 != p2 ) {
				document.getElementById('alert-success').style.display = 'none';
				document.getElementById('alert-danger').style.display = '';
				
		      } else{
				document.getElementById('alert-danger').style.display = 'none';
		         document.getElementById('alert-success').style.display = '';
		      }
}	
};