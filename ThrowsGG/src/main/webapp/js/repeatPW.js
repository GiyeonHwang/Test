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