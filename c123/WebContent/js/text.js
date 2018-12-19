function checkAll(check_name) {
var check_x = document.getElementById(check_name).checked;
var chk = document.getElementsByName("s_val[]");
	if (check_name == "All_check1") {
		for(i = 0; i < 5; i++) chk.item(i).checked = check_x;
	}
	else if (check_name == "All_check2") {
		for(i = 5; i < 30; i++) chk.item(i).checked = check_x;
	}
}
