<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	var user = sessionStorage.getItem("user")
	
	
	$("#fileUpload").on('click', function(event){
		event.preventDefault()
		
		var form = $("#fileForm")[0]
		var formData = new FormData(form)
		formData.append("file", $("#selectedFile")[0].files[0])
		$.ajax({
			url:'/getODjson',
			type:'post',
			data: formData,
			processData:false,
			contentType:false,
			success: function(response){
				var responseSplit = response.split("|")
				var filename = responseSplit[0]
				var odjson = JSON.parse(responseSplit[1])
				var cfrjson = JSON.parse(responseSplit[2])
				
				//캔버스에 이미지 로드(canvas 태그 + canvas 자바스크립트 라이브러리)
				var imagecanvas = document.getElementById("imagecanvas")//htmlobject타입
				var context = imagecanvas.getContext("2d")
				context.fillStyle = "red"
				context.font = '15px batang'
				context.strokeStyle = 'green'
				context.lineWidth = 3
				
				//이미지 로드
				var image = new Image()
				image.src = "/upload/" + filename
				image.onload = function(){
					context.drawImage(image, 10, 10, image.width, image.height)
					
					//od json
					var names = odjson.predictions[0].detection_names
					var confidence = odjson.predictions[0].detection_scores
					var boxes = odjson.predictions[0].detection_boxes
					
					//cfr json 
					var faces = cfrjson.faces 
					
					for(var i = 0; i < names.length; i++){
						//if(confidence[i]>=0.9){
							var y1 = boxes[i][0]*image.height
							var x1 = boxes[i][1]*image.width
							var y2 = boxes[i][2]*image.height
							var x2 = boxes[i][3]*image.width
							
							if(!(names[i]=="person")){
								//이름 : 00% 출력
								context.fillText(names[i]+" : " + parseInt(confidence[i]*100) + "%", x1+10, y1+10)
								
								//사각형 그려서 출력
								context.strokeRect(x1+10, y1+10, x2-x1, y2-y1)
								$("#hashtags").append("<a href='https://search.shopping.naver.com/search/all?query="+names[i]+"&cat_id=&frm=NVSHATC'>#" + names[i] + " </a>")
							}
							
						//}//if end
					}//for end
					
					//cfr데이터를 해쉬태그로 추가해주기
					for(var i = 0; i<faces.length; i++){
						var celebrity = faces[i].celebrity.value
						var confidence = faces[i].celebrity.confidence
						
						if(confidence>0.5){
							$("#hashtags").append("<a href='https://search.shopping.naver.com/search/all?query="+celebrity+"&cat_id=&frm=NVSHATC'>#" + celebrity + " </a>")
						}//if end
					}//for end
					
				}//image onload end
			}
		})
		
		
	})//fileUpload onclick end
})//document ready end

function saveImage(){
	var $canvas = document.getElementById('imagecanvas');
    var imgDataUrl = $canvas.toDataURL('image/png', 1.0)

    var blobBin = atob(imgDataUrl.split(',')[1]);	// base64 데이터 디코딩
    var array = [];
    for (var i = 0; i < blobBin.length; i++) {
        array.push(blobBin.charCodeAt(i));
    }
    var file = new Blob([new Uint8Array(array)], {name:'$("#selectedFile")[0].files[0]',type: 'image/png'});	// Blob 생성
    var formdata = new FormData();	// formData 생성
    var fileValue = $("#selectedFile").val().split("\\");
    var fileName = fileValue[fileValue.length-1];

    formdata.append("file", file, fileName);	// file data 추가
    
    $.ajax({
        type : 'post',
        url : '/saveImage',
        data : formdata,
        processData : false,	// data 파라미터 강제 string 변환 방지!!
        contentType : false,	// application/x-www-form-urlencoded; 방지!!
        success : function (data) {
        	alert(data)
        }

    });
    
    alert($("#hashtags").html())
}
</script>
</head>
<body>
<form id="fileForm" method=post enctype="multipart/form-data">
이미지 <input id="selectedFile" type = file name="file"><br>
<button id="fileUpload">이미지 분석</button>
</form>

<canvas id="imagecanvas" width=500 height=500 style="border: 2px solid pink"></canvas>
<h5>해쉬태그 입력</h5>
<div id="hashtags"></div>
<form>
<input type="text" id="names" style=""></input><br>
내용 입력
<textarea id="contents" rows="3" cols="100"></textarea>
</form>
<button id="postUpload" onclick="saveImage()">작성하기</button>
</body>
</html>