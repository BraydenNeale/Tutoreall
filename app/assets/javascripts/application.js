// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// require jquery
//= require sweetalert
//= require jquery-1.7.2.min
//= require jquery.turbolinks
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require_tree .
// require chosen-jquery
//= require messages
//= require local_time

// some jquery clashes I need to sort
// require_tree ../../../vendor/assets/javascripts/.
// require jquery-1.7.2.min
//= require bootstrap
//= require jquery.fancybox
//= require jquery.icheck
//= require jquery.selectbox-0.2

// JavaScript Document
// From front-end dev
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

  $('a.fancybox').fancybox({
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

   $(".settings_filter > ul > li > a").click(function (e) {
      e.preventDefault();
      $(this).parent().find('ul').slideToggle(300);
      if ($(this).parent().hasClass('active') ) {
        $(this).parent().removeClass('active')
      } else { 
        $(this).parent().addClass('active');
      }
    });
});

// Ajax requests for devise form from partial views
// Even failed logins returning ajax success...
$(document).on('submit', '#login_tutor', function(e) {
}).on('ajax:success', '#login_tutor', function(e, data, status, xhr) {
  window.location.assign("");
  swal("Success", "Logging you in now", 'success');
}).on('ajax:error', '#login_tutor', function(e, data, status, xhr) {
  swal('Oh no.', 'Please check your email, password and try again' ,'error');
});

$(document).on('submit', '#login_student', function(e) {
}).on('ajax:success', '#login_student', function(e, data, status, xhr) {
  window.location.assign("")
  swal("Success", "Logging you in now", 'success');
}).on('ajax:error', '#login_student', function(e, data, status, xhr) {
  swal('Oh no.', 'Please check your email, password and try again' ,'error');
});

$(document).on('submit', '#register_form', function(e){
}).on('ajax:success', '#register_form', function(e, data, status, xhr) {
  window.location.assign("")
  swal("Welcome to Tutorial Academy", "Please confirm your account via the confirmation email that has been sent", 'success');
}).on('ajax:error', '#register_form', function(e, data, status, xhr) {
  swal('Oh no.', 'Please ensure all fields were filled out correctly and try again', 'error');
});