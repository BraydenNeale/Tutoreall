// Validation fields related to users - Tutors/Students/Organisations

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

// $( "#register_form" ).submit(function( event ) {

function validate_generic_string_field(field, min, max, title, messages)
{
  if(field == null || field == "") {
    messages.push("Please fill in your ", title, ".");
    return;
  }

  if(field.length < min) {
    messages.push("Your ", title, " is too short.");
  }

  if(field.length > max) {
    messages.push("Your ", title, "is too long.");
  }
}

function tutor_registation_validation()
{
  var messages = [];
  // var form = document.getElementById("register_form");
  // var field = form.elements["tutor[firstname]"].value;
  // validate_generic_string_field(field, 2, 35, "firstname", messages); // firstname

  // field = form.elements["tutor[lastname]"].value;
  // validate_generic_string_field(field, 2, 35, "lastname", messages); // lastname

  // field = form.elements["tutor[email]"].value;
  // validate_generic_string_field(field, 3, 254, "email", messages); // email

  // if(field != form.elements["confirm_email"].value)
  // {
  //   messages.push("Your email addressed do not match");
  // }

  // field = form.elements["tutor[password]"].value;
  // validate_generic_string(field, 8, 128, "password", messages); // password

  // if(field != form.elements["tutor[password_confirmation]"].value)
  // {
  //   messages.push("Your passwords do not match");
  // }

  messages.push("this should fail");
  if (messages.length > 0)
  {
    // alert(messages.join('\n'));
    swal('Oh no.', messages.join('\n'), 'error');
    return false;
  }

  return true;
}