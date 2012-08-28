var summaryArticle = (function  () {
  var summaryArticle = {};

  var summaryArticleSelect = "#summary_product";
  var todaySummary = "#today_summary";
  var monthlySummary = "#monthly_summary";

  var summaryAmountToday = 0;
  var summaryAmountMonth = 0;

  $(document).ready(function  () {
    summaryArticleSelection();
  });

  var summaryArticleSelection = function  () {
    $(summaryArticleSelect).on("change", function  () {
      if (this.value !== "") {
        var summaryUrl = "/sale-transactions";
        var summaryData = {
          "summary": {
            "status": 0,
            "article_id": $(this).val(),
            "summary_date": (new Date).toUTCString()
          }
        };
        ajaxRequest(summaryUrl, summaryData, articleSummary);
      };
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
    summaryAmountToday = 0;
    summaryAmountMonth = 0;
    $.each(jsonResponse, function  (index, element) {
      todaysSummary(element);
      actualMonthlySummary(element);
    });
    $(todaySummary).html("$ " + formatCurrencyNumber(summaryAmountToday));
    $(monthlySummary).html("$ " + formatCurrencyNumber(summaryAmountMonth));
  }

  var todaysSummary = function  (element) {
    var dateSummary = new Date(element.created_at);
    var todaysDate = new Date();
    if (dateSummary.getDate() === todaysDate.getDate()) {
      summaryAmountToday += element.article_total_price;
    };
  }

  var actualMonthlySummary = function  (element) {    
    var dateSummary = new Date(element.created_at);
    var todaysDate = new Date();
    if (dateSummary.getMonth() === todaysDate.getMonth()) {
      summaryAmountMonth += element.article_total_price;
    };
  }

  var formatCurrencyNumber = function (nStr)
  {
    nStr = nStr.toFixed(2).toString();
    var tsep = ".";
    var csep = ",";
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? csep + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    nStr += "";
    while (rgx.test(x1)) {
      x1 = x1.replace(rgx, '$1' + tsep + '$2');
    }
    return (x1 + x2);
  }

  return summaryArticle;
})();
