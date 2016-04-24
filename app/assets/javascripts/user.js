// Validation fields related to users - Tutors/Students/Organisations

// Ajax requests for devise form from partial views
// Even failed logins returning ajax success...
$(document).on('submit', '#login_tutor', function(e) {
}).on('ajax:success', '#login_tutor', function(e, data, status, xhr) {
  window.location.assign("");
  swal({
    title: "Success",
    text: "Logging you in now",
    type: 'success',
    timer: 2000
  });
}).on('ajax:error', '#login_tutor', function(e, data, status, xhr) {
  swal({
    title: 'Oh no.',
    text: 'Please check your email, password and try again',
    type: 'error',
    timer: 1000
  });
});

$(document).on('submit', '#login_student', function(e) {
}).on('ajax:success', '#login_student', function(e, data, status, xhr) {
  window.location.assign("")
  swal({
    title: "Success", 
    text: "Logging you in now", 
    type: 'success',
    timer: 2000
  });
}).on('ajax:error', '#login_student', function(e, data, status, xhr) {
  swal({
    title: 'Oh no.',
    text: 'Please check your email, password and try again',
    type: 'error',
    timer: 1000
  });
});

// $(document).on('submit', '#register_form', function(e){
// }).on('ajax:success', '#register_form', function(e, data, status, xhr) {
//   window.location.assign("")
//   swal("Welcome to Tutorial Academy", "Please confirm your account via the confirmation email that has been sent", 'success');
// }).on('ajax:error', '#register_form', function(e, data, status, xhr) {
//   swal('Oh no.', 'Please ensure all fields were filled out correctly and try again', 'error');
// });

$(document).on('ajax:success', '#register_form', function(e, data, status, xhr) {
  window.location.assign("")
  swal({
    title: "Welcome to Tutorial Academy",
    text: "Please confirm your account via the confirmation email that has been sent",
    type: 'success',
    timer: 2000
  });
}).on('ajax:error', '#register_form', function(e, data, status, xhr) {
  swal({
    title: 'Oh no.',
    text: 'Please ensure all fields were filled out correctly and try again',
    type: 'error',
    timer: 1000
  });
});

function validate_generic_string_field(field, min, max, title, messages)
{
  if(field == null || field == "") {
    messages.push("Please fill in your " + title + ".");
    return;
  }

  if(field.length < min) {
    messages.push("Your " + title + " is too short.");
  }

  if(field.length > max) {
    messages.push("Your " + title + "is too long.");
  }
}

function tutor_registation_validation(event)
{
  var messages = [];

  var field = document.getElementById("tutor_firstname").value;
  validate_generic_string_field(field, 2, 35, "firstname", messages); // firstname

  field = document.getElementById("tutor_lastname").value;
  validate_generic_string_field(field, 2, 35, "lastname", messages); // lastname

  // ... tutor_email value is always blank.. rails bug?
  field = document.getElementById("tutor_email").value;
  validate_generic_string_field(field, 3, 254, "email", messages); // email

  if(field != document.getElementById("confirm_email").value)
  {
    messages.push("Your email addresses do not match");
  }

  // tutor_password is always blank.. rails bug?
  field = document.getElementById("tutor_password").value;
  validate_generic_string_field(field, 8, 128, "password", messages); // password

  if(field != document.getElementById("tutor_password_confirmation").value)
  {
    messages.push("Your passwords do not match");
  }

  if (messages.length > 0)
  {
    swal("", messages.join('\n'));
    // event.preventDefault();
    return false;
  }

  return true;
}