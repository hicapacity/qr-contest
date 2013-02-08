$(function() {
  $('#fblogin').on('click', function() {
    FB.login(function (response) {
      if (response.authResponse) {
      
      } else {
        
      }
    });
  });
});

window.fbInitialized = function() {
  FB.getLoginStatus(function (response) {
    if (response.status == 'connected') {
      // Already connected and authorized
    } else {
      // Not authorized or not logged in
    }
    console.debug(response);
  });
}