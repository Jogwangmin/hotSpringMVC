<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 상세</title>
		<link rel="stylesheet" href="../resources/css/main.css">
	</head>
	<body>
		<h1>게시글 상세</h1>
			<ul>
				<li>
					<label>제목</label>
					<span>${board.boardTitle }</span>
				</li>
				<li>
					<label>작성자</label>
					<span>${board.boardWriter }"</span>
				</li>
				<li>
					<label>내용</label>
					<p>${board.boardContent }</p>
				</li>
				<li>
					<label>첨부파일</label>
					<!-- String으로 받을 수 없고 변환작업이 필요함 -->
<%-- 					<img alt="첨부파일" src="../resources/nuploadFiles/${board.boardFilename }"> --%>
					<a href="${board.boardFilepath }" download>${board.boardFilename }</a>
				</li>
			</ul>
			<br><br>
			<div>
				<button type="button" onclick="showModifyPage();">수정하기</button>
				<button>삭제하기</button>
				<button type="button" onclick="showboardList();">목록으로</button>
			</div>
			<!-- 댓글 등록 -->
			<hr>
			<form action="/reply/add.kh" method="post">
			<input type="hidden" name="refBoardNo" value="${board.boardNo }">
				<table width="500" border="1">
					<tr>
						<td>
							<textarea rows="3" cols="55" name="replyContent"></textarea>
						</td>
						<td>						
							<input type="submit" value="완료">
						</td>
					</tr>
				</table>
			</form>
			<!-- 댓글 목록 -->
			<table width="550" border="1">
				<c:forEach var="reply" items="${rList }">
				<tr>
					<td>${reply.replyWriter }</td>
					<td>${reply.replyContent }</td>
					<td>${reply.rCreateDate }</td>
					<td>
						<a href="javascript:void(0)" onclick="showReplyModifyForm(this,'${reply.replyContent }');">수정하기</a>
						<a href="javascript:void(0)" onclick="deleteReply();">삭제하기</a>
					</td>
				</tr>
				<tr id="replyModifyForm" style="display:none;">
<!-- 					<form action="/reply/update.kh" method="post"> -->
<%-- 						<input type="hidden" name="replyNo" value="${reply.replyNo }"> --%>
<%-- 						<input type="hidden" name="refBoardNo" value="${reply.refBoardNo }"> --%>
<%-- 						<td colspan="3"><input type="text" size="50" name="replyContent" value=${reply.replyContent }></td> --%>
<!-- 						<td><input type="submit" value="완료"></td> -->
<!-- 					</form> -->
						<td colspan="3"><input id="replyContent" type="text" size="50" name="replyContent" value=${reply.replyContent }></td>
						<td><input type="button" onclick="replyModify(this,'${reply.replyNo}','${reply.refBoardNo }');" value="완료"></td>
				</tr>
				</c:forEach>
			</table>
			<script>
				function showModifyPage() {
					const boardNo = "${board.boardNo }";
					location.href="/board/modify.kh?boardNo="+boardNo;
				}
				function showBoardList() {
					location.href="/board/list.kh";
				}
				function replyModify(obj, replyNo, refBoardNo){
					// DOM 프로그래밍을 이용하는 방법
					const form = document.createElement("form");
					form.action = "/reply/update.kh";
					form.method = "post";
					const input = document.createElement("input");
					input.type = "hidden";
					input.value = replyNo;
					input.name = "replyNo";
					const input2 = document.createElement("input");
					input2.type = "hidden";
					input2.value = refBoardNo;
					input2.name = "refBoardNo";
					const input3 = document.createElement("input");
					input3.type = "text";					
					// 여기를 this를 이용하여 수정
// 					input3.value = document.querySelector("#replyContent").value;
					// this를 이용해서 내가 원하는 노드 찾기
					input3.value = obj.parentElement.previousElementSibling.childNodes[0].value;
// 					obj.parentElement.previousElementSibling.childNodes[0].value
					input3.name = "replyContent";
					form.appendChild(input);
					form.appendChild(input2);
					form.appendChild(input3);
					
					document.body.appendChild(form);
					form.submit();
				}
				
				function showReplyModifyForm(obj, replyContent){
				// #1. HTML태그, display:none 사용하는 방법
// 				document.querySelector("replModifyFomr").style.display="";
				obj.parentElement.parentElement.nextElementSibling.style.display="";
				
				
					// # 2. DOM 프로그래밍을 이용하는 방법
// 					<tr id="replyModifyForm" style="display:none;">
// 						<td colspan="3"><input type="text" size="50" value="${reply.replyContent}"
// 						<td><input type="button" value="완료"></td>
// 					</tr>
//  				const trTag = document.createElement("tr");
// 				const tdTag1 = document.createElement("td");
// 				tdTag1.colSpan = 3;
// 				const inputTag1 = document.createElement("input");
// 				inputTag1.type = "text";
// 				inputTag1.size=50;
// 				inputTag1.value="?";
// 				tdTag1.appendChild(inputTag1);
// 				const tdTag2 = document.createElement("td");
// 				const inputTag2 = document.createElement("input");
// 				inputTag2.type="button";
// 				inputTag2.value="완료";
// 				tdTag2.appendChild(inputTag2);
// 				trTag.appendChild(tdTag1);
// 				trTag.appendChild(tdTag2);
// 				console.log(trTag);
// 				// 클릭한 a를 포함하고 있는 tr 다음에 수정폼이 있는 tr 추가하기
// 				const prevTrTag = obj.parentElement.parentElement;
// // 				if(prevTrTag.nextElementSibling == null || !prevTrTag.nextElementsSibling.querySelector("input"))
// 					prevTrTag.parentNode.insertBefore(trTag, prevTrTag.nextSibling);
				}
			</script>
	</body>
</html>