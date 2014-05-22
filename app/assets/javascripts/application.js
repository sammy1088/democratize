// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap.min
//= require turbolinks
//= require_tree .
$(document).ready(function() {
$(".reply-link").click(function(e){
  e.preventDefault();
  $(this).siblings('.reply-container').toggle();
});
  
    $('[data-toggle=offcanvas]').click(function() {
    $('.row-offcanvas').toggleClass('active');
  });
$('.sdf').on('click', function(){
  $(this).html('<b>Supported!</b>');
  $(this).next().html('<em>+1</em>');
})

$('.sfd').on('click', function(){
  $(this).html('<b>Opposed!</b>');
  $(this).next().html('<em>-1</em>');
})

$('.btrigger').on('click', function(){
  $(this).html('<div class="glyphup"><span class="glyphicon glyphicon-chevron-up"></span></div>');
  $(this).parent().next().html('<em>+1</em>');
})

$('.trigger').on('click', function(){
  $(this).html('<div class="glyphup"><span class="glyphicon glyphicon-chevron-up"></span></div>');
  $(this).parent().next().html('<em>+1</em>');
})

$('.ctrigger').on('click', function(){
  $(this).html('<div class="ctriggerJ"><span class="glyphicon glyphicon-chevron-up"></i></div>');
})
 
$('.ctrigger-').on('click', function(){
  $(this).html('<div class="ctriggerJx"><span class="glyphicon glyphicon-chevron-down"></i></div>');
})

$('.trigger-').on('click', function(){
  $(this).html('<div class="glyphdown"><span class="glyphicon glyphicon-chevron-down"></span></div>');
  $(this).parents('.votes').find("#votesS").html('<em>-1</em>');
})

$('.actions').click(function(){
  $(this).html('<b>comment submited!</b>');
  $(this).submit();
})
  
 }); 
$(document).ready(ready);
$(document).on('page:load', ready);
