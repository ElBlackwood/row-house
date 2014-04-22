window.onload = function() {
//	alert("JS Test");
};

$(function() {
	  $('li a[href^="/' + location.pathname.split("/")[1] + '"]').parent('li').addClass('active');
	  
	  spinCarousel();

	  $('.rotato-img').on('mouseover', function() {
		  $('.carousel').carousel('pause');  
	  });
	  $('.rotato-img').on('mouseleave', function() {
		  spinCarousel(); 
	  });
});

function spinCarousel() {
	  $('.carousel').carousel({
		  interval: 6000
	  });
}