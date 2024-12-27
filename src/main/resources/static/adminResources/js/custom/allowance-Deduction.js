function getSalary(){
	
	const id = $("#designationId").val();
	
	var htp = new XMLHttpRequest();

	htp.onreadystatechange = function() {

		if (htp.readyState == 4) {

			var jsn = JSON.parse(htp.responseText);

			$("#basicSalary").val(jsn.basicSalary);
			console.log(jsn);
		}
	}

	htp.open("get", "getSalaryByDesignation?id=" + id, true);
	htp.send();
	
}