$(function() {
  $('#fblogin').on('click', function() {
    $('#login').hide();
    $('#loading').fadeIn();
    FB.login(function (response) {
      $('#loading').hide();
      if (response.authResponse) {
        $('#main-content').fadeIn();
      } else {
        $('#new-visitor').hide();
        $('#denied').show();
        $('#login').fadeIn();
      }
      console.debug(response);
    });
  });
});

window.fbInitialized = function() {
  FB.getLoginStatus(function (response) {
    if (response.status == 'connected') {
      // Already connected and authorized
      $('#loading').hide();
      $('#main-content').fadeIn();
    } else {
      // Not authorized or not logged in
      $('#loading').hide();
      $('#login').fadeIn();
    }
    console.debug(response);
  });
}