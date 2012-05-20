var additionalValidations = (function  () {
  
  var additionalValidations = {};
  
  $.validator.addMethod("customalphanumeric", function(value, element) { 
    return this.optional(element) || /^[a-z0-9]*$/i.test(value); 
  }, "Only letters and numbers are allowed.");
  
  $(document).ready(function  () {
  });
  
  return additionalValidations;
})();