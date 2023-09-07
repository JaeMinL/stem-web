<%@ page session="true" %>
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<!-- <script>
		function dailyFunction(date){
			$.ajax({
				type: "GET",
				url: "/daily",
				data: {date : date},
				/* dataType: "json", */
				/* dataType: "script", */
				success: function(result){
					console.log(result);
					$("section").remove();
					$("#data_table").load("daily?date="+date);
					/* history.pushState(null, null, "?date="+date); */
				}
				
			});
		}
	
	</script> -->

	<main id="main"> 
		<div id="data_table">
		
		</div>
		<section class="section site-portfolio" style="padding:0 0 0 0;">
			<div class="container">
				<fmt:setLocale value="en_UK" scope="session"/>
				<c:set var="tmp_dt" value="0000 ____" />
				<c:forEach var="daypic" items="${list}" varStatus="status">
				<fmt:formatDate pattern="yyyy MMMM" value="${daypic.taken_dt }" var="yM"/>
				<c:if test="${yM ne tmp_dt}">
					<c:if test="${!status.first }">
				</div>
					</c:if>
				<div class="row mb-3 align-items-center">
					<div class="col-md-12 col-lg-6 mb-5 mb-lg-0" data-aos="fade-up">
						<h3 style="margin:8px 0 0 0"><c:out value="${yM }"/> </h3>
					</div>
				</div>
						<c:set var="tmp_dt" value="${yM }"/>
				<div id="portfolio-grid" class="row no-gutter" data-aos="fade-up" data-aos-delay="200">
					</c:if>
					
					<div class="item col-sm-4 col-md-3 col-lg-3 mb-4 shadow-sm">
						<fmt:formatDate pattern="yyMMdd" value="${daypic.taken_dt }" var="date_id"/>
						<a href="daily?date=${date_id }"  value='${date_id}' class="item-wrap fancybox">
						<%-- <a href="daily?date=${date_id }" onclick="javascript:dailyFunction(${date_id });" value='${date_id}' class="item-wrap fancybox"> --%>
							<div class="work-info">
								<h3><c:out value='${cntPicsHash[daypic.taken_dt] }' /> +</h3>
							</div>
							
							<div class="d-flex justify-content-start align-items-center" style="border-bottom: 0.6px solid #cbd3da">
							<!-- <div class="btn-group">
				                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
				                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
				                </div> -->
								<div class="text-muted" style="font-size:20px">
									<fmt:formatDate pattern="dd E" value="${daypic.taken_dt}"/>
								</div>
							</div>
								      
							<%-- <img class="img-fluid" src='pics/${daypic.thumb_fl_nm}'/> --%>
							<fmt:formatDate pattern="yyyy" value="${daypic.taken_dt }" var="year"/>
							<fmt:formatDate pattern="M" value="${daypic.taken_dt }" var="month"/>
							<img class="img-fluid" src='/pictures/${year }/${month }/${daypic.fl_nm}'/>
							<div class="card-body" style="border-top: 0.6px solid #cbd3da">
								<p class="card-title"><cite>${daypic.title }</cite></p>
								<p class="card-text">${daypic.text }</p>
							</div>
						</a>
						<!-- </div> -->
					</div>		
				</c:forEach>
				</div>
				
			</div>
		</section>
		
  
  <!-- End  Works Section -->

    <!-- ======= Clients Section ======= -->
<%--     <section class="section">
      <div class="container">
        <div class="row justify-content-center text-center mb-4">
          <div class="col-5">
            <h3 class="h3 heading">My Clients</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="${pageContext.request.contextPath}/resources/img/logo-adobe.png" alt="Image" class="img-fluid"></a>
          </div>
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="${pageContext.request.contextPath}/resources/img/logo-uber.png" alt="Image" class="img-fluid"></a>
          </div>
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="${pageContext.request.contextPath}/resources/img/logo-apple.png" alt="Image" class="img-fluid"></a>
          </div>
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="${pageContext.request.contextPath}/resources/img/logo-netflix.png" alt="Image" class="img-fluid"></a>
          </div>
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="${pageContext.request.contextPath}/resources/img/logo-nike.png" alt="Image" class="img-fluid"></a>
          </div>
          <div class="col-4 col-sm-4 col-md-2">
            <a href="#" class="client-logo"><img src="${pageContext.request.contextPath}/resources/img/logo-google.png" alt="Image" class="img-fluid"></a>
          </div>

        </div>
      </div>
    </section> --%><!-- End Clients Section -->

<!--     ======= Services Section =======
    <section class="section">
      <div class="container">
        <div class="row justify-content-center text-center mb-4">
          <div class="col-5">
            <h3 class="h3 heading">My Services</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
          </div>
        </div>
        <div class="row">

          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
            <span class="la la-cube la-3x mb-4"></span>
            <h4 class="h4 mb-2">Web Design</h4>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
            <ul class="list-unstyled list-line">
              <li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
              <li>Non pariatur nisi</li>
              <li>Magnam soluta quod</li>
              <li>Lorem ipsum dolor</li>
              <li>Cumque quae aliquam</li>
            </ul>
          </div>
          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
            <span class="la la-mobile la-3x mb-4"></span>
            <h4 class="h4 mb-2">Mobile Applications</h4>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
            <ul class="list-unstyled list-line">
              <li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
              <li>Non pariatur nisi</li>
              <li>Magnam soluta quod</li>
              <li>Lorem ipsum dolor</li>
              <li>Cumque quae aliquam</li>
            </ul>
          </div>
          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
            <span class="la la-image la-3x mb-4"></span>
            <h4 class="h4 mb-2">Graphic Design</h4>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
            <ul class="list-unstyled list-line">
              <li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
              <li>Non pariatur nisi</li>
              <li>Magnam soluta quod</li>
              <li>Lorem ipsum dolor</li>
              <li>Cumque quae aliquam</li>
            </ul>
          </div>
          <div class="col-12 col-sm-6 col-md-6 col-lg-3">
            <span class="la la-search la-3x mb-4"></span>
            <h4 class="h4 mb-2">SEO</h4>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit explicabo inventore.</p>
            <ul class="list-unstyled list-line">
              <li>Lorem ipsum dolor sit amet consectetur adipisicing</li>
              <li>Non pariatur nisi</li>
              <li>Magnam soluta quod</li>
              <li>Lorem ipsum dolor</li>
              <li>Cumque quae aliquam</li>
            </ul>
          </div>
        </div>
      </div>
    </section>End Services Section -->

    <!-- ======= Testimonials Section ======= -->
    
		<section class="section pt-0">
			<div class="container">
				<div class="owl-carousel testimonial-carousel">	
					<div class="testimonial-wrap">
						<div class="testimonial">
							<img src="${contextPath}/resources/img/person_1.jpg" alt="Image" class="img-fluid">
							<blockquote>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
								Quisquam necessitatibus incidunt ut officiis explicabo inventore.
								</p>
							</blockquote>
							<p>&mdash; Jean Hicks</p>
						</div>
					</div>
			
					<div class="testimonial-wrap">
						<div class="testimonial">
							<img src="${contextPath}/resources/img/person_2.jpg" alt="Image" class="img-fluid">
							<blockquote>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
								Quisquam necessitatibus incidunt ut officiis explicabo inventore.
								</p>
							</blockquote>
							<p>&mdash; Chris Stanworth</p>
						</div>
					</div>
				</div>
			</div>
		</section><!-- End Testimonials Section -->	

	</main><!-- End #main -->
<%@ include file="/WEB-INF/includes/footer.jsp"%>

