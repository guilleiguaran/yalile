var basicActionsHandler = (function (){

  var basicActionsHandler = {};

  var basicButtonNew = "#form_for_new_button";
  var basicButtonCreate = "#form_for_create_button";
  var basicButtonEdit = "#form_for_edit_button";
  var basicButtonUpdate = "#form_for_update_button";
  var basicButtonCancel = "#form_for_cancel_button";

  var basicDivHtmlRender = "#form_for_html_render";

  var basicButtonClicked = undefined;

  $(document).ready(function  () {
    basicNewAction();
  });

  var basicNewAction = function  () {
    $(basicButtonNew).on("click", function  (event) {
      event.preventDefault();
      setBasicButtonClicked(this);
      ajaxRequest("GET", basicButtonClicked.attr("href"), undefined, insertHtml)
      togleBasicButtonClicked();
    });
    return false;
  }

  var basicActionCancel = function  () {
    $(basicButtonCancel).on("click", function  (event) {
      event.preventDefault();
      $(basicDivHtmlRender).html("").addClass("hidden");
      togleBasicButtonClicked();
    });
    return false;
  };

  var ajaxRequest = function  (ajaxMethod, ajaxUrl, ajaxParams, ajaxCallback) {
    $.ajax({
      type: ajaxMethod,
      url: ajaxUrl,
      data: ajaxParams,
      success: ajaxCallback,
      error: function  (error) {
        console.log(error);
      }
    });
  };

  var insertHtml = function  (jsonResponse) {
    $(basicDivHtmlRender).html(jsonResponse.html).removeClass("hidden");
    setSelectsSkin();
    basicActionCancel();
    return false;
  }

  var setBasicButtonClicked = function  (buttonClicked) {
    basicButtonClicked = $(buttonClicked);
    return false;
  }

  var togleBasicButtonClicked = function  () {
    basicButtonClicked.slideToggle();
  }

  var setSelectsSkin = function  () {
    $(basicDivHtmlRender).find("select.skin-select").msDropDown();
  }

  return basicActionsHandler;
})();
