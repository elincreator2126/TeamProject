<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String searchword = request.getParameter("searchWord");
	if(searchword==null){
		searchword = "";
	}
	String id = (String)session.getAttribute("user");
	//var id = sessionStorage.getItem("user"); //로그인한 아이디를 세션에서 받아오는 방법
%>
<!DOCTYPE html>
<html>
<link href="/css/search/topbar.css" rel="stylesheet" type="text/css">
<link href="/css/search/search.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<script src="https://kit.fontawesome.com/5e5186ce3e.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>HashHershe</title>
<script src="/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	//id, name, hashtag 버튼 클릭시 각각의 화면 출력
	$("#idbutton").on('click', function(){
		$('#idSearch').css("display", "block");
		$('#nameSearch').css("display", "none");
		$('#hashtagSearch').css("display", "none");
	})
	
	$("#namebutton").on('click', function(){
		$('#idSearch').css("display", "none");
		$('#nameSearch').css("display", "block");
		$('#hashtagSearch').css("display", "none");
	})
	
	$("#hashtagbutton").on('click', function(){
		$('#idSearch').css("display", "none");
		$('#nameSearch').css("display", "none");
		$('#hashtagSearch').css("display", "block");
	})
			
	var searchMessage = $("#searchbar").val();
	//main에서 넘어오는 search값 전달, id 검색	
	if(searchMessage==null||searchMessage==""){ //검색어가 없을 때
		$(".idSearchList").html("<div class=resultNone>검색어를 입력하세요.</div>");
	} else {
		$.ajax({
			url :"/idsearch",
			type : "get",
			data : {"id" : searchMessage},
			dataType : "json",
			success : function(response){
				//console.log(response)
				var list = response;
				if(list.length==0){ //검색 결과가 없을 때
					$(".idSearchList").html("<div class=resultNone>검색 결과가 없습니다.</div>");
				} else {
					for(var i in list){ //결과 반환
						var userImage = list[i].profileImage
						var userID = list[i].id
						if(userImage==null){
							$(".idSearchList").append
							("<div class=oneProfile>"+
							"<div class=profileImage>"+
							"<img class='profileimage' src='/images/basicprofileimage.jpg' onclick=moveToID('"+userID+"')></div>"+
							"<p class=profileList><a href='profile?id="+userID+"'>"+userID+"</a></p></div>");	
						} else {
							var userImagepath = userImage.split("/")
							$(".idSearchList").append
							("<div class=oneProfile>"+
							"<div class=profileImage>"+
							"<img class='profileimage' src='/upload/"+userImagepath[userImagepath.length-1]+"' onclick=moveToID('"+userID+"')></div>"+
							"<p class=profileList><a href='profile?id="+userID+"'>"+userID+"</a></p></div>");
						}//else end
					}// for end
				} 
			}, // success end
			error : function(e){
				console.log(e)
			} // error end
		}) // ajax end
	} //else end
 			 
	
	//main에서 넘어오는 search값 전달, name 검색
	if(searchMessage==null||searchMessage==""){ //검색어가 없을때
		$(".nameSearchList").html("<div class=resultNone>검색어를 입력하세요.</div>");
	} else {
		$.ajax({
			url :"/namesearch",
			type : "get",
			data : {"name" : searchMessage},
			dataType : "json",
			success : function(response){
				//console.log(response)
				var list = response;
				if(list.length==0){ // 검색결과가 없을때
					$(".nameSearchList").html("<div class=resultNone>검색 결과가 없습니다.</div>");
				} else {
					for(var i in list){ //결과 반환
						var userImage = list[i].profileImage
						var userName = list[i].name
						if(userImage==null){
							$(".nameSearchList").append
							("<div class=oneProfile>"+
							"<div class=profileImage>"+
							"<img class='profileimage' src='/images/basicprofileimage.jpg' onclick=moveToName('"+userName+"')></div>"+
							"<p class=profileList><a href='profile?name="+userName+"'>"+userName+"</a></p></div>");	
						} else {
							var userImagepath = userImage.split("/")
							$(".idSearchList").append
							("<div class=oneProfile>"+
							"<div class=profileImage>"+
							"<img class='profileimage' src='/upload/"+userImagepath[userImagepath.length-1]+"' onclick=moveToName('"+userName+"')></div>"+
							"<p class=profileList><a href='profile?name="+userName+"'>"+userName+"</a></p></div>");
						}//else end
					}// for end
				}  //else end
			}, // success end
			error : function(e){
				console.log(e)
			} // error end
		}) // ajax end
	} //else end
	
	
	// main에서 넘어오는 search값 전달, hashtag 검색
	var length = searchMessage.length; //검색어의 길이
	var hashtagArr = []; //검색어의 중복을 방지하기 위한 array
	if(searchMessage==null||searchMessage==""){ //검색어가 없을때
		$(".hashtagSearchList").html("<div class=resultNone>검색어를 입력하세요.</div>");
	} else {
		$.ajax({
			url :"/hashtagsearch",
			type : "get",
			data : {"hashtag" : searchMessage},
			dataType : "json",
			success : function(response){
				//console.log(response)
				var list = response;
				if(list.length==0){ //검색 결과가 없을 때
					$(".hashtagSearchList").html("<div class=resultNone>검색어를 입력하세요.</div>");
				} else {
					for(var i in list){
						var hashtag = list[i].hashtag.substr(1,).split("#"); //hashtag 검색 결과를 #를 기준으로 나눔
						console.log(response)
						for(var tag in hashtag){
							if(!hashtagArr.includes(hashtag[tag]) && //중복된 태그 검사 && 검색어와 태그 일치 여부 검사
								searchMessage == hashtag[tag].substring(0, length)){
									hashtagArr.push(hashtag[tag]);
									hashtagArr.sort();																	
							} // if end								
						}// for tag end
					} // for i end
					if(hashtagArr.length==0){ //위 조건과 맞는 결과가 없을 때
						$(".hashtagSearchList").html("<div class=resultNone>검색 결과가 없습니다.</div>");
					} else {
						for(var i in hashtagArr){ //결과 반환
							$(".hashtagSearchList").append
							("<p><a class=hashtagList href='hashtagresult?hashtag="+hashtagArr[i]+"'>"+"#"+hashtagArr[i]+"</a></p>");		
						}// for end
					}// else end
				}// else
			}, // success end
			error : function(e){
						console.log(e)
					} // error end
			}) // ajax end
		} //else end
}); //ready end

//search버튼 클릭 시 검색결과 반환 함수
function search(){ 
	var searchMessage = $("#searchbar").val(); // 검색어 입력
	// 검색결과 초기화
	$(".idSearchList").text("");
	$(".nameSearchList").text("");
	$(".hashtagSearchList").text(""); 
	
	// id 검색결과
	if(searchMessage==null || searchMessage==""){ //검색어가 없을 때
		$(".idSearchList").html("<div class=resultNone>검색어를 입력하세요.</div>");
	} else {
		$.ajax({
			url :"/idsearch",
			type : "get",
			data : {"id" : searchMessage},
			dataType : "json",
			success : function(response){
				//console.log("idsearch = "+response)
				var list = response;
				if(list.length==0){ //검색 결과가 없을 때
					$(".idSearchList").html("<div class=resultNone>검색 결과가 없습니다.</div>");
				} else {
					for(var i in list){ //결과 반환
						var userImage = list[i].profileImage
						var userID = list[i].id
						if(userImage == null){
							$(".idSearchList").append
							("<div class=oneProfile>"+
							"<div class=profileImage>"+
							"<img class='profileimage' src='/images/basicprofileimage.jpg' onclick=moveToID('"+userID+"')></div>"+
							"<p class=profileList><a href='profile?id="+userID+"'>"+userID+"</a></p></div>");
						} else {
							var userImagepath = userImage.split("/")
							//console.log(userImagepath)
							$(".idSearchList").append
							("<div class=oneProfile>"+
							"<div class=profileImage>"+
							"<img class='profileimage' src='/upload/"+userImagepath[userImagepath.length-1]+"' onclick=moveToID('"+userID+"')></div>"+
							"<p class=profileList><a href='profile?id="+userID+"'>"+userID+"</a></p></div>");
						} // else end
					}// for end
				}// else end 
			}, // success end
			error : function(e){
				console.log(e)
			} // error end
		}) // ajax end
	} //else end	
	
	// name 검색 결과
	if(searchMessage==null || searchMessage==""){ //검색어가 없을 때
		$(".nameSearchList").html("<div class=resultNone>검색어를 입력하세요.</div>");
	} else {
		$.ajax({
			url :"/namesearch",
			type : "get",
			data : {"name" : searchMessage},
			dataType : "json",
			success : function(response){
				//console.log("namesearch = "+response)
				var list = response;
				if(list.length==0){ //검색 결과가 없을 때
					$(".nameSearchList").html("<div class=resultNone>검색 결과가 없습니다.</div>");
				} else {
					for(var i in list){ //결과 반환
						$(".nameSearchList").append
						var userImage = list[i].profileImage
						var userName = list[i].name
						if(userImage==null){
							$(".nameSearchList").append
							("<div class=oneProfile>"+
							"<div class=profileImage>"+
							"<img class='profileimage' src='/images/basicprofileimage.jpg' onclick=moveToName('"+userName+"')></div>"+
							"<p class=profileList><a href='profile?name="+userName+"'>"+userName+"</a></p></div>");	
						} else {
							var userImagepath = userImage.split("/")
							$(".nameSearchList").append
							("<div class=oneProfile>"+
							"<div class=profileImage>"+
							"<img class='profileimage' src='/upload/"+userImagepath[userImagepath.length-1]+"' onclick=moveToName('"+userName+"')></div>"+
							"<p class=profileList><a href='profile?name="+userName+"'>"+userName+"</a></p></div>");
						}//else end					
					}// for end
				} // else end
			}, // success end
			error : function(e){
				console.log(e)
			} // error end
		}) // ajax enda
	} //else end
	
	// hashtag 검색결과
	var length = searchMessage.length; //검색어의 길이
	var hashtagArr = []; //검색어의 중복을 방지하기 위한 array
	if(searchMessage==null||searchMessage==""){ //검색어가 없을 때
		$(".hashtagSearchList").html("<div class=resultNone>검색어를 입력하세요.</div>");
	} else {
		$.ajax({
			url :"/hashtagsearch",
			type : "get",
			data : {"hashtag" : searchMessage},
			dataType : "json",
			success : function(response){
				//console.log("hashtag result = "+response)
				var list = response;
				if(list.length==0){ //검색 결과가 없을 때
					$(".hashtagSearchList").html("<div class=resultNone>검색 결과가 없습니다.</div>");
				} else {
					for(var i in list){
						var hashtag = list[i].hashtag.substr(1,).split("#"); //hashtag 검색 결과를 #를 기준으로 나눔
						//console.log("HASHTAG = "+hashtag)
						for(var tag in hashtag){
							if(searchMessage == hashtag[tag].substring(0, length)){
								hashtagArr.push(hashtag[tag]);
								hashtagArr.sort();
							} // for end							
						}// for tag end
					} // for i end
					if(hashtagArr.length==0){ //위 조건과 맞는 결과가 없을 때
						$(".hashtagSearchList").html("<div class=resultNone>검색 결과가 없습니다.</div>");
					} else {
						var hashtagSet = new Set(hashtagArr)
						console.log(hashtagSet)
						for(let i of hashtagSet){ //결과 반환
							$(".hashtagSearchList").append
							("<p><a class=hashtagList href='hashtagresult?hashtag="+i+"'>"+"#"+i+"</a></p>");
							//("<p><a class=hashtagList href='hashtagresult?hashtag="+hashtagArrtest[i]+"'>"+"#"+hashtagArrtest[i]+"</a></p>");
						}// for end
					}// else end
				}// else
			}, // success end
			error : function(e){
						console.log(e)
					} // error end
			}) // ajax end
		} //else end
	}// search function end

function enterkey(){
	//  엔터키 입력(a - 97  0 - 48 엔터키 - 13)하면 send  함수 동일 효과
	if(window.event.keyCode == 13){
		search();
	}
}	
	
function moveToID(value){
	console.log(value)
	var url = "/profile?id="+value;
	location.href = url;
}

function moveToName(value){
	console.log(value)
	var url = "/profile?name="+value;
	location.href = url;
}

</script>
</head>
<body>
<header>
<nav class="navbar">
	<div class=logo>
		<img src="/loginimage/logo.png" id='logoimage' onclick="location.href='/mainscroll'">
	</div>
	<ul class=navbarLinks>
		<svg class="searchIcon"  viewBox="160.5 482.975 50 50" onclick="location.href='/search'">
			<path id="searchIcon" d="M 194.1509 507.6557 L 191.1825 510.6247 L 187.2684 506.7124 C 189.1769 504.1599 190.2239 501.0822 190.2239 497.8383 C 190.2239 493.8687 188.6769 490.1354 185.8699 487.3281 C 183.0615 484.5209 179.3303 482.9749 175.3619 482.9749 C 171.3922 482.9749 167.661 484.5209 164.854 487.3281 C 162.047 490.1354 160.5 493.8687 160.5 497.8383 C 160.5 501.8093 162.047 505.5442 164.854 508.3529 C 167.661 511.16 171.3922 512.7061 175.3619 512.7061 C 178.6061 512.7061 181.683 511.6567 184.2357 509.7457 L 188.1484 513.658 L 185.1799 516.627 L 201.529 532.975 L 210.5 524.0036 L 194.1509 507.6557 Z M 167.8810 505.3137 C 165.8854 503.3153 164.7854 500.6627 164.7854 497.8398 C 164.7854 495.0169 165.8854 492.3642 167.8810 490.3673 C 169.8794 488.3703 172.5364 487.2695 175.3619 487.2695 C 178.1875 487.2695 180.8445 488.3703 182.8430 490.3673 C 184.8385 492.3642 185.9385 495.0169 185.9385 497.8398 C 185.9385 500.6627 184.8400 503.3153 182.8430 505.3137 C 180.8445 507.3107 178.1875 508.4115 175.3619 508.4115 C 172.5364 508.4115 169.8794 507.3107 167.8810 505.3137 Z M 192.4924 517.8724 L 195.3908 514.9622 L 204.4331 524.0036 L 201.5290 526.9081 L 192.4924 517.8724 Z">
			</path>
		</svg>
		<svg class="loginIcon" viewBox="2 2 20 20" onclick="location.href='/profile?id=<%=id%>'"> <!-- 세션 아이디를 받아오게 변경해야함 -->
			<path id="loginIcon" d="M 12 2 C 6.48 2 2 6.48 2 12 C 2 17.52 6.48 22 12 22 C 17.52 22 22 17.52 22 12 C 22 6.479999 17.52 2 12 2 Z M 12 5 C 13.65999 5 15 6.34 15 8 C 15 9.66 13.66 11 12 11 C 10.34 11 9 9.66 9 8 C 9 6.34 10.34 5 12 5 Z M 12 19.2 C 9.5 19.2 7.29 17.92 6 15.98 C 6.03 13.99 10 12.9 12 12.9 C 13.99 12.9 17.97 13.99 18 15.98 C 16.71 17.92 14.5 19.2 12 19.2  Z">
			</path>
		</svg>
		<svg class="langueIcon" viewBox="500.5 962.94 50 50">
			<path id="langueIcon" d="M 550.4571 986.3828 C 550.4142 985.6257 550.3286 984.8686 550.1857 984.0400 C 549.8143 981.5686 549.0427 979.1257 547.8856 976.8256 C 543.6571 968.2686 535.0714 962.9400 525.5 962.9400 C 519.5857 962.9400 513.8571 965.0400 509.3571 968.8543 C 507.7570 970.1972 506.3571 971.7114 505.1713 973.3685 C 503.3286 975.9257 501.9857 978.8256 501.2285 981.9399 C 500.7428 983.8829 500.5 985.8972 500.5 987.9399 C 500.5 990.1685 500.7857 992.3256 501.3427 994.3829 C 502 996.8542 503.0285 999.1685 504.3713 1001.282 C 506.5142 1004.668 509.4570 1007.511 512.9285 1009.539 C 516.6286 1011.697 520.9285 1012.940 525.5 1012.940 C 526.6428 1012.940 527.7572 1012.868 528.8571 1012.711 C 533.0286 1012.168 536.8714 1010.597 540.1141 1008.268 C 546.1713 1003.925 550.1857 996.9113 550.4857 988.8686 C 550.5 988.5828 550.5 988.2685 550.5 987.9399 C 550.5 987.4113 550.4857 986.8972 550.4571 986.3828 Z M 544.4428 982.0686 C 544.5857 981.8970 545.0714 981.9543 545.5142 982.1971 C 545.6286 982.2685 545.7284 982.2828 545.8142 982.2828 C 546.0285 983.0543 546.2142 983.8543 546.3286 984.6685 C 546.3571 984.7829 546.3571 984.8828 546.3713 984.9971 C 546.2142 984.6114 545.9714 984.2399 545.7142 983.9686 L 545.0141 983.2542 C 544.5571 982.7828 544.2999 982.2542 544.4428 982.0686 Z M 546.5856 988.7258 C 546.4856 991.6829 545.7713 994.4686 544.5714 996.9829 C 542.9285 1000.411 540.4143 1003.325 537.2857 1005.425 C 536.3999 1006.039 535.4857 1006.568 534.5143 1007.025 L 534.5 1007.025 C 533.8428 1007.339 533.1713 1007.611 532.4857 1007.854 C 531.5429 1008.182 530.5714 1008.454 529.5714 1008.640 C 529.2429 1008.711 528.9142 1008.768 528.5857 1008.811 C 527.5714 1008.968 526.5427 1009.040 525.5 1009.040 C 521.0571 1009.040 516.9285 1007.668 513.5285 1005.311 C 510.7999 1003.425 508.5285 1000.897 506.9285 997.9686 C 506.4572 997.0970 506.0428 996.1970 505.7142 995.2542 L 505.7000 995.2542 C 504.8570 992.9685 504.4000 990.5114 504.4000 987.9399 C 504.4000 986.7972 504.5285 985.6828 504.7000 984.5828 C 504.7285 984.6971 504.7427 984.8258 504.7713 984.9257 L 505.5428 987.3543 C 505.7429 987.9827 506.4428 988.5828 507.0999 988.6829 L 510.7000 989.2399 C 511.3142 989.3256 511.9570 989.8543 512.1999 990.4400 C 512.2285 990.4827 512.2428 990.5400 512.2571 990.5827 L 512.5856 991.6829 C 512.7857 992.3115 512.5142 993.1542 511.9714 993.5399 L 511.2142 994.0971 C 510.6856 994.4829 510.1142 995.3256 509.9570 995.9685 L 509.5855 997.4685 L 509.3999 998.2114 C 509.2427 998.8543 509.5855 999.6400 510.1571 999.9542 C 510.7428 1000.268 511.7570 1000.611 512.3999 1000.725 L 512.4284 1000.725 C 513.0714 1000.839 513.8571 1001.325 514.1713 1001.782 C 514.1999 1001.825 514.2427 1001.882 514.2714 1001.940 C 514.5856 1002.425 515.0142 1003.168 515.2713 1003.711 L 516.4000 1005.939 C 516.6856 1006.540 517.4285 1007.025 518.0430 1007.025 C 518.6429 1007.025 519.0570 1006.482 518.9572 1005.825 L 518.4285 1002.454 C 518.3286 1001.797 518.5285 1000.797 518.8713 1000.225 L 519.4572 999.2543 C 519.8142 998.6828 520.0572 997.6828 520.0286 997.0114 L 519.9428 995.4399 C 519.9000 994.7828 519.3713 994.0257 518.7572 993.7685 L 516.5285 992.8399 C 515.9142 992.5828 515.2428 991.8543 515.0428 991.2257 L 514.4857 989.5113 C 514.3571 989.1114 514.2285 988.5256 514.1713 987.9971 C 514.1142 987.6972 514.0856 987.3970 514.0856 987.1685 L 514.0856 987.1115 C 514.0714 986.4543 514.4285 985.4971 514.8713 985.0114 L 515.1571 984.6971 C 515.3428 984.4829 515.5571 984.3829 515.7427 984.3686 C 516.0000 984.3542 516.2285 984.5257 516.3571 984.8542 C 516.5856 985.4256 516.9856 985.7971 517.2570 985.6685 C 517.5427 985.5400 517.8999 984.9257 518.0571 984.3256 C 518.2142 983.7114 518.8142 982.9400 519.3856 982.6114 L 519.5428 982.5257 C 520.1142 982.1971 520.7142 981.3970 520.8858 980.7542 L 521.8999 976.9971 C 522.0714 976.3543 521.7999 975.4686 521.2999 975.0400 L 520.6572 974.4971 C 520.1572 974.0686 519.3713 973.3258 518.9000 972.8543 L 518.7286 972.6829 C 518.7000 972.6542 518.6715 972.6257 518.6286 972.5971 C 518.1428 972.1685 517.2857 971.8256 516.6714 971.8256 L 513.0427 971.8256 C 512.7570 971.8256 512.3286 971.8115 511.8857 971.8256 C 513.2714 970.6544 514.7999 969.6687 516.4428 968.8828 C 516.4571 968.8686 516.4714 968.8686 516.4857 968.8686 C 519.2285 967.5686 522.2856 966.8400 525.5 966.8400 C 532.5572 966.8400 538.8143 970.3256 542.6286 975.6542 L 538.0429 975.0400 C 537.6571 974.9829 537.1856 975.0828 536.7714 975.2829 C 536.4856 975.4114 536.2428 975.5828 536.0714 975.7971 L 534.1000 978.1828 L 531.9714 980.7542 L 531.9000 980.8258 C 531.4858 981.3399 531.1000 982.2971 531.0571 982.9543 L 530.9429 984.6400 C 530.9000 985.2971 531.2572 985.4686 531.7428 985.0257 L 532.4286 984.3829 C 532.9143 983.9400 533.8572 983.5686 534.5143 983.5686 L 535 983.5686 C 535.6713 983.5686 536.3429 984.0971 536.5001 984.7401 L 536.6428 985.2971 C 536.7999 985.9400 536.7428 986.8256 536.5285 987.2828 C 536.2999 987.7255 535.5857 988.0544 534.9143 987.9827 L 533.1572 987.8258 C 532.5000 987.7542 531.5999 988.0972 531.1429 988.5971 L 530.5571 989.2399 C 530.4570 989.3543 530.3571 989.4971 530.2714 989.6542 C 529.9857 990.1542 529.8286 990.8258 529.9000 991.3258 L 530.1428 992.9829 C 530.1572 993.1400 530.2142 993.3114 530.2857 993.4829 C 530.4856 994.0257 530.8714 994.5971 531.2713 994.8970 L 532.0999 995.4970 C 532.6285 995.8972 533.0571 996.7542 533.0571 997.4257 L 533.0 1001.297 C 532.9856 1001.868 533.3142 1002.525 533.7428 1002.854 C 533.8143 1002.911 533.8857 1002.954 533.9570 1002.997 C 534.5 1003.268 535.3000 1003.082 535.7429 1002.582 L 536.5428 1001.697 C 536.9856 1001.197 537.5429 1000.282 537.7856 999.6685 C 537.7856 999.6685 538.3001 998.3258 538.3001 998.0543 C 538.3001 997.7971 538.7429 997.5827 538.7429 997.5827 C 539.3429 997.3114 540.0285 996.7114 540.2571 996.2543 C 540.4285 995.8972 540.6714 995.3828 540.8427 994.9543 C 540.9 994.8399 540.9428 994.7258 540.9713 994.6256 C 541.1285 994.1971 541.6857 993.4971 542.2142 993.0970 L 542.2999 993.0258 C 542.8285 992.6114 543.5285 991.8115 543.8856 991.2399 L 544.3571 990.4542 C 544.4571 990.2972 544.4999 990.1398 544.5142 990.0258 C 544.5142 989.9685 544.4999 989.9113 544.4856 989.84 C 544.4 989.6542 544.1714 989.5828 543.8 989.6542 L 543.7142 989.6828 C 543.0714 989.8114 542.0856 989.6114 541.5427 989.2257 L 541.0285 988.8686 C 540.4857 988.4971 540.1284 987.9686 540.2286 987.7114 C 540.3428 987.4542 540.9142 987.5114 541.4857 987.8399 L 541.9142 988.0827 C 542.4857 988.4116 543.4999 988.64 544.1571 988.5971 L 544.2570 988.5828 L 544.6999 988.5543 C 545.3571 988.4971 546.0571 988.1684 546.2428 987.8114 C 546.3857 987.5399 546.5 987.1544 546.5571 986.8542 C 546.5856 987.2114 546.6 987.5686 546.6 987.9399 C 546.6 988.1971 546.6 988.4543 546.5856 988.7258 Z">
			</path>
		</svg>
	</ul>
</nav>
</header>
	<input type="text" id="searchbar" value="<%=searchword%>" onkeyup="enterkey()" placeholder="검색어를 입력하세요">
	<i class="fas fa-search fa-3x" id=fa-search type="submit" id="searchbutton" onclick="search()"></i>
	
	<button id="idbutton">아이디</button>
	<button id="namebutton">이름</button>
	<button id="hashtagbutton">해시태그</button><br>
<!-- 색상은 구분을 위해 임시 지정 , css 스타일 적용 필요 -->
<div id="messageWindow">
	<div id="idSearch"> <!-- default view -->
		<div class=idSearchList id=idSearchList></div>
	</div>
	<div id="nameSearch">
		<div class=nameSearchList></div>
	</div>
	<div id="hashtagSearch">
		<div class=hashtagSearchList></div>
	</div>
</div>

<i class="fas fa-arrow-circle-up fa-3x" id="goToTopBtn" onclick="window.scrollTo(0,0)"></i>
</body>
</html>	