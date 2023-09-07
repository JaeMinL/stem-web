<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>


<!-- var regex = new RegExp("(.*?)\.(exe|sh|zip|alz$)");
var maxSize = 5242880;

function checkExtension(fileName, fileSize){
	
	if(fileSize>=maxSize){
		alter("파일 사이즈 초과 ");
		return false;
	}
	
	if(regex.test(fileName)){
		alter("해당 종류의 파일을 업로드할 수 없습니다. ");
		return false;
	}
		
	return true;	
}

$("uploadBtn").on("click", function(e){
	var forData = new FormData();
	
	var inputFile = $("input[name = 'uploadFile' ]");
	
	var files = inputFile[0].files;
	
	consol.log(files);
	
	for(var i = 0; i < files.length; i++){
		if(!checkExtension(files[i].name, files[i].size) ){
			return false;
		}
		formData.append("uploadFile", files[i]);
	}

	$.ajax({
		upl: '/uploadAction',
		processData : false,
		contentType: false,
		data: formData,
			type: 'POST',
			success: function(result){
				alert("Uploaded");

			}
	}); //$.ajax
});-->
