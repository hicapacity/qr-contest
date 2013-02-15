(function() {
  var originalFbAuthorized = window.fbAuthorized;
  window.fbAuthorized = function(response) {
    originalFbAuthorized();
    $('#badge-popup')
      .fadeIn(400)
      .delay(800)
      .fadeOut(400);
  };
})();