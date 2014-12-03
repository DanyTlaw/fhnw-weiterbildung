$(document).ready(function(){
	$("#stext").hide();
	$("#sbutton").click(function(){
		var sparams = document.getElementById('stext').value;
		if(sparams.match(/\S/)){
		} else {
			$("#stext").toggle();
			return false;
		}
	});
});