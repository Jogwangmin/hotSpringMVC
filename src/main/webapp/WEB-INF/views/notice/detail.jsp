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
					<span>${notice.noticeSubject }</span>
				</li>
				<li>
					<label>작성자</label>
					<span>${notice.noticeWriter }"</span>
				</li>
				<li>
					<label>내용</label>
					<p>${notice.noticeContent }</p>
				</li>
				<li>
					<label>첨부파일</label>
					<!-- String으로 받을 수 없고 변환작업이 필요함 -->
					<img alt="첨부파일" src="../resources/nuploadFiles/${notice.noticeFilename }">
					<a href="../resources/nuploadFiles/${notice.noticeFileRename }" download>${notice.noticeFilename }</a>
				</li>
			</ul>
			<div>
				<button type="button" onclick="showModifyPage();">수정하기</button>
				<button>삭제하기</button>
			</div>
			<script>
				function showModifyPage() {
					const noticeNo = "${notice.noticeNo}";
					location.href="/notice/modify.kh?noticeNo="+ noticeNo;
				}
			</script>
	</body>
</html>