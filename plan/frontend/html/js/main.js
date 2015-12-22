// JavaScript Document


$(document).ready(function() {

	$('input').iCheck({
		checkboxClass: 'icheckbox_square',
		radioClass: 'iradio_square',
	});
	
	$(".selbox").selectbox();
	
	$( ".datepicker" ).datepicker();

	$(".datepicker").on("blur", function(e) { $(this).datepicker("hide"); });
	
	$('.fancybox').fancybox({
		padding:0
		});
	
	$("#content .search_main .ser_leftbar .filter_box > ul > li > a").click(function (e) {
			e.preventDefault();
			$(this).parent().find('ul').slideToggle(300);
			if ($(this).parent().hasClass('active') ) {
				$(this).parent().removeClass('active')
			} else { 
				$(this).parent().addClass('active');
				
			}
		});
		
});