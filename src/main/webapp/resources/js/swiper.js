/**
 * 
 */

$(document).ready(function(){
	//swiper
	var swiper = new Swiper(".mySwiper", {
	    slidesPerView: 1,
	    spaceBetween: 30,
	    slidesPerGroup: 1,
	    loop: true,
	    loopFillGroupWithBlank: true,
	    navigation: {
	      nextEl: ".swiper-button-next",
	      prevEl: ".swiper-button-prev"
	   }
	});
});
