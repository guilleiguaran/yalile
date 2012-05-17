var globalJavascriptFile = (function  () {

  var globalJavascriptFile = {};

  $(document).ready(function  () {

    jQueryValidationsDefaults();

    $(".skin-select").msDropDown();

    $(".datepicker-call").datepicker({
      changeMonth: true,
      changeYear: true
    });

    /*Multiselect*/
    $(".multiselect-call").multiselect({
      selectedList: 4
    });


    /*min Height sidebar*/

    $(window).resize(function(){
      $('.content-main').css("min-height",$(window).height()-$('#header').height()-69);
      $('.content-right').css("width",$(window).width()-$('.sidebar').width());
    })

    $('.content-main').css("min-height",$(window).height()-$('#header').height()-69);

    $('.content-right').css("width",$(window).width()-$('.sidebar').width());

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

    /*Overlay sidebar*/
    $('.nav-bar .config').click(function(event){
      event.stopPropagation();
      $('.overlay-sidebar').css("z-index", "3");
    });

  });

  var jQueryValidationsDefaults = function  () {
    $.validator.setDefaults({
      highlight: function (element, errorClass) {
        var inputTextElement = $(element);
        inputTextElement.parent("fieldset").addClass("show-error");
        inputTextElement.addClass("error-message");
        inputTextElement.next("a.error-info").remove();
      },
      unhighlight: function (element, errorClass) {
        var inputTextElement = $(element);
        inputTextElement.parent("fieldset").removeClass("show-error");
        inputTextElement.removeClass("error-message");
        inputTextElement.next("a.error-info").text("");
      },
      errorPlacement: function (error, element) {
        error.attr({title: error.text()});
        error.html("");
        element.after(error);
        jQueryErrorsTooltip();
      },
      errorClass: "error-info",
      errorElement: "a"
    });
  };

  var jQueryErrorsTooltip = function  () {
    $('.error-info').tipsy({
    gravity: $.fn.tipsy.autoNS,
    html: true,
    delayIn: 500,
    delayOut: 500
    });
  };

  return globalJavascriptFile;
})();
