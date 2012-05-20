var inputMasks = (function  () {
  var inputMasks = {};
  
  var formForRender = "#form_for_html_render";

  $(document).ready(function  () {
    $(formForRender).on("change", loadMasks);
  });
  
  var loadMasks = function  () {
    numericInputs();
    alphanumericInputs();
  }
  
  var numericInputs = function  () {
    $("input[type='text'].mnumeric").each(function  () {
      var textInput = $(this);
      textInput.inputmask({"mask": "9", "repeat": textInput.prop("maxlength"), "greedy": false });
    });
  }
  
  var alphanumericInputs = function  () {
    $("input[type='text'].malphanumeric").each(function  () {
      var textInput = $(this);
      textInput.inputmask({"mask": "*", "repeat": textInput.prop("maxlength"), "greedy": false});
    })
  }

  return inputMasks;
})();