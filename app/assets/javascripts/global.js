$(function(){

  $(".skin-select").msDropDown();

  $( ".datepicker-call" ).datepicker({
    changeMonth: true,
    changeYear: true
  });

  /*Multiselect*/
  $(".multiselect-call").multiselect({
    selectedList: 4 // 0-based index
  });

  /*Tooltips*/
  $('.error-info').tipsy({
    gravity: $.fn.tipsy.autoNS,
    html: true,
    delayIn: 500,
    delayOut: 500
  });

  /*min Height sidebar*/
  $('.content-main').css("min-height",$(window).height()-$('#header').height()-69);

  $(window).resize(function(){
    $('.content-main').css("min-height",$(window).height()-$('#header').height()-69);
  })

  $('.content-right').css("width",$(window).width()-$('.sidebar').width());

  $(window).resize(function(){
    $('.content-right').css("width",$(window).width()-$('.sidebar').width());
  })

  /*Dropdown*/

  $('.config > a').on("click", function(e){
    $(this).parents(".main").find(".show").removeClass("show")
    $(this).parent().toggleClass("show");
    e.preventDefault();
  });

  $('.config-box').mouseup(function(){
    return false
  });

  $(document).mouseup(function(e){
    if($(e.target).parent(".config").length==0){
      $(".config").removeClass("show")
      $('.overlay-sidebar').css("z-index", "2");
    }
  });

  /*Add New App*/
  $(".box-app").addClass("hidden");

  $('.add-app').click(function(event){
    event.stopPropagation();
    $(".box-app").addClass("open");
    $(".add-app").addClass("hidden");
  });

  $('.cancel-app').click(function(event){
    event.stopPropagation();
    $(".add-app").removeClass("hidden");
    $(".box-app").addClass("hidden");
    $(".box-app").removeClass("open");
    $(".add-app").addClass("open");
    $(".add-app").removeClass("open");
  });

  /*Edit App*/
  $('.btn-edit').click(function(event){
    event.stopPropagation();
    $(this).addClass("hidden");
    $("fieldset .show, fieldset.show-f, ul li fieldset.show-f span").removeClass("hidden");
    $("ul li fieldset span.show, .no-show").addClass("hidden");
    $(".list-cancel").removeClass("hidden");
    $(".skin-select").msDropDown();
    $("input.url").removeAttr('disabled', 'disabled')
  });

  $('li .cancel-app.edit').click(function(event){
    event.stopPropagation();
    $(".btn-edit").removeClass("hidden");
    $(".no-show").removeClass("hidden");
    $('ul.list-cancel').addClass("hidden");
    $("fieldset .show, fieldset.show-f").addClass("hidden");
    $("ul li fieldset span.show").removeClass("hidden");
    $(".skin-select").msDropDown();
    $("input.url").attr('disabled', 'disabled')
  });

  /*Overlay sidebar*/
  $('.nav-bar .config').click(function(event){
    event.stopPropagation();
    $('.overlay-sidebar').css("z-index", "3");
  });

});
