<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 등록</title>
		<link rel="stylesheet" href="../resources/css/main.css">
	</head>
	<body>
		<h1>공지 등록</h1>
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
			<div>
				<button type="button" onclick="showModifyPage();">수정하기</button>
				<button>삭제하기</button>
				<button type="button" onclick="showboardList();">목록으로</button>
			</div>
			<!-- 댓글 등록 -->
			<form action="/board/addReply.kh" method="post">
				<table width="500" border="1">
					<tr>
						<td>
							<textarea rows="3" cols="55"></textarea>
						</td>
						<td>
							<input type="submit" value="완료">
						</td>
				</table>
			</form>
			<!-- 댓글 목록 -->
			<table width="500" border="1">
				<tr>
					<td>일용자</td>
					<td>처음이시군요 환영합니다</td>
					<td>2023-08-24</td>
					<td>
						<a href="#">수정하기</a>
						<a href="#">삭제하기</a>
					</td>
				</tr>
				<tr>
					<td>이용자</td>
					<td>두번째이시군요 환영합니다</td>
					<td>2023-08-24</td>
					<td>
						<a href="#">수정하기</a>
						<a href="#">삭제하기</a>
					</td>
				</tr>
				<tr>
					<td>삼용자</td>
					<td>세번째이시군요 환영합니다</td>
					<td>2023-08-24</td>
					<td>
						<a href="#">수정하기</a>
						<a href="#">삭제하기</a>
					</td>
				</tr>
			</table>
			<script>
				function showModifyPage() {
					const boardNo = "${board.boardNo}";
					location.href="/board/modify.kh?boardNo="+ boardNo;
				}
				function showBoardList() {
					location.href="/board/list.kh";
				}
			</script>
	</body>
</html>