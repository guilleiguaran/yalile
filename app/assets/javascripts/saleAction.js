var saleAction = (function  () {
  var saleAction = {};
  
  var salesContainer = "div.four-fieldset.clearfix:last";
  var salesForm = "#sale_form";
  
  $(document).ready(function  () {
    saleFormValidations();
    addNewArticleToSale();
  });
  
  var addNewArticleToSale = function  () {
    $(".cancel-app").on("click", function  (event) {
      time = new Date().getTime();
      regexp = new RegExp($(this).data('id'), 'g');
      $(salesContainer).after($(this).data('fields').replace(regexp, time));
      globalJavascriptFile.skiningSelects();
      event.preventDefault();
    });
  }
  
  var saleFormValidations = function  () {
    $(salesForm).validate({
      submitHandler: function  (form) {
        form.submit();
      }
    });
  }
  
  return saleAction;
})();