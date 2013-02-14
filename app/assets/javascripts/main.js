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
})();