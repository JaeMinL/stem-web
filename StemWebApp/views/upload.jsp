<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/includes/header.jsp"%>
<%@ include file="/WEB-INF/includes/nav.jsp"%>
	
	<!-- <div class="col-md-12 col-lg-6 text-left text-lg-right" data-aos="fade-up" data-aos-delay="100"> -->
				<div class="col-md-12 col-lg-6 text-left text-lg-right">
					<div class="menus" class="menus" style="font-size:20pt">
						<a href="#" >(All)</a>
						<a href="/">Album</a>
						<a href="/amap" >AMap</a>
						<a href="/upload" class="active">+</a>
	            	</div>
				</div>
			</div>
		</div>
	</header>
	
	<main id="main">     
		<section class="section site-portfolio" style="padding:0 0 0 0;">
			<div class="container">
				<div class="row align-items-center" style="margin:8px 8px 10px 8px">
					<!-- <form class="fileform" name="fileForm" action="requestupload2" method="post" enctype="multipart/form-data" data-aos="fade-up">
				       <input multiple="multiple" type="file" name="file" /> </br>
				       <input type="text" name="src" /> </br>
				       <input type="submit" value="전송" /> 
				   	</form> -->
				   	<div class="uploadDiv">
				   		<input type="file" name="uploadImage" accept="image/*" multiple>
				   	</div>
				   	
				   	<button id="uploadBtn">Upload</button>
				   	
				   	<script
				   		src="http://code.jquery.com/jquery-3.3.1.min.js"
				   		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
				   		crossorigin="anonymous">
				   	</script>
				   	
				   	<script>
				   	var formData = new FormData();
				   	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz$)");
				   	var maxSize = 5242880;
				   	
				   	function checkExtension(fileName, fileSize){
				   		
				   		if(fileSize >= maxSize){
				   			alert("파일 사이즈 초과 ");
				   			return false;
				   		}
				   		if(regex.test(fileName)){
				   			alert("해당 종류의 파일은 업로드할 수 없습니다.");
				   			return false;
				   		}
				   		return true;
				   	};
				   	
				   	function fillZero(num){
				   		if (num<10){
				   			return "0"+num;
				   		}
				   		else return num;
				   	}
				   	
				   	var cloneObj = $(".uploadDiv").clone();
				   	
			   		$("#uploadBtn").on("click", function(e){
			   			var inputImage = $("input[name = 'uploadImage' ]");
			   			var images = inputImage[0].files;
			   			
			   			console.log(images);
			   			
			   			for (var i=0; i< images.length; i++){
			   				if(!checkExtension(images[i].name, images[i].size) ){
			   					return false;
			   				}
			   				
			   				formData.append("uploadImage", images[i]);
			   			}
			   			
			   			$.ajax({
			   				url: '/uploadAction',
			   					processData: false,
			   					contentType: false,
			   					data: formData,
			   					type: 'POST',
			   					dataType:'json',
			   					success: function(result){
			   						alert("Uploaded");
			   						formData = new FormData();
			   						console.log(result);
			   						$(".uploadDiv").html(cloneObj.html());
			   						
			   						for(var i=0; i<result.length; i++){
			   							var date = null;
			   							var str = "";
			   							if(result[i].taken_dt){
			   								var tk_dt = new Date(result[i].taken_dt);
			   								var year = tk_dt.getFullYear();
			   								var month = tk_dt.getMonth() + 1;
			   								var path = "/pictures/"+ year +"/"+ month + "/s_"+result[i].fl_nm;
			   								date = year + "-" + fillZero(month) +"-"+ fillZero(tk_dt.getDate());
			   								
			   								str += "<li> <div>";
			   								str += "<div class='img_thumbnail_wrap' ><img class='img_thumbnail' src='" + path + "' </img> </div> :  ";
			   								str += "<div name='calendarDiv'>" + "<input type='date' name='chosenDate' value='" + date + "'/>";
			   								str += "<button type='button' id='updateBtn'>Update</button>";
			   								str += "</div> </li>";
			   								
			   							}else {
			   								var path = "/pictures/etc/s_" + result[i].fl_nm;
			   								
			   								str += "<li> <div>" ;
			   								str += "<div class='img_thumbnail_wrap' ><img class=img_thumbnail src='" + path + "' </img> </div> :  ";
			   								str += "<div name='calendarDiv'>"+"<input type='date' name='chosenDate' />";
			   								str += "<button type='button' id='updateBtn'>Update</button>";
			   								str += "</div> </li>";
			   							}
			   							
			   							$(".uploadResult-list").append(str);
			   							
			   							$(".uploadResult-wrap").off('click').on("click", "button", function() {
			   								var newDate = $(this).prev().val();
			   								var imgPath =  $(this).parent().prev().attr("src");
			   								if(!newDate){
			   									alert("날짜를 선택해주세요.");
			   									return false;
			   								}
			   								//var updateData = {"newDate" : newDate, "imgPath" : imgPath};
			   								
			   								//alert( $(this).parent().children("img").attr("src") );
			   								//console.log(newDate.getFullYear +"-"+ newDate.getMonth() + " : "+ imgPath);
			   					   			$.ajax({
			   					   				url: '/updateAction',
		   					   					processData: true,
		   					   					dataType: 'text',
		   					   					data: {newTakenDt : newDate, thumbnailPath : imgPath},
		   					   					type: 'POST',
		   					   					success: function(result){
		   					   						alert(result);
		   					   						//console.log(updateData);
		   					   					}
			   					   			});  //$.ajax
			   				   			});
			   			
			   						}
			   					}
			   			}); //$.ajax
			   		});
			   		
			   	</script>
				</div>	
			</div>
		</section>
		
		<section class="section pt-0">
			<div class="container">
				<div class="uploadResult-wrap">
					<ul class="uploadResult-list">
					
					</ul>
				</div>
			</div>
		</section> <!-- .uploadresult end-->
	</main><!-- End #main -->
  
<%@ include file="/WEB-INF/includes/footer.jsp"%>