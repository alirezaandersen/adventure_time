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
//= require bootstrap
//= require bootstrap-sprockets
//= require turbolinks
//= require parks
//= require underscore

$(document).ready(function(){
//var parks = document.querySelectorAll('.card-text');
var zipcodes = _.uniq($('.card-text').map(function(){ return $(this).attr('data-zip') }))
for (var i = 0; i < zipcodes.length; i++) {
  //var zipcode = val.dataset['zip'];
  var target_url = '/json/weather';
  $.ajax({
    url: target_url,
    data: {
      zip: zipcodes[i]
    },
    type: 'GET',
    dataType: 'json'
  }).done(function (json) {
    //console.log(json['temp']);
    var sel = "[data-zip=" + json['zip'] + "]";
    $(sel).html(json['temp']);
  }).fail(function (xhr, status, errorThrown) {
    alert('Sorry, there was a problem!');
    console.log('Error: ' + errorThrown);
    console.log('Status: ' + status);
    console.dir(xhr);
  });
}
})
