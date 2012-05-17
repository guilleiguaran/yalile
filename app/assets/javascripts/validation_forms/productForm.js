var productForm = (function  () {
  var productForm = {};

  $(document).ready(function  () {
    $("#form_for_html_render").on("change", function  () {
      validationRules();
    })
  });

  var validationRules = function  () {
    $("#product_form").validate({
      rules:{
        "product[name]":{ required: true },
        "product[articles_attributes][0][size]":{ required: true, maxlength: 3 },
        "product[articles_attributes][0][in_stock]":{ required: true, maxlength: 4, range: [1, 100] },
        "product[articles_attributes][0][code]":{ required: true, maxlength: 30 }
      },
      highlight: function(element) {
        var inputTextElement = $(element);
        $(element).parent("fieldset").addClass("show-error");
        $(element).addClass("show error-message");
      },
      unhighlight: function(element) {
        var inputTextElement = $(element);
        $(element).parent("fieldset").removeClass("show-error");
        $(element).removeClass("show error-message");
      },
      errorClass: "show error-info",
      errorElement: "a"
    });
  }

  return productForm;
})();