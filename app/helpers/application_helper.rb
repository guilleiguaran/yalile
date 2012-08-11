module ApplicationHelper

  def formatted_time(date_object, format="%B %d, %Y %H:%M")
    l date_object.in_time_zone("Bogota"), format: format
  end

  def page_entries_info(collection, options = {})
    entry_name = options[:entry_name] || (collection.empty?? 'entry' : collection.first.class.name.underscore.sub('_', ' '))
    if collection.num_pages < 2
      case collection.total_count
      when 0; "Sin #{entry_name.pluralize} encontrados."
      when 1; "<strong>1</strong> #{entry_name.singularize} de <strong>#{collection.total_count}</strong>".html_safe
      else;   "<strong>#{collection.total_count} #{entry_name.pluralize} de #{collection.total_count}</strong>".html_safe
      end
    else
      offset = (collection.current_page - 1) * collection.limit_value
      (%{#{entry_name.pluralize} <strong>%d&nbsp;-&nbsp;%d</strong> de <strong>%d</strong>} % [
        offset + 1,
        offset + collection.count,
        collection.total_count
      ]).html_safe
    end
  end

  def article_label(article)
    article.product.name.humanize + " Cod. " + article.code + " Ta. " + article.size
  end

  def summary_for_articles
    Article.order{created_at.desc}.collect{|article| [article_label(article), article.id]}
  end

end
