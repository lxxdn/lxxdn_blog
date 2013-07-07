$(document).ready(function(){
	url = window.location.href;
	if(url.indexOf("about_me") >= 0){
		$(".onglet").removeClass("active");
		$(".about_me").addClass("active");
	}
	if(url.indexOf("archives") >= 0){
		$(".onglet").removeClass("active");
		$(".archives").addClass("active");
	}
  
});