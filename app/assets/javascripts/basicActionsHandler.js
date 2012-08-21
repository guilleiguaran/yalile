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
    basicEditAction();
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
      ajaxRequest("GET", basicButtonClicked.attr("href"), undefined, insertHtml, false);
      togleBasicButtonClicked();
      basicCreateAction();
    });
    return false;
  }

  var basicEditAction = function  () {
    $(basicButtonEdit).on("click", function  (event) {
      event.preventDefault();
      setBasicButtonClicked(this);
      ajaxRequest("GET", basicButtonClicked.attr("href"), undefined, insertHtml, false);
      togleBasicButtonClicked();
      basicUpdateAction();
    });
    return false;
  }

  var insertHtml = function  (jsonResponse) {
    $(basicDivHtmlRender).html(jsonResponse.html).removeClass("hidden").triggerHandler("change");
    setSelectsSkin();
    basicActionCancel();
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
  
  var basicCreateAction = function  () {
    $(basicButtonCreate).on("click", function  (event) {
      event.preventDefault();
      setBasicForm(this.form);
      if (isBasicFormValid()) {
        ajaxRequest("POST", basicForm.prop("action"), basicForm.serializeArray(), basicActionCallback, true);
      };
    });
    return false;
  }

  var basicUpdateAction = function  () {
    $(basicButtonUpdate).on("click", function  (event) {
      event.preventDefault();
      setBasicForm(this.form);
      if (isBasicFormValid()) {
        ajaxRequest("PUT", basicForm.prop("action"), basicForm.serializeArray(), basicActionCallback, true);
      };
    });
    return false;
  }

  var ajaxRequest = function  (ajaxMethod, ajaxUrl, ajaxParams, ajaxCallback, isAsync) {
    $.ajax({
      type: ajaxMethod,
      dataType: "json",
      url: ajaxUrl,
      data: ajaxParams,
      async: isAsync,
      success: ajaxCallback,
      error: function  (error) {
        console.log(error);
      }
    });
  };
  
  var basicActionCallback = function  (jsonResponse) {
    if (jsonResponse.status === "success") {
      console.log(jsonResponse);
      window.location.reload();
    } else{
      alert(jsonResponse.errors);
      console.log(jsonResponse.errors);
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
    return false;
  }

  var setSelectsSkin = function  () {
    $(basicDivHtmlRender).find("select.skin-select").msDropDown();
    return false;
  }

  return basicActionsHandler;
})();
