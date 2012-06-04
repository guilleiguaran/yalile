var validationForm = (function  () {
  var validationForm = {};

  var formForRender = "#form_for_html_render";
  var productForm = "#product_form";
  var articleForm = "#article_form";

  $(document).ready(function  () {
    $(formForRender).on("change", formValidationFunctions);
  });

  var formValidationFunctions = function  () {
    productFormValidations();
    articleFormValidations();
  };

  var productFormValidations = function  () {
    $(productForm).validate({
      rules:{
        "product[name]":{ required: "#product_code:blank"},
        "product[articles_attributes][0][size]": { required: true, maxlength: 3, customalphanumeric: true },
        "product[articles_attributes][0][in_stock]": { required: true, maxlength: 4, digits: true, range: [1, 100] },
        "product[articles_attributes][0][code]": { required: true, maxlength: 30, customalphanumeric: true }
      }
    });
  };
  
  var articleFormValidations = function  () {
    $(articleForm).validate({
      rules:{
        "article[size]": { required: true, maxlength: 3, customalphanumeric: true },
        "article[in_stock]": { required: true, maxlength: 4, digits: true, range: [1, 100] },
        "article[code]": { required: true, maxlength: 30, customalphanumeric: true }
      }
    });
  }

  return validationForm;
})();
