
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
