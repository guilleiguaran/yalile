var summaryArticle = (function  () {
  var summaryArticle = {};

  var summaryArticleSelect = "#summary_product";

  $(document).ready(function  () {
    summaryArticleSelection();
  });

  var summaryArticleSelection = function  () {
    $(summaryArticleSelect).on("change", function  () {
      var summaryUrl = "/sale-transactions";
      var summaryData = {"summary": {"status": 0, "article_id": $(this).val()}};
      //ajaxRequest(summaryUrl, data, articleSummary);
    });
  }

  var ajaxRequest = function  (ajaxUrl, ajaxData, ajaxCallback) {
    $.ajax({
      url: ajaxUrl,
      success: ajaxCallback,
      data: ajaxData,
      error: function  (jqXHR, textStatus, errorThrown) {
        console.log(jqXHR, textStatus, errorThrown);
      }
    });
  }

  var articleSummary = function  (jsonResponse) {
    $.each(jsonResponse, function  (index, element) {
    });
  }

  return summaryArticle;
})();
