var basicActionsHandler = (function (){

  var basicActionsHandler = {};

  var basicButtonNew = "#form_for_new_button";
  var basicButtonCreate = "#form_for_create_button";
  var basicButtonEdit = "#form_for_edit_button";
  var basicButtonUpdate = "#form_for_update_button";
  var basicButtonCancel = "#form_for_cancel_button";
  
  var siteRenderHtml = "#site_render_html";

  var basicDivHtmlRender = "#form_for_html_render";

  var basicButtonClicked = undefined;
  var basicForm = undefined;

  $(document).ready(function  () {
    basicShowAction();
    basicNewAction();
  });

  var basicShowAction = function  () {
    $(siteRenderHtml).on("click", "table.main-table.aligncenter tr", function  () {
      var showLink = $(this).children("td:first").find("a.hidden");
      window.location = showLink.prop("href");
    });
  }

  var basicNewAction = function  () {
    $(basicButtonNew).on("click", function  (event) {
      event.preventDefault();
      setBasicButtonClicked(this);
      ajaxRequest("GET", basicButtonClicked.attr("href"), undefined, insertHtml)
      togleBasicButtonClicked();
    });
    return false;
  }
  
  var basicCreateAction = function  () {
    $(basicButtonCreate).on("click", function  (event) {
      event.preventDefault();
      setBasicForm(this.form);
      if (isBasicFormValid()) {
        ajaxRequest("POST", basicForm.prop("action"), basicForm.serializeArray(), basicActionCallback)
      };
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
    $(basicDivHtmlRender).html(jsonResponse.html).removeClass("hidden").triggerHandler("change");
    setSelectsSkin();
    basicActionCancel();
    basicCreateAction();
    return false;
  }
  
  var basicActionCallback = function  (jsonResponse) {
    if (jsonResponse.status === "success") {
    } else{
    };
  };

  var setBasicButtonClicked = function  (buttonClicked) {
    basicButtonClicked = $(buttonClicked);
    return false;
  }
  
  var setBasicForm = function  (actionForm) {
    basicForm = $(actionForm);
    return false;
  }
  
  var isBasicFormValid = function  () {
    return basicForm.valid();
  }

  var togleBasicButtonClicked = function  () {
    basicButtonClicked.slideToggle();
  }

  var setSelectsSkin = function  () {
    $(basicDivHtmlRender).find("select.skin-select").msDropDown();
  }

  return basicActionsHandler;
})();
