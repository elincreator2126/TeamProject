<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String hashtag = request.getParameter("hashtag");
	String id = (String)session.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<script src="https://kit.fontawesome.com/5e5186ce3e.js" crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<link href="/css/search/topbar.css" rel="stylesheet" type="text/css">
<link href="/css/search/modal.css" rel="stylesheet" type="text/css">
<link href="/css/search/hashtagresult.css" rel="stylesheet" type="text/css">
<title>HashHershe</title>
<script src="/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	//좋아요순, 최신순 화면 출력
	$("#favoriteBtn").on('click', function(){
		$("#thumbsupView").css("display", "block");
		$("#recentView").css("display", "none");
	});
	
	$("#recentUpdateBtn").on('click', function(){
		$("#thumbsupView").css("display", "none");
		$("#recentView").css("display", "block");
	});
	
	var hashtagtest = $("#searchbar").val() //.split(" ")
	//var hashtagtest = getHashtag[0]
	//console.log("test"+hashtagtest)
	if(hashtagtest==null||hashtagtest==""){ //뒤로가기를 했다가 다시 앞으로 오기를 할 때 모든 게시글을 불러오는 버그를 방지
		$(".thumbsupList").html("<p class='resultNone'>검색 결과가 없습니다.</p>");
		$(".recentList").html("<p class='resultNone'>검색 결과가 없습니다.</p>");
	}
	var hashtagArr = []; //검색어의 중복을 방지하기 위한 array
//	var list = "";
		$.ajax({
			url :"/hashtagsearch",
			type : "get",
			data : {"hashtag" : hashtagtest},
			dataType : "json",
			success : function(response){
				//console.log(response);
				var list = response;

				var totalHashtag = list.length; //검색결과 총 갯수
				$("#searchbar").val("")
				$("#searchbar").attr("placeholder", hashtagtest+" "+totalHashtag+"개 게시물")
				
				//좋아요순으로 정렬
				$(".thumbsupList").text("");
				var thumbsupList = list.sort(function(a, b){
					return b.thumbsup - a.thumbsup;
				});
				for(var i=0; i<thumbsupList.length; i++){
					var imageName = thumbsupList[i].imagepath.split("/");
					var postNumber = thumbsupList[i].postNum
					$(".thumbsupList").append
						("<div class=imageFrame><img class='listImage' src='/upload/"+imageName[imageName.length-1]+
								"' onclick='clickimage("+postNumber+")'></div>");
				} //for end	
				
				//최신순으로 정렬
				$(".recentList").text("");
				var recentList = list.sort(function(a, b){
					return new Date(b.postDate) - new Date(a.postDate);
				});
				
				for(var i=0; i<recentList.length; i++){
					var imageName = recentList[i].imagepath.split("/");
					var postNumber = recentList[i].postNum
					
					$(".recentList").append
						("<div class=imageFrame><img class='listImage' src='/upload/"+imageName[imageName.length-1]+"' onclick='clickimage("+postNumber+")'></div>");					
				} // for end
			}, // success end
			error : function(e){
					console.log(e);
				} // error end
		}); // ajax end	
}); //ready function end
var CheckThumbsup = 0; //모달창을 띄웠을 때 기존에 좋아요를 눌렀는지 체크
var CheckCommentThumbsup = 0; //댓글창에 좋아요를 눌렀는지 체크??
var myid = "aljisoo1"; // 현재 로그인한 아이디를 세션에서 받아옴, 현재 테스트용 admin으로 설정
//var myid = sessionStorage.getItem("user") //로그인한 아이디를 세션에서 받아오는 방법
var postNum = 0; // 클릭한 이미지의 포스트번호 저장
var totalThumbs = 0; // 총 좋아요 개수 저장
var contents = []; // 좋아요 누른 사람을 저장하는 리스트
function clickimage(postNumber){ // 이미지 클릭시 게시글 모달창으로 나타냄
	$(".modal").fadeIn();
	$("body").css("overflow-y", "hidden")
	$("html").css("overflow-y", "hidden")
	$(".modalContent").text("")
	postNum = parseInt(postNumber);
	
	$.ajax({ //전달받은 postNum 조회
		url :"/postnumsearch",
		type : "get",
		data : {"postNum" : postNum},
		dataType : "json",
		success : function(response){ //모달창에 작성
			var contents = response[0];
			var imageName = contents.imagepath.split("/")
			var hashtag = contents.hashtag.split("#")
			var commentList = []
			hashtag.shift(0)
			var postID = contents.id;
						
			var profileImagePath = FunctionGetContentProfileImage(postID); // 게시글 작성자의 프로필 이미지 불러오기	
			FunctionGetComment(postNum, commentList) // 댓글 가져오기 함수
			
			
			$(".modalContent").append(
				"<div class=modalHeader><i class='far fa-window-close fa-3x' id='windowClose' onclick='modalClick()'></i>"+
				"<div class='postDate'>게시일 : "+contents.postDate+"</div>"+
				"<div class='postProfileImage'><img class=commentImage src='"+profileImagePath+"'></div>"+ //
				"<div class='postID'>아이디 : <a href='/profile?id="+contents.id+"'>"+contents.id+"</a></div><div>")
			$(".modalContent").append(
				"<div class='modalArticle'>"+
				"<img class='contentsImage' src='/upload/"+imageName[imageName.length-1]+"' ondblclick='thumbsup()'></div>"+ // admin을 이후 세션 id값으로 변경
				"<div class='modalAside'><div class='commentsTitle'>댓글"+
				"<div class='commentsList'></div>"+
				"<div class='postComment'><input id='myComment' type='text' onkeyup='enterkey(\""+contents.postNum+"\")' placeholder='댓글을 입력하세요'>"+
	 			"<input id='commentBtn' type='button' value='작성' onclick='addComment(\""+contents.postNum+"\")'></div>"+
				"</div></div>")
			$(".modalContent").append("<p class='postContents'>내용 : "+contents.contents+"</p>")
			$(".modalContent").append("<div class='postHashtag'></div>")
			for(var i in hashtag){
				$(".modalContent").append(
						$(".postHashtag").append(
								"<a class=hashtagLink href='https://search.shopping.naver.com/search/all?query="
						+hashtag[i]+"&cat_id=&frm=NVSHATC' target='_blank'>#"+hashtag[i]+"</a>&nbsp"))
			} // for end
			FunctionThumbsupSearch(postNum) // 좋아요 불러오기
		}, //success end
		error : function(e){
			console.log(e)
		} // error end
	}); //outer ajax end
}// function end
//엔터키 입력(a - 97  0 - 48 엔터키 - 13)하면 send  함수 동일 효과
function enterkey(postNum){
	if(window.event.keyCode == 13){
		addComment(postNum);
	}
}//function end
// 모달 창 function
var modalStatus = 0; // 모달창을 클릭한 것인지, 배경을 클릭한 것인지 구분
function modalClick(){
	if(modalStatus==0){
		$("body").css("overflow-y", "scroll")
		$("html").css("overflow-y", "scroll")
		$(".modal").fadeOut();
	} else if(modalStatus==1) {
		modalStatus = 0;
	} // elseif end
} // modalClick end
function modalContentClick(){
	modalStatus = 1;
} // modalContentClick end

// //ESC키 입력
// function esckey(){
// 	if(window.event.keyCode == 27){
// 		$(".modal").fadeOut();
// 	}
// }//function end

function thumbsup(){ //좋아요 누르기 / 취소하기
	var id = myid;
	if(CheckThumbsup == 0){ //좋아요가 눌려있지 않은 경우
		$.ajax({
			url : "/thumbsplus",
			type : "get",
			data : {
				"postNum" : postNum,
				"id" : id
			},
			dataType : "text",
			success : function(response){
				totalThumbs = totalThumbs+1;
				CheckThumbsup = parseInt(response);
				$(".postThumbsup").text(" 좋아요 : "+totalThumbs+"명이 좋아합니다.")
				//console.log("토탈 : "+totalThumbs)
				$(".thumbsupButton").html("<i class='fas fa-heart fa-2x'></i>")
			},
			error : function(e){
				console.log(e)
			} // error end
		}); // ajax end
	} 
	else { // 좋아요가 이미 눌려있는 경우
		$.ajax({
			url : "/thumbsminus",
			type : "get",
			data : {
				"postNum" : postNum,
				"id" : id
			},
			dataType : "text",
			success : function(response){
				totalThumbs = totalThumbs-1;
				CheckThumbsup = parseInt(response);
				$(".postThumbsup").text(" 좋아요 : "+totalThumbs+"명이 좋아합니다.")
				//console.log("토탈 : "+totalThumbs)
				$(".thumbsupButton").html("<i class='far fa-heart fa-2x'></i>")
			},
			error : function(e){
				console.log(e)
			} // error end
		}); // ajax end
	}// else end
} // function thumbsup end
//좋아요 개수, 좋아요 누른 사람 반환
function FunctionThumbsupSearch(postNum){
	$.ajax({ 
		url : "/thumbsupsearch",
		type : "get",
		data : {"postNum" : postNum},
		dataType : "json",
		success : function(response){
			contents = []
			CheckThumbsup = 0; //현재 게시물 좋아요를 눌렀는지 판단
			for(var i in response){
				contents.push(response[i]);
				//console.log(contents)
				if(response[i].id == myid){ //현재는 admin 계정으로 간주, 이후 세션 id값으로 변경
					CheckThumbsup = 1; 							
				} //if end
			}//for end
			totalThumbs = contents.length; // 좋아요 개수
			//console.log(totalThumbs)
			if(CheckThumbsup == 0){ //좋아요가 눌려져 있지 않음
				$(".modalContent").append
				("<div class='thumbsupBox'><span class='thumbsupButton' onclick='thumbsup()'>"+
				"<i class='far fa-heart fa-2x'></i></span>"+
				"<span class='postThumbsup'> 좋아요 : "+totalThumbs+"명이 좋아합니다.</span></div>");
			} else { //좋아요가 눌려져 있음
				$(".modalContent").append
				("<div class='thumbsupBox'><span class='thumbsupButton' onclick='thumbsup()'>"+
				"<i class='fas fa-heart fa-2x'></i></span>"+
				"<span class='postThumbsup'> 좋아요 : "+totalThumbs+"명이 좋아합니다.</span></div>");						
			}// if else end	
		},
		error : function(e){
			console.log(e)
		} // error end 
	}); // ajax end
}
// 댓글 작성 기능
function addComment(postNum){
	var myComment = $("#myComment").val() //댓글입력창의 값을 추출
	if(myComment == null || myComment.trim() == ""){ //댓글입력창에 값이 없을 경우
		alert("내용을 입력해주세요!")
	}
	else if(confirm("댓글을 작성하시겠습니까?")){
		var id = myid
		var postNum = postNum		
		$.ajax({
			url: "/addcomment",
			type: "post",
			data : {
				"postNum": postNum,
				"comments": myComment,
				"id" : myid
			},
			dataType : "text",
			success : function(response){
				//console.log(response)
				var commentList = []
				$(".commentsList").text("") // 댓글창 초기화				
				FunctionGetComment(postNum, commentList)
				$("#myComment").val("") //댓글 등록후 작성창에 내용 삭제
				alert("댓글 작성이 완료되었습니다.")
			},
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}//error
		}) //ajax end
	}//if end
}//addComment end
// 댓글 내용 반환 
function FunctionGetComment(postNum, commentList){
	$.ajax({ //댓글 불러옴
		url: "/getcomment",
		type: "post",
		data : {"postNum" : postNum},
		dataType : "json",
		//async: false,
		success: function(response){
			for(var i=0; i<response.length; i++){
				//console.log(response[i])
				commentList.push(response[i])
			}
			//console.log(commentList)
			if(commentList.length==0){
				$(".commentsList").html("<p class=commentEmpty>댓글이 없습니다.</p>")
			} // if end
			else { // 댓글 불러오기
				// 프로필 사진 불러오기
				for(var i=0; i<commentList.length; i++){
					FunctionGetProfileImage(commentList[i], i)
				}// for end
			}
		},//success end
		error : function(e){
			console.log(e)
		}//error end
	})//ajax end
} //function end


//댓글 프로필 이미지 반환, 내용 작성
var CheckCommentThumbsup = 0; //현재 게시물 좋아요를 눌렀는지 판단
function FunctionGetProfileImage(commentList, i){
	var profileImage = "";
	var cnt = i;
	$.ajax({ 
		url: "/getprofileimage",
		type: "post",
		data: {"id" : commentList.id},
		dataType: "text",
		async: false,
		success: function(response){					
			if(response=="0"){ //프로필 사진이 없을 때
				profileImage = '/images/basicprofileimage.jpg';
			}
			else {
				var imagePath = response.split("/")
				var imageName = imagePath[imagePath.length-1]
				profileImage = '/upload/'
				profileImage += imageName
			}//else end
			
			$.ajax({ 
				url : "/getcommentthumbsup",
				type : "post",
				data : {"commentNum" : commentList.commentNum},
				dataType : "json",
				async: false,
				success : function(response){
					contents = []
					for(var i in response){
						contents.push(response[i]);
// 						CheckCommentThumbsup = 0; 	
						if(response[i].id == myid){ //현재는 admin 계정으로 간주, 이후 세션 id값으로 변경
							CheckCommentThumbsup = 1; 							
						} //if end
					}//for end
					var totalThumbs = contents.length; // 좋아요 개수
					//console.log(totalThumbs)
					//<i class='far fa-heart fa'></i> 좋아요 "+totalThumbs+"개
					
					if(CheckCommentThumbsup == 0){ //좋아요가 눌려져 있지 않음
						$(".commentsList").append
						("<div class=oneComment>"+
						"<span><image class='commentImage' src='"+profileImage+"' onclick=location.href='/profile?id="+commentList.id+"'></span>"+
						"<div><p style='float:left; font-weight:bold' onclick=location.href='/profile?id="+commentList.id+"'> "+commentList.id+"</p>"+
						"<p style='text-align:left'> "+commentList.comments+"</p><p>"+commentList.commentsDate+"</p></div>"+
						"<span class=commentThumbsup_"+cnt+" onclick='commentThumbsup("+CheckCommentThumbsup+", "+commentList.commentNum+", "+totalThumbs+", "+cnt+")'>"+
						"<i class='far fa-heart'></i> 좋아요 "+totalThumbs+"개 </span>"+    // ("check")
						"<span>답글달기</span>"+
						"<div class=reply></div>"+
						"</div>")
					} else if(CheckCommentThumbsup == 1){ //좋아요가 눌려져 있음
						$(".commentsList").append
						("<div class=oneComment>"+
						"<span><image class='commentImage' src='"+profileImage+"' onclick=location.href='/profile?id="+commentList.id+"'></span>"+
						"<div><p style='float:left; font-weight:bold' onclick=location.href='/profile?id="+commentList.id+"'> "+commentList.id+"</p>"+
						"<p style='text-align:left'> "+commentList.comments+"</p><p>"+commentList.commentsDate+"</p></div>"+
						"<span class=commentThumbsup_"+cnt+" onclick='commentThumbsup("+CheckCommentThumbsup+", "+commentList.commentNum+", "+totalThumbs+", "+cnt+")'>"+
						"<i class='fas fa-heart'></i> 좋아요 "+totalThumbs+"개 </span>"+
						"<span>답글달기</span>"+
						"<div class=reply></div>"+
						"</div>")
					}// if else end	
					CheckCommentThumbsup = 0;
				},
				error : function(e){
					console.log(e)
				} // error end 
			}); // ajax end	
		},
		error: function(e){
			console.log(e)
		}//error end
	})//ajax end	
}// function end

//댓글에 좋아요 누르기
function commentThumbsup(CheckCommentThumbsup, commentNum, totalThumbs, cnt){
	var id = myid;
	var num = commentNum;
	
	if(CheckCommentThumbsup == 0){ //좋아요가 눌려있지 않은 경우
		$.ajax({
			url : "/commentthumbsplus",
			type : "get",
			data : {
				"commentNum" : commentNum,
				"id" : id
			},
			dataType : "text",
			success : function(response){
				totalThumbs = totalThumbs+1;
				CheckCommentThumbsup = 1; //parseInt(response);
				//console.log(CheckCommentThumbsup)
				$(".commentThumbsup_"+cnt+"").removeAttr("onclick") //클릭 속성 제거
				$(".commentThumbsup_"+cnt+"").attr("onclick", "commentThumbsup("+CheckCommentThumbsup+", "+commentNum+", "+totalThumbs+", "+cnt+")") //클릭 속성 내 Check~값 변경
				$(".commentThumbsup_"+cnt+"").html("<i class='fas fa-heart'></i> 좋아요 "+totalThumbs+"개 ")
			},
			error : function(e){
				console.log(e)
			} // error end
		}); // ajax end
	} 
	else if(CheckCommentThumbsup == 1){ // 좋아요가 이미 눌려있는 경우
		$.ajax({
			url : "/commentthumbsminus",
			type : "get",
			data : {
				"commentNum" : commentNum,
				"id" : id
			},
			dataType : "text",
			success : function(response){
				totalThumbs = totalThumbs-1;
				CheckCommentThumbsup = 0; //parseInt(response);
				$(".commentThumbsup_"+cnt+"").removeAttr("onclick") //클릭 속성 제거
				$(".commentThumbsup_"+cnt+"").attr("onclick", "commentThumbsup("+CheckCommentThumbsup+", "+commentNum+", "+totalThumbs+", "+cnt+")") //클릭 속성 내 Check~값 변경
				$(".commentThumbsup_"+cnt+"").html("<i class='far fa-heart'></i> 좋아요 "+totalThumbs+"개 ")
			},
			error : function(e){
				console.log(e)
			} // error end
		}); // ajax end
	}// else end
	return true;
}

// 컨텐츠 클릭시 작성자 프로필 이미지 추출
function FunctionGetContentProfileImage(postID){
	var profileImage = "";
	$.ajax({ 
		url: "/getprofileimage",
		type: "post",
		data: {"id" : postID},
		dataType: "text",
 		async: false,
		success: function(response){
			if(response=="0"){ //프로필 사진이 없을 때
				profileImage = '/images/basicprofileimage.jpg';
				return profileImage;
			}
			else {
				var imagePath = response.split("/")
				//console.log("경로 : "+ imagePath)
				var imageName = imagePath[imagePath.length-1]
				//console.log("이미지이름 : "+ imageName)
				profileImage = '/upload/'
				profileImage += imageName
			} // else end
		},
		error: function(e){
			console.log(e)
		}//error end
	}); //ajax end
	return profileImage;
}// function end

//서치 돋보기 클릭시 서치값 같이 넘김
function wordsearch(){
	var f = document.searchForm;
	f.submit();
}//function end


function FunctionCommentThumbs(){
	
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

<h1>해시태그 검색 리스트</h1>
<form action="/search" method="post" name="searchForm">
<div class="bar">
	<input type="text" id=searchbar name="searchWord" value='#<%=hashtag %>'>
<!-- 	<input type="submit" value="search"> -->
	<i class="fas fa-search fa-3x" id=fa-search type="submit" id="searchbutton" onclick="wordsearch()"></i>
</div>
</form>

<span id=searchresult>#<%=hashtag %> </span><span>검색결과</span><br>
<span id=totalhashtag></span>

<div id="searchBtn">
	<button id="favoriteBtn">인기 게시물</button>
	<button id="recentUpdateBtn">최근 게시물</button>
</div>

<div id=messageWindow>		
	<div id=thumbsupView>
		<div class="thumbsupBlock">
			<div class="thumbsupList"></div>
		</div>		
	</div>
	
	<div id=recentView>
		<div class="recentBlock">
			<div class="recentList"></div>	
		</div>
	</div>
</div>

<div class="modal" onclick="modalClick()">
	<div class="modalContent" onclick="modalContentClick()">
	</div>
</div>

<i class="fas fa-arrow-circle-up fa-3x" id="goToTopBtn" onclick="window.scrollTo(0,0)"></i>

</body>
</html>