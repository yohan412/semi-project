<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"> src="JSON/location.json"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	widow.onload=function(){
		
	}
	
	
            $(document).ready(function(){
                var obj = new Object();
                obj.name = "여자친구"
                obj.members = ["소원", "예린", "은하", "유주", "신비", "엄지"];
                obj.albums = {"EP 1집": "Season of Glass", "EP 2집": "Flower Bud",
                              "EP 3집": "Snowflake",       "정규 1집": "LOL"};
 
                var obj_s = JSON.stringify(obj);
 
                $("#json_output").html(obj_s,null,"\t");
                
                var dataUri = "data:application/json;charset=utf-8,"+ encodeURIComponent(obj_s);
                var link = $("#link").attr("href", dataUri);
            });
</script>
<title>Insert title here</title>
</head>
<body>
	<a href="#" id="link" download="sample.json">download</a>
</body>
</html>