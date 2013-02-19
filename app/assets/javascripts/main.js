window.fbLoginComplete = function(response) {
  window.location.href = '/users/new?return=' + encodeURIComponent(window.location.pathname);
};

$(function() {
  $('#fblogin').on('click', function() {
    $('#login').hide();
    $('#loading').fadeIn();
    FB.login(function (response) {
      if (response.authResponse) {
        window.fbLoginComplete(response);
      } else {
        $('#loading').hide();
        $('#new-visitor').hide();
        $('#denied').show();
        $('#login').fadeIn();
      }
    }, {scope: 'publish_actions'});
    return false;
  });
});