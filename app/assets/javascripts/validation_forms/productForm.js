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
        "product[articles_attributes][0][size]":{ maxlength: 3 },
        "product[articles_attributes][0][in_stock]":{ maxlength: 4, range: [1, 100] },
        "product[articles_attributes][0][code]":{ maxlength: 30 }
      },
     
      errorClass: "show error-info",
      errorElement: "a"
    });
  }

  return productForm;
})();