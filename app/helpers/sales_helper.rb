module SalesHelper

  def link_to_add_sale(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, 'javascript:void(0);', class: "add-article cancel-app", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def article_label(article)
    article.product.name.humanize + " Cod. " + article.code + " Ta. " + article.size
  end

  def articles_list(saletransactions, sale=nil)
    list_html = ""
    saletransactions.each_with_index do |saletransaction, index|
      list_html.concat(content_tag(:div, class: details_articles_sale(saletransactions, index)) do
        concat(content_tag(:ul, class: "texter-list") do
          concat(content_tag :li, saletransaction.quantity_articles.to_s + " " + article_label(saletransaction.article_associated))
          concat(content_tag :li, link_to("Devolver", [sale, saletransaction], class: :remove, method: :delete)) if saletransaction.status.eql?(0)
        end)
      end)
    end
    list_html.html_safe
  end

  def details_articles_sale(saletransactions, index)
    div_class = "box-default "
    case index
    when 0
      div_class.concat("head-table")
    when saletransactions.size - 1
      div_class.concat("box-bottom")
    else
      div_class.concat("box-center")
    end
  end

end
