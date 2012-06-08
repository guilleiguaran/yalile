class SalesControl
  
  class << self
    attr_reader :sale, :sale_transactions

    def complete_sale(sale)
      @sale = sale
      @sale_transactions = sale.sale_transactions
      article_attributes
      return sale
    end

    private

    def article_attributes
      sale_transactions.each do |sale_transaction|
        article = Article.find_by_id(sale_transaction.article_id)
        sale_transaction.article_unit_price_sold = article.price
        sale_transaction.article_total_price = sale_transaction.quantity_articles * article.price
      end
    end
  end
end