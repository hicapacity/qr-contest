window.fbLoginComplete = function(response) {
  var path = '/users/new?return=' + encodeURIComponent(window.location.pathname);
  if (response && response.authResponse && response.authResponse.userID)
    path += '&fbid=' + response.authResponse.userID;
  window.location.href = path;
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