// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$(function(){

  $("#left_nav-MoreTxtBtn").click(function(){
      $("li.left_nav_item:nth-child(n+11)").css("display","block");
      $("li.left_nav_item:last-child").css("display","none");
      return false;
  });

  $(".rootBtn").click(function(){
      window.location.href = "/";
  });

  $('.alert').ready(function(){
    setTimeout(function(){
      $('.alert').hide(1000);
    },5000);
  });

  $("#topicModal").click(function(){
    $(this).addClass("modalWindow");
    $(".topcic-content-box").addClass("editModal");
    $("#topic_content").css("font-size",22);
    $('div.modal-bg').addClass("modalBg").click(function(){
      $(this).removeClass("modalBg");
      $("#topicModal").removeClass("modalWindow");
      $("div.topcic-content-box").removeClass("editModal");
      $("#topic_content ").css("font-size",14);
    });
  });

  $("#gnav-toggle-btn").click(function(){
    $('#gnav-toggle').toggleClass('toggle');
  });

});
