window.onload = function() {
//	alert("JS Test");
};

$(function() {
	
//	$('.carousel').carousel();
	  $('li a[href^="/' + location.pathname.split("/")[1] + '"]').parent('li').addClass('active');
});

