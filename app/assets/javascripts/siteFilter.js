var siteFilters = (function  () {
  var siteFilters = {};
  
  var siteRenderHtml = "#site_render_html";
  var siteFilterForm = "#site_filter_form";
  var siteFilterButton = "#site_filter_button";
  var inputSearchContainer = "#input_search_container";
  var inputSearchTextField = "#input_search_text_field";
  var datePickers = "input:text.datepicker"
  
  $(document).ready(function  () {
    preventDefaultOfFilterForm();
    preventDefaultOfPaginationLinks();
    inputSearchSelectedOptionEffect();
    datePickerRestoreDate();
  });
  
  var preventDefaultOfFilterForm = function  () {
    $(siteFilterButton).on("click", function  (event) {
      event.preventDefault();
    });
    return false;
  }
  
  var preventDefaultOfPaginationLinks = function  () {
    $(siteRenderHtml).on("click", "div.navigation ul li a", function  (event) {
      event.preventDefault();
      constructPaginationParamsForRequest($(this));
    });
    return false;
  }
  
  var constructPaginationParamsForRequest = function  (clickedLink) {
    var splitParams = clickedLink.prop("href").split("?");
    var targetUrl = splitParams[0];
    var queryString = splitParams[1];
    ajaxRequest(targetUrl, "GET", queryString, htmlRenderization)
    return false;
  }
  
  var inputSearchSelectedOptionEffect = function  () {
    var textPlaceHolder = $(inputSearchTextField).prop("placeholder");
    $(inputSearchContainer).on("click", "input[type=radio]", function  () {
      $(inputSearchTextField).prop("placeholder", textPlaceHolder.replace("...","") + $(this).val().toLowerCase() + "...");
    });
    return false;
  }
  
  var ajaxRequest = function  (ajaxUrl, ajaxType, ajaxParams, ajaxCallback) {
    $.ajax({
      url: ajaxUrl,
      type: ajaxType,
      data: ajaxParams,
      success: ajaxCallback,
      error: function  (jqXHR, textStatus, errorThrown) {
        console.log(jqXHR, textStatus, errorThrown);
      }
    });
  }
  
  var htmlRenderization = function  (jsonResponse) {
    $(siteRenderHtml).html(jsonResponse.html);
  }

  var datePickerRestoreDate = function  () {
    $(datePickers).each(function  (index, datePicker) {
      var currentDatePicker = $(datePicker);
      var currentDate = new Date(currentDatePicker.val());
      //currentDatePicker.datepicker("setDate", $.datepicker.formatDate("dd/mm/yy", currentDate));
    });
    return false;
  }
  
  return siteFilters;
})();