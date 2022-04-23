var idstr = "Input ID"
var passwdstr = "Input Password"
var repasswdstr = "Check Password"
var namestr = "Input Name"
var ssnstr = "Check Social Security Number"
var confirmstr = "Check ID avaliability."
var emailstr = "Check E-MAIL format."

var inputerror = "Failed to sign up.\nTry again after a while."
var iderror = "No such ID.\nPlease check ID again."
var passwderror = "Wrong password.\nPlease check again."
var deleteerror = "Unable to delete account.\nTry again after a while."
var modifyerror = "Unable to modify infomation.\nTry again after a while."

function erroralert(msg){
	alert(msg);
	history.back();
}

// 회원 정보 수정
function modifycheck() {
	if( ! modifyform.passwd.value) {
		alert(passwdstr);
		modifyform.passwd.focus();
		return false;
	} else if(modifyform.passwd.value != modifyform.repasswd.value) {
		alert(repasswdstr);
		modifyform.passwd.focus();
		return false;
	}
}

// 로그인
function logincheck() {
	if(! loginform.id.value) {
		alert(idstr);
		loginform.id.focus();
		return false;
	} else if(! loginform.passwd.value) {
		alert(passwdstr);
		loginform.passwd.focus();
		return false;
	}
}
// 비밀번호만 확인
function passwdchk() {
	if(! passwdform.passwd.value) {
		alert(passwdstr);
		passwdform.passwd.focus();
		return false;
	}
}

//  중복 확인
function confirmid() {
	if(! inputform.id.value) {
		alert(idstr);
		inputform.id.focus();
	} else {
		url = "confirmid.do?id="+inputform.id.value;
		open(url, "confirm", "scrollbar=no, menubar=no, status=no, width=450, height=200");
	}
}

function confirmidwin() {
	if(! confirmidform.id.value) {
		alert(idstr);
		confirmidform.id.focus();
		return false;
	}
}

function setid(id) {
	opener.document.inputform.id.value = id;
	window.close();
	opener.document.inputform.confirm.value = 1;
}

// Sign in Page
function inputcheck() {
	if(! inputform.id.value) {
		alert(idstr);
		inputform.id.focus();
		return false;	// 다음으로 넘어가는 event를 막기 위한 return 값
	} else if(! inputform.passwd.value) {
		alert(passwdstr);
		inputform.passwd.focus();
		return false;
	} else if(inputform.passwd.value != inputform.repasswd.value) {
		alert(repasswdstr);
		inputform.passwd.focus();
		return false;
	} else if(! inputform.name.value) {
		alert(namestr);
		inputform.name.focus();
		return false;
	} else if(inputform.birth.value.length < 6 || inputform.ssn.value < 7) {
		alert(ssnstr);
		inputform.birth.focus();
		return false;
	}
	// 중복 확인 부분
	if(inputform.confirm.value == 0) {
		alert(confirmstr);
		inputform.id.focus();
		return false;
	}
	
	// 이메일 // 직접입력일경우 @가 있어야 함 // 선택일 땐 @ 제외
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	// 이메일 형식을 만족하는 정규표현식 : 찾아볼 것
	if(inputform.email_id.value) {
		if(inputform.email_prov.value == 0) {
			if(regEmail.test(inputform.email_id.value) == false ) {
				alert(emailstr);
				inputform.email_id.focus();
				return false;
			}
		} else if(inputform.email_id.value.indexOf("@") != -1 ) { 	// @ 있으면 에러
			alert(emailstr);
			inputform.email_id.focus();
			return false;
		}
	}
}

// 글자 수 채워지면 다음 입력 창으로 - 배열로 만드는 것 고려해볼 것
function nextbirth() {	
	if(inputform.birth.value.length > 5) {
		inputform.ssn.focus();
	}
}
function nextssn() {
	if(inputform.ssn.value.length > 6) {
		inputform.tel1.focus();
	}
}
function nexttel1() {
	if(inputform.tel1.value.length > 2) {
		inputform.tel2.focus();
	}
}
function nexttel2() {
	if(inputform.tel2.value.length > 3) {
		inputform.tel3.focus();
	}
}
function nexttel3() {
	if(inputform.tel3.value.length > 3) {
		inputform.email_id.focus();
	}
}


// Main Page

function maincheck() {
	if(! mainform.id.value) {
		alert(idstr);
		mainform.id.focus();
		return false;
	} else if(! mainform.passwd.value) {
		alert(passwdstr);
		mainform.passwd.focus();
		return false;
	}
}