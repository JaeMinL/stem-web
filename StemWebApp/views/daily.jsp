<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/includes/header.jsp"%>
<%@ include file="/WEB-INF/includes/nav.jsp"%>	
	<!-- <div class="col-md-12 col-lg-6 text-left text-lg-right" data-aos="fade-up" data-aos-delay="100"> -->
				<div class="col-md-12 col-lg-6 text-left text-lg-right">
					<div class="menus" class="menus" style="font-size:20pt">
						<a href="#" >(All)</a>
						<a href="/" class="active">Album</a>
						<a href="/amap" >AMap</a>
						<a href="/upload" >+</a>
	            	</div>
				</div>
			</div>
		</div>
	</header>
	
	<script
  		src="http://code.jquery.com/jquery-3.3.1.min.js"
  		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  		crossorigin="anonymous">
  	</script>
	
	<script>
		$(document).ready(function(){
			$('input[name=image-list]').click(function() {
	            $(".main-thumbnail .img-fluid").attr("src", this.value);
	            $("#chosen-image").removeAttr("id");
	            $(this).prop('id', 'chosen-image');
	        });
	    });
		
		
		
		// Next/previous controls
		/* function plusSlides(n) {
		  showSlides(slideIndex += n);
		} */
		
		function plusSlides() {
			var chosen = document.getElementById('chosen-image');
			if(!chosen.parentElement.parentElement.nextElementSibling){
				/* alert("to start"); */
				return ;
			}
			var next_input = chosen.parentElement.parentElement.nextElementSibling.firstElementChild;
			if (next_input.className == "input-image-wrap"){
				var thumb_ele = document.getElementsByClassName('main-thumbnail')[0].children[1];
				thumb_ele.setAttribute("src", next_input.children[0].getAttribute("value"));
				chosen.removeAttribute("id");
				next_input.firstElementChild.setAttribute('id', 'chosen-image');
			}
		}
		
		function minusSlides() {
			var chosen = document.getElementById('chosen-image');
			if(!chosen.parentElement.parentElement.previousElementSibling){
				return ;
			}
			var prev_input = chosen.parentElement.parentElement.previousElementSibling.firstElementChild;
			if (prev_input.className == "input-image-wrap"){
				var thumb_ele = document.getElementsByClassName('main-thumbnail')[0].children[1];
				thumb_ele.setAttribute("src", prev_input.children[0].getAttribute("value"));
				chosen.removeAttribute("id");
				prev_input.firstElementChild.setAttribute('id', 'chosen-image');
			}
		}
		
	</script>
	
	<main id="main"> 
	<fmt:setLocale value="en_UK" scope="session"/>
		<section id="daily-pictures" class="section">
		
			<div class="container" data-aos="fade-up">
				<div id="pictures-grid" class="row no-gutter">
					<div class="item mb-0">
						<h2 class="date-head">
						<fmt:formatDate pattern="yyyy.MM.dd (E)" value="${mainPic.taken_dt }" var="taken_dt"/>
						<c:out value='${taken_dt }'/>
						</h2>
					</div>
				</div>
			</div>
			
			<div class="container" data-aos="fade-up">
				<div class="picture-grid row no-gutter align-items-start" >
					<div class="main-thumbnail item col-8 mb-1 ">
						<a class="prev" onclick="minusSlides()">&#10094;</a>
						<fmt:formatDate pattern="yyyy" value="${mainPic.taken_dt }" var="thumbY"/>
						<fmt:formatDate pattern="M" value="${mainPic.taken_dt }" var="thumbM"/>
						<img class="img-fluid" src='/pictures/${thumbY }/${thumbM }/${mainPic.fl_nm}'/>
						<!-- Next and previous buttons -->
						<a class="next" onclick="plusSlides()">&#10095;</a>
					</div>
					
					<div class="content-grid item col-4 mb-1">
						<div class="content-item">
							<h4 id="title" >${mainPic.title }</h4>
							<p id="text">${mainPic.text }ll</p>
						</div>
						<div class="updateBtnDiv"><a href="#">[수정]</a> </div>
					</div>
				</div>
			</div>
			
			<div class="container">
				<div class="pictures-list-grid row no-gutter align-items-start" data-aos="fade-up" data-aos-delay="200">
					<c:forEach var="image" items="${list }" varStatus="status">
						<div class="pictures-list item ">
							<fmt:formatDate pattern="yyyy" value="${image.taken_dt }" var="year"/>
							<fmt:formatDate pattern="M" value="${image.taken_dt }" var="month"/>
							<c:choose>
								<c:when test="${image.fl_nm eq mainPic.fl_nm }">
									<div class="input-image-wrap">
										<input id="chosen-image" type="image" name="image-list" class="img-fluid shadow-sm" src="/pictures/${year }/${month }/s_${image.fl_nm}" value ="/pictures/${year }/${month }/${image.fl_nm}"/>	
									</div>
								</c:when>
								<c:otherwise>
									<div class="input-image-wrap">
										<input type="image" name="image-list" class="img-fluid shadow-sm" src="/pictures/${year }/${month }/s_${image.fl_nm}" value ="/pictures/${year }/${month }/${image.fl_nm}"/>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
				</div>
				
			</div>
			
		
		</section>
	
	</main><!-- End #main -->
<%@ include file="/WEB-INF/includes/footer.jsp"%>