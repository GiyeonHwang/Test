<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	naver.maps.Service.geocode({
		address : '서울'
	}, function(status, response) {
		if (status === naver.maps.Service.Status.ERROR) {
			return alert('Something wrong!');
		}
		var new_position = new naver.maps.LatLng(response.v2.addresses[0].y,
				response.v2.addresses[0].x)
		map.setCenter(new_position);

		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(response.v2.addresses[0].y,
					response.v2.addresses[0].x),
			map : map
		});
	});
	/*const locations = [
	 { place:"건대입구역", lat: 37.539922, lng: 127.070609 }
	 ];

	 var map = new naver.maps.Map('map', {
	 center: new naver.maps.LatLng(37.539922, 127.070609),
	 zoom: 14
	 });

	 for (var i = 0; i < locations.length; i++) {
	 var marker = new naver.maps.Marker({
	 map: map,
	 title: locations[i].place,
	 position: new naver.maps.LatLng(locations[i].lat, locations[i].lng),
	 });
	 }*/
</script>
</head>
<body>

</body>
</html>