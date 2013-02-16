(function() {
  var originalFbAuthorized = window.fbAuthorized;
  window.fbAuthorized = function(response) {
    originalFbAuthorized();
    
    // Show the badge animation
    var width = $(window).width();
    var height = $(window).height();
    var body = $('body').addClass('scrolllock');
    var popup = $('<div class="badge"><div class="burst"/><img src="' + window.badgePath + '"/></div>')
      .css({
        position: 'absolute',
        zIndex: '9000',
        top: '0',
        left: '0',
        width: width + 'px',
        height: height + 'px'
      })
      .find('img')
        .css({
          display: 'block',
          width: '200px',
          height: '227px',
          margin: Math.floor((height - 227) / 2) + 'px auto 0'
        })
      .end()
      .prependTo(body);
    popup
      .fadeIn(500)
      .delay(3000)
      .fadeOut(500, function() {
        body.removeClass('scrolllock');
        popup.remove();
      });
    
    // Log the badge to facebook
    if (window.logBadge) {
      FB.api('/me/hicapacity:win', 'post',
        {badge: window.logBadge});
    }
  };
})();