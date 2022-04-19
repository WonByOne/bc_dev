var writerstr = "작성자를 입력하세요.";
var subjectstr = "제목을 입력하세요.";
var contentstr = "내용을 입력하세요.";
var passwdstr = "비밀번호를 입력하세요.";

var passwderror = "Wrong password.\nCheck password.";
var deleteerror = "Failed to delete.\nTry again after a while.";

function erroralert(msg) {
	alert(msg);
	history.back();
}

// 글 작성
function writecheck() {
	if(! writeform.writer.value) {
		alert(writerstr);
		writeform.writer.focus();
		return false;
	} else if(! writeform.subject.value) {
		alert(subjectstr);
		writeform.subject.focus();
		return false;
	} else if(! writeform.content.value) {
		alert(contentstr);
		writeform.content.focus();
		return false;
	} else if(! writeform.passwd.value) {
		alert(passwdstr);
		return false;
	}
}