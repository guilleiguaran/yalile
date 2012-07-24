class SalesControl

  class << self
    attr_reader :sale, :sale_transactions

    def complete_sale(sale)
      @sale = sale
      @sale_transactions = sale.sale_transactions
      article_attributes
      return sale
    end

    def reduce_article_stock(sale)
      sale.sale_transactions.each do |sale_transaction|
        sale_transaction.article_stock(:sell)
      end
    end

    def return_transaction(sale_id, transaction_id)
      sale = Sale.find(sale_id)
      if sale
        transaction = sale.sale_transactions.find(transaction_id)
        if transaction
          case transaction.status
          when 0
            transaction.update_attributes(status: 1)
            transaction.article_stock(:return)
            return true
          end
        end
      end
      return false
    end

    private

    def article_attributes
      sale_transactions.each do |sale_transaction|
        article = Article.find_by_id(sale_transaction.article_id)
        sale_transaction.status = 0
        sale_transaction.article_unit_price_sold = article.price
        sale_transaction.article_total_price = sale_transaction.quantity_articles * article.price
      end
    end
  end
end
