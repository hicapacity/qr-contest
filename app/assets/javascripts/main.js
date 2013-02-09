(function(undefined){
  window.fbLoginComplete = function(fbresponse) {
    window.location.href = '/users/new?return=' + encodeURIComponent(window.location.pathname);
  };
  
  $(function() {
    $('#fblogin').on('click', function() {
      $('#login').hide();
      $('#loading').fadeIn();
      FB.login(function (response) {
        if (response.authResponse) {
          if (window.fbLoginComplete !== undefined)
            window.fbLoginComplete(response);
        } else {
          $('#loading').hide();
          $('#new-visitor').hide();
          $('#denied').show();
          $('#login').fadeIn();
        }
      });
      return false;
    });
  });
  
  window.fbInitialized = function() {
    FB.getLoginStatus(function (response) {
      if (response.status == 'connected') {
        // Already connected and authorized
        if (window.fbAuthorized !== undefined) {
          window.fbAuthorized(response);
        } else {
          $('#loading').hide();
          $('#main-content').fadeIn();
        }
      } else {
        // Not authorized or not logged in
        $('#loading').hide();
        $('#login').fadeIn();
      }
    });
  };
})();