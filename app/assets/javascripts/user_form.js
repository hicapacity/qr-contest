window.fbAuthorized = function (fbresponse) {
  FB.api('/me', function(response) {
    console.log(response);
    $('#user_fbid').val(response.id);
    $('.use-profile-pic').append('<img src="//graph.facebook.com/' + response.id + '/picture" />');
    if ($('#user_use_profile_pic').val() == 'true')
      $('.dont-use-profile-pic').addClass('is-disabled');
    else
      $('.use-profile-pic').addClass('is-disabled');
    if ($('#user_username').val() == '')
      $('#user_username').val(response.name);
    $('#loading').hide();
    $('#main-content').fadeIn();
  });
};

$(function() {
  $('.use-profile-pic').on('click', function() {
    var $this = $(this);
    if ($this.is('.is-disabled')) {
      $this.removeClass('is-disabled');
      $('.dont-use-profile-pic').addClass('is-disabled');
      $('#user_use_profile_pic').val('true');
    }
    return false;
  });
  $('.dont-use-profile-pic').on('click', function() {
    var $this = $(this);
    if ($this.is('.is-disabled')) {
      $this.removeClass('is-disabled');
      $('.use-profile-pic').addClass('is-disabled');
      $('#user_use_profile_pic').val('false');
    }
  });
  $('#save-user').on('click', function() {
    $(this).closest('form').submit();
  });
});