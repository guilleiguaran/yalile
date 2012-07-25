var summaryArticle = (function  () {
  var summaryArticle = {};

  var summaryArticleSelect = "#summary_product";

  $(document).ready(function  () {
    $(summaryArticleSelect).on("change", function  () {
      console.log($(this).val());
    });
  });

  var ajaxRequest = function  () {
  }

  return summaryArticle;
})();
