<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<body>
 <!-- ======= Navbar ======= -->
	<header>
		<div class="collapse navbar-collapse custom-navmenu" id="main-navbar">
			<div class="container py-2 py-md-5">
				<div class="row align-items-start">
					<div class="col-md-6 d-none d-md-block  mr-auto">
						<div class="tweet d-flex">
							<div><h3>About</h3>
								<p><em>${host.name} : <br>
								${host.introduct}<br>
								</em></p>
							</div>
						</div>
					</div>
					<div class="col-md-5 d-none d-md-block">
						<h3>Contract</h3>
						<p>instagram : ${host.instaID} <br>
							phone : ${host.phoneNo} <br>
							e-mail : ${host.email } <br>
						</p>
					</div>
				</div>
			</div>
		</div>

		<nav class="navbar navbar-light custom-navbar">
			<div class="container">
			 	<a class="navbar-brand" href="/">ALog 
			 	<small class="text-muted" style="font-size: 13pt;">: The Log based on Albums</small></a>
				<a href="#" class="burger" data-toggle="collapse" data-target="#main-navbar">
			    <span></span>
			  	</a>
			</div>
		</nav> 

		<div class="container">
			<div class="row mb-5 align-items-center">
				<!-- <div class="col-md-12 col-lg-6 mb-4 mb-lg-0" data-aos="fade-up"> -->
				<div class="col-md-12 col-lg-6 mb-4 mb-lg-0" >
					<h3>Hey, It is Jammm's Life Log</h3>
					<p class="mb-0">Unconstrained Traveller &amp; Professional Developer</p>
				</div>
	
