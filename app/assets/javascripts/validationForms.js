var validationForm = (function  () {
  var validationForm = {};

  var formForRender = "#form_for_html_render";
  var productForm = "#product_form";
  var articleForm = "#article_form";
  var userForm = "#user_form";

  $(document).ready(function  () {
    $(formForRender).on("change", formValidationFunctions);
  });

  var formValidationFunctions = function  () {
    productFormValidations();
    articleFormValidations();
    userFormValidations();
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
        "article[code]": { required: true, maxlength: 30, customalphanumeric: true },
        "article[description]": { required: true }
      }
    });
  }

  var userFormValidations = function  () {
    $(userForm).validate({
      rules:{
        "user[fullname]": {required: true, letterswithbasicpunc: true},
        "user[email":{required: true, email: true},
        "user[username]": {required: true, alphanumeric: true},
        "user[password]": {required: true, minlength: 6}
      },
      messages:{
        "user[fullname]": {
          letterswithbasicpunc: "Sólo se permiten letras en el nombre."
        },
        "user[username]":{
          alphanumeric: "Sólo se permiten letras numeros y underscores(_)."
        }
      }
    });
  }

  return validationForm;
})();
