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
						<a href="/amap" class="active" >AMap</a>
						<a href="/upload" >+</a>
	            	</div>
				</div>
			</div>
		</div>
	</header>
	
	<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHu8cKiyurZEbwnthJkwEOhpMCMwoHJh4&callback=initMap&libraries=&v=weekly" defer></script>
    <script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
    <script
  		src="http://code.jquery.com/jquery-3.3.1.min.js"
  		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  		crossorigin="anonymous">
  	</script>
	<main id="main">
		<section id="daily-pictures" class="section">
		
			<div class="container" data-aos="fade-up">
				<div id="pictures-grid" class="row no-gutter">
					<div class="item col">
						<div id="map">
							<script>
							let markerCluster;
							let map;
							let totalMarkers
							function initMap() {
							    map = new google.maps.Map(
							    		  document.getElementById('map'), { 
							    			  center: { lat: 36.615527631349245, lng: 127.353515625}, 
							    			  zoom: 7,
							    			  zoomControl: true
							    			  });
							    
							    setImgMarker(map); //markeCluster 생성
							    
							    /* console.log(markerCluster.getClusters()); */
							      
							}
						
							
							function setImgMarker(map){
								var markers = [];
								var clusterImg = "";
								
								<c:forEach var="picture" items="${list}" varStatus="status"> 
							      	var lat = <c:out value="${picture.gps_la}"/>;
							      	var lng = <c:out value="${picture.gps_lo}"/>;
							      	var position = new google.maps.LatLng(lat, lng);
							      	
							      	<fmt:formatDate pattern="yyyy" value="${picture.taken_dt }" var="year"/>;
							      	<fmt:formatDate pattern="M" value="${picture.taken_dt }" var="month"/>;
							      	
							      	var year = <c:out value="${year}"/>;
							      	var month = <c:out value="${month}"/>;
							 		var fl_nm = "<c:out value="${picture.fl_nm}"/>";
							      	var img_fl = "/pictures/"+ year +"/"+ month + "/" + fl_nm;
							      	clusterImg = img_fl;
							      	
							      	var min_width = 70;
							      	var min_height = 70;
							     	
							      	var icon = {
							      			url : img_fl,
							      			size: new google.maps.Size(10, 10),
							      			origin: new google.maps.Point(0, 0),
							      			anchor: new google.maps.Point(5, 0)
							      	}
							     
							      	var marker = new google.maps.Marker({
							      		position: position,
							      		map: map,
							      		icon: icon,
							      		opacity: 0
							      	});
							     	markers.push(marker);
							    
							     	var marker_wrap_div = '<button class="infoWindowBtn" onclick="showModalOne(this)" style="all:unset;" > ' + '<div class="marker-wrap"><img src="' +img_fl+ '" /></div></button>';
							      	//인포윈도우
							      	var infowindow = new google.maps.InfoWindow({
							      		content: marker_wrap_div,
							      		pixelOffset: new google.maps.Size(0, min_height)
							      	});
							      	
			                        infowindow.open(map, marker);
									
		                        </c:forEach>
		                        
		                        var clusterOpt = {
		                        	//imagePath : 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m',
		                        	styles : [{
		                        			url: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m1.png',
			                        		width: 76, 
			                        		height: 76, 
			                        		anchorIcon: [+78, +40]
			                        	}]
		                        };
		                        
		                        markerCluster = new MarkerClusterer(map, markers, clusterOpt);
								
		                        google.maps.event.addListener(markerCluster, 'clusterclick', function(cluster) {
		                            showModal(cluster.getMarkers());
		                        });
							}
				
							
	                        window.addEventListener("load", function(){
	                        	var clusters = markerCluster.getClusters();
	                        	var clusters_class = document.getElementsByClassName("cluster");
	                    
	                        	for(var j=0; j< clusters.length; j++){
	                        		/* ar markersList = clusters[j].getMarkers();
	                        		console.log(clusters[j].getMarkers());
	                        		console.log(markersList);
	                        		
	                        		clusters_class[j].setAttribute('onclick', 'showModal(markersList);');
	                        		 */
	                        	
	                        		if(clusters[j].getMarkers().length == 1){continue;}
	
	                        		/* console.log(clusters_class[j]); */
	                        		var  cluster_img_div = document.createElement("div");
	                        		cluster_img_div.className = "cluster-img-div";
	                        		var cluster_img_wrap = document.createElement("div");
	                        		cluster_img_wrap.className = "cluster-img-wrap";
	                        		var cluster_img = document.createElement("img");
	                        		cluster_img.className = "cluster-img";
	                        		cluster_img.src = clusters[j].getMarkers()[0].getIcon()["url"];
	                        		
	                        		/* console.log(clusters_class[j]); */
	                        		clusters_class[j].getElementsByTagName("img")[0].style = "display: none;";
	                        		clusters_class[j].getElementsByTagName("div")[0].style = "width: auto; min-width: 25px; height: 25px; border-radius: 50%; background-color: DodgerBlue; position: absolute; right:-9px; top:-12px; z-index:10; padding-top:5px;";
	                        		
	                        		cluster_img_div.appendChild(cluster_img_wrap);
	                        		cluster_img_wrap.appendChild(cluster_img);
	                        		clusters_class[j].appendChild(cluster_img_div);
	                        		
	                    			
	                        	}
	                        	map.addListener('idle', function() {
	                           		setTimeout(setClusterImg, 2);
	                        		setTimeout(setClusterImg, 5); 
	                        		setTimeout(setClusterImg, 10);
	                        		setTimeout(setClusterImg, 50);
	                        		//setTimeout(fuck, 100);
	                        		
	                        		
	                        	});
	                        	map.addListener('zoom_changed', function() {
	                        		setTimeout(setClusterImg, 350);
	                        		setTimeout(setClusterImg, 400);
	                        	});
	                        });
							
							function setClusterImg(){
								var clusters = markerCluster.getClusters();
	                        	var clusters_class = document.getElementsByClassName("cluster");
	                        	
	                        	//console.log("cs", clusters_class);
	                        	
	                        	//console.log(clusters_class.length);
	                        	for(var j=0; j< clusters_class.length; j++){
		                        	/* console.log("cs", markerCluster.getClusters()); */
		                        	if(clusters[j].getMarkers().length == 1){continue;}
		                        	
		                        	if(clusters_class[j] == undefined){return;}
		                        	if(clusters_class[j].children.length > 2 ){
		                        		if( clusters_class[j].children.item(2).className == "cluster-img-div"){
		                        			continue;
		                        		}
		                        	}
				                    
		                        	var  cluster_img_div = document.createElement("div");
	                        		cluster_img_div.className = "cluster-img-div";
			                        var cluster_img_wrap = document.createElement("div");
			                        cluster_img_wrap.className = "cluster-img-wrap";
			                        /* cluster_img_wrap.style = "width:76px; height:76px; overflow: hidden; align-items: center;"; */
			                        var cluster_img = document.createElement("img");
			                        cluster_img.className = "cluster-img";
			                        cluster_img.src = clusters[j].getMarkers()[0].getIcon()["url"];
			                        //cluster_img.style = "width:70px; min-height:70px; object-fit: cover; align-items: center; justify-content: center;";
			                        		
			                        /* if(clusters_class[j].getElementsByTagName("img").length != 0) */
			                        if(clusters_class[j].getElementsByTagName("img")[0] != undefined){
			                        	clusters_class[j].getElementsByTagName("img")[0].style = "display:none;";
			                        }
			                        if(clusters_class[j].getElementsByTagName("div")[0] != undefined){
	                        			clusters_class[j].getElementsByTagName("div")[0].style = "width: auto; min-width: 25px; height: 25px; border-radius: 50%; background-color: DodgerBlue; position: absolute; right:-9px; top:-12px; z-index:10; padding-top:5px;";
			                        }
			                        cluster_img_div.appendChild(cluster_img_wrap);
	                        		cluster_img_wrap.appendChild(cluster_img);
	                        		clusters_class[j].appendChild(cluster_img_div);
	                        	}
		                
							}
							
	                        function showModalOne(buttonEle){
	                        	var modal = document.getElementById("markersModal");
	                        	var img_path = buttonEle.getElementsByTagName("img")[0].getAttribute("src");
	                        	$('#markersModal').modal('show');
	                        	var modal_body = document.getElementsByClassName('modal-body')[0];
	                        	
	                        	var path_arr = img_path.split('/');
                        		var fl_nm = path_arr[path_arr.length - 1];
                        		
                        		var modal_date = document.createElement("div");
                        		modal_date.className = "modal-date col-12 text-left";
                        		var jstlDate = "<c:out value='${hashMap}'/>";
                        		jstlDate = jstlDate.replaceAll('=', '" : "');
                        		jstlDate = jstlDate.replaceAll(', ', '", "');
                        		jstlDate = jstlDate.replaceAll('{', '{"');
                        		jstlDate = jstlDate.replaceAll('}', '"}');
                        		/* console.log(jstlDate);
                        		console.log(fl_nm); */
                        		var dateJson = JSON.parse(jstlDate);
                        		var picDate = dateJson[fl_nm];
                        		modal_date.innerHTML = picDate;
                        		
                        		var modal_img_wrap = document.createElement("div");
                        		modal_img_wrap.className = "modal-img-wrap item col-sm-4 col-md-4 col-lg-4 mb-4 shadow-sm";
                        		
                        		var modal_img = document.createElement("img");
                        		modal_img.className = "modal-img";
                        		modal_img.src = img_path;
                        		
                        		modal_img_wrap.appendChild(modal_img);
                        		
                       			var modal_items = document.createElement("div");
                        		modal_items.className = "modal-gird row no-gutter";
                        		
                        		modal_items.appendChild(modal_date);
                        		modal_items.appendChild(modal_img_wrap);
            					
                        		modal_body.appendChild(modal_items);
                        	
                        	}
	                        
	                        function showModal(markersList){
	                        	/* console.log(markersList); */
	                        	var modal = document.getElementById("markersModal");

	                        	$('#markersModal').modal('show');
	                        	var modal_body = document.getElementsByClassName('modal-body')[0];
	                        	var prevDate = "";
	                        	var modal_items;
	                        	
	                        	for(var k=0; k<markersList.length; k++){
	                        		/* console.log(markersList.length); */
	                        		var img_path = markersList[k].getIcon()["url"];
	                        		var path_arr = img_path.split('/');
	                        		var fl_nm = path_arr[path_arr.length - 1];
	                        		
	                        		var modal_date = document.createElement("div");
	                        		modal_date.className = "modal-date col-12 text-left";
	                        		var jstlDate = "<c:out value='${hashMap}'/>";
	                        		jstlDate = jstlDate.replaceAll('=', '" : "');
	                        		jstlDate = jstlDate.replaceAll(', ', '", "');
	                        		jstlDate = jstlDate.replaceAll('{', '{"');
	                        		jstlDate = jstlDate.replaceAll('}', '"}');
	                        		/* console.log(jstlDate);
	                        		console.log(fl_nm); */
	                        		var dateJson = JSON.parse(jstlDate);
	                        		var picDate = dateJson[fl_nm];
	                        		modal_date.innerHTML = picDate;
	                        		
	                        		var modal_img_wrap = document.createElement("div");
	                        		modal_img_wrap.className = "modal-img-wrap item col-sm-4 col-md-4 col-lg-4 mb-4 shadow-sm";
	                        		
	                        		var modal_img = document.createElement("img");
	                        		modal_img.className = "modal-img";
	                        		modal_img.src = img_path;
	                        		
	                        		modal_img_wrap.appendChild(modal_img);
	                        
	                        		if(prevDate != picDate){
	                        			modal_items = document.createElement("div");
		                        		modal_items.className = "modal-gird row no-gutter";
		                        		
		                        		modal_items.appendChild(modal_date);
		                        		modal_items.appendChild(modal_img_wrap);
		                        		
		                        		modal_body.appendChild(modal_items);
	                        		}
	                        		else{
		                        		modal_items.appendChild(modal_img_wrap);
	                        		}
	                        		prevDate = picDate;
	                        	}
	                        	
	                        }
	                        
	                       	function resetModal() {
	                       		/* console.log(document.getElementsByClassName("modal-body")); */
	                       		var tmp = document.getElementsByClassName("modal-body")[0];
	                        	/*  document.getElementsByClassName("modal-grid")[0].remove(); */
	                        	while( tmp.hasChildNodes() ){
	                        		tmp.removeChild(tmp.firstChild);
	                        	}
	                        }
	                       	
	    					</script>
						</div>
					 </div>
				</div>
			</div>

				
			<div class="container">
				<div class="item">
					<!-- Modal -->
					<div id="markersModal" class="modal fade bd-example-modal-lg" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLongTitle">Location: </h5>
					        <button type="button" class="close" onclick="resetModal()" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					      
					      </div>
					      <!-- <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					      </div> -->

					    </div>
					  </div>
					</div>
				</div>
			</div>
		</section>
		
	</main>
	
<%@ include file="/WEB-INF/includes/footer.jsp"%>