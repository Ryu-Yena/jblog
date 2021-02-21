<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">

</head>
<body>
	<div id="center-content">
		
		<!-- 메인 해더 -->
		<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>

		<div>		
			<form id="joinForm" method="post" action="${pageContext.request.contextPath}/user/join">
				<table>
			      	<colgroup>
						<col style="width: 100px;">
						<col style="width: 170px;">
						<col style="">
					</colgroup>
		      		<tr>
		      			<td><label for="txtId">아이디</label></td>
		      			<td><input id="txtId" type="text" name="id"></td>
		      			<td><button id="btnIdCheck" type="button">아이디체크</button></td>
		      		</tr>
		      		<tr>
		      			<!-- 아이디 사용가능여부 메세지 -->
		      			<td></td>
		      			<td id="tdMsg" colspan="2"></td>
		      		</tr> 
		      		<tr>
		      			<td><label for="txtPassword">패스워드</label> </td>
		      			<td><input id="txtPassword" type="password" name="password"  value=""></td>   
		      			<td></td>  			
		      		</tr> 
		      		<tr>
		      			<td><label for="txtUserName">이름</label> </td>
		      			<td><input id="txtUserName" type="text" name="userName"  value=""></td>   
		      			<td></td>  			
		      		</tr>  
		      		<tr>
		      			<td><span>약관동의</span> </td>
		      			<td colspan="3">
		      				<input id="chkAgree" type="checkbox" name="agree" value="y">
		      				<label for="chkAgree">서비스 약관에 동의합니다.</label>
		      			</td>   
		      		</tr>   		
		      	</table>
	      		<div id="btnArea">
					<button id="btnJoin" class="btn" type="submit" >회원가입</button>
				</div>
	      		
			</form>
			
		</div>
		
		
		<!-- 메인 푸터  자리-->
		<c:import url="/WEB-INF/views/includes/main-footer.jsp"></c:import>
	</div>

</body>

<script type="text/javascript">

	$("#btnIdCheck").on("click", function(){
		var uid = $("#txtId").val();
		console.log(uid);
			
		//ajax 데이터만 받을래...
		$.ajax({
			
			url : "${pageContext.request.contextPath }/user/idcheck",		
			type : "get",
			// contentType : "application/json",
			data : {id: uid},

			dataType : "text",
			success : function(result){
				/*성공시 처리해야될 코드 작성*/
				if(result == 'can'){
					console.log("can");
					$("#tdMsg").html("사용할 수 있는 아이디입니다.");
				}else {
					console.log("cant");
					$("#tdMsg").html("사용할 수 없는 아이디입니다.");
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
	});
	
	
	
	//폼을 submit할때 --> submit되기 전
	$("#joinForm").on("submit", function(){
		
		//패스워드 체크준비
		var pw = $("txtPassword").val();
		console.log(pw.length);
		
		//동의여부체크준비
		var check = $("#chkAgree").is(":checked"); //false --> 체크안했음
		
		//이름 입력여부
		var name = $("#txtUserName").val();
		console.log(name)
		
		if(pw.length < 8){
			//패스워드 체크 나머지 alert(패스워드는 8글자 이상입니다.)
			alert("패스워드는 8글자 이상입니다.");
			return false;
		}
		
		if(!check){
			alert("동의해주세요");
			return false;
		}
		
		if(name == null){
			alert("이름을 입력해주세요");
			return false;
		}
		
		return true;

	});



</script>

</html>