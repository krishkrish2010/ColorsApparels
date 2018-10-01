function validateAmountFormat() {
	var taxValue = document.getElementById("price").value;
	var reg = new RegExp("^\\d+(.\\d{1,2})?$");
	if (taxValue != null) {
		if (!reg.test(taxValue)) {
			alert("Please enter in correct format.(Ex:5.00)")
			document.getElementById("price").style.background = "red";
		}
	}
}
function onFocus() {
	document.getElementById("price").style.background = "white";
}