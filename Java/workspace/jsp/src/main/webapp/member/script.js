// Main Page
var idstr = "Input ID"
var passwdstr = "Input Password"
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