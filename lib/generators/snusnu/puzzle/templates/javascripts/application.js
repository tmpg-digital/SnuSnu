// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks

function delayedRedirect(){window.location = "http://tmpg.com"}

function shareTweet() {
  var page_url = "http://wakeupyourmouthsweeps.com";
  var twitterUrl = 'http://twitter.com/share?url=';
  var twitterText =
    'I just entered the Ricola Wake Up Your Mouth Sweepstakes!';
  var twitterTag = 'Ricola,WakeUpYourMouth';
  window.open(twitterUrl + page_url + '&text=' + twitterText +
    '&hashtags=' + twitterTag, 'twitter-share-dialog',
    'width=626,height=436');
  sendEventToGA('user_shared_on_twitter');
  return false;
}

function postToFeed() {
  var urlImage =	''
  FB.ui({
    method:       'feed',
    name: 				'Ricola Wake Up Your Mouth Sweepstakes',
    link:         'http://wakeupyourmouthsweeps.com',
    picture:      urlImage,
    description:  'I just entered the Ricola Wake Up Your Mouth Sweepstakes! http://wakeupyourmouthsweeps.com #Ricola #WakeUpYourMouth',
    caption:      "Ricola Wake Up Your Mouth Sweepstakes",
  });

  sendEventToGA('user_shared_on_facebook');
  return false;
}

$(function() {

  $.getScript('http://connect.facebook.net/en_US/sdk.js', function(){
    FB.init({
      appId:    '332546096869514',
      xfbml: 		true,
      version:  'v2.5'
    });
  });


    $("#rules_main").hide;

    $('.close_button').click( function(event) {
      event.stopPropagation();
      $("#footer_menu").removeClass('opened').addClass('closed');
      $("#menu_1").removeClass('selected').removeClass('unselected').addClass('default');
      $("#menu_2").removeClass('selected').removeClass('unselected').addClass('default');
      $("#rules_main").addClass('hide');
    });

    $('#menu_1').click(function() {
      $("#footer_menu").removeClass('closed').addClass('opened');
      $('#rules_main').removeClass('option_2').removeClass('hide').addClass('option_1');
      $('#menu_1').removeClass('unselected').removeClass('default').addClass('selected');
      $('#menu_2').removeClass('selected').removeClass('default').addClass('unselected');
      $("#rules_main").show;
    });

    $('#menu_2').click(function() {
      $("#footer_menu").removeClass('closed').addClass('opened');
      $('#rules_main').removeClass('option_1').removeClass('hide').addClass('option_2');
      $('#menu_1').removeClass('selected').addClass('unselected');
      $('#menu_2').removeClass('unselected').addClass('selected');
      $("#rules_main").show;
    });

    $('#social_button').click(function() {
      $("#social_button").toggleClass('active');
      $("#social_menu").toggleClass('unhide');
    });


    $('#social_menu').mouseleave(function() {
      $("#social_button").removeClass('active');
      $("#social_menu").removeClass('unhide');
    });


    $('#enter_button').click(function() {
      $("#register_container").removeClass('hide').addClass('open');
      $("#form_container").removeClass('hide')
    });
    $('#register_close_button').click(function() {
      $("#register_container").removeClass('open').addClass('hide');
      $("#form_container").addClass('hide')
    });

    $('#opt_in_container, #user_opt_in').click(function() {
      if ($('#user_opt_in').is(':checked'))
          $('#user_opt_in').prop('checked', false);
      else
          $('#user_opt_in').prop('checked', true);
      });

      $('#share_facebook').click(function() {
        postToFeed();
      });
      $('#share_twitter').click(function() {
        shareTweet();
      });


});
