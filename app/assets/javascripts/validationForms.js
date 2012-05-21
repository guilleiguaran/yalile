var validationForm = (function  () {
  var validationForm = {};

  var formForRender = "#form_for_html_render";
  var productForm = "#product_form";

  $(document).ready(function  () {
    $(formForRender).on("change", formValidationFunctions);
  });

  var formValidationFunctions = function  () {
    productFormValidations();
  };

  var productFormValidations = function  () {
    $(productForm).validate({
      rules:{
        "product[name]":{ required: true },
        "product[articles_attributes][0][size]":{ required: true, maxlength: 3, customalphanumeric: true },
        "product[articles_attributes][0][in_stock]":{ required: true, maxlength: 4, digits: true, range: [1, 100] },
        "product[articles_attributes][0][code]":{ required: true, maxlength: 30, customalphanumeric: true }
      }
    });
  };

  return validationForm;
})();
