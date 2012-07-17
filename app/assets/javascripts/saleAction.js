var saleAction = (function  () {
  var saleAction = {};

  var salesContainer = "div.four-fieldset.clearfix:last";
  var salesForm = "#sale_form";
  var salesAddArticle = ".add-article";

  var articleSelected = undefined;
  var initalArticles = undefined;

  $(document).ready(function  () {
    saleFormValidations();
    addNewArticleToSale();
    fillTotalPriceEvent();
    inputMasks.loadMasks();
    loadArticles();
    removeArticle();
  });

  var addNewArticleToSale = function  () {
    $(salesAddArticle).on("click", function  (event) {
      time = new Date().getTime();
      regexp = new RegExp($(this).data('id'), 'g');
      var newArticle = $(salesContainer).after($(this).data('fields').replace(regexp, time));
      globalJavascriptFile.skiningSelects();
      inputMasks.loadMasks();
      event.preventDefault();
    });
    return false;
  }

  var saleFormValidations = function  () {
    $(salesForm).validate({
      rules:{
        "input[type=text][name*=quantity_articles]":{
          required: true,
          number: true
        }
      },
      submitHandler: function  (form) {
        form.submit();
      }
    });
  }

  var articleBasicInfo = function  (currentSelect) {
    articleSelected = $(currentSelect);
    articleId = articleSelected.val();
    if (articleId !== "") {
      ajaxRequest("/article/" + articleId + "/information" , fillArticleUnitPrice);
    };
    return false;
  }

  var fillArticleUnitPrice = function  (jsonResponse) {
    var parentsInputText = articleSelected.parents("div.four-fieldset");
    var articleUnitPrice = parentsInputText.find("input[type=text][name*=article_unit_price_sold]");
    var articleQuantity = parentsInputText.find("input[type=text][name*=quantity_articles]")
    articleUnitPrice.val(jsonResponse.price);
    fillTotalPrice(articleQuantity);
    return false;
  }

  var fillTotalPriceEvent = function  () {
    $(salesForm).on("keyup", "input[type=text][name*=quantity_articles]", function  (event) {
      fillTotalPrice($(event.srcElement));
    });
    return false;
  }

  var fillTotalPrice = function  (quantityArticlesInputText) {
    var parentsInputText = quantityArticlesInputText.parents("div.four-fieldset");
    var unitPriceArticleInputText = parentsInputText.find("input[type=text][name*=article_unit_price_sold]")
    var totalPriceArticleInputText = parentsInputText.find("input[type=text][name*=article_total_price]");
    var quantityArticles = parseFloat(quantityArticlesInputText.val());
    var unitPriceArticle = parseFloat(unitPriceArticleInputText.val());
    totalPriceArticleInputText.val(quantityArticles * unitPriceArticle);
    return false;
  }

  var removeArticle = function  () {
    $(salesForm).on("click", "a.remove", function  (event) {
      event.preventDefault();
      if ($(salesForm).find("div.four-fieldset.clearfix").length > 1){
        $(this).parents("div.four-fieldset.clearfix").remove();
      }
    });
    return false;
  }

  var loadArticles = function  () {
    initialArticles = $(salesForm).find("select:first").children();
  }

  var ajaxRequest = function  (ajaxUrl, ajaxCallback) {
    $.ajax({
      url: ajaxUrl,
      success: ajaxCallback
    });
  }

  saleAction.articleBasicInfo = articleBasicInfo;
  return saleAction;
})();
