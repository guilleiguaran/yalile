class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :convert_date_filter_into_locale_datetime

  def parse_search_parameters(params={})
    if !params.nil?
      params.each do |key, value|
        case key
        when /created_at_gteq/
          params[key] = datetime_converter(value)
        when /created_at_lteq/
          params[key] = datetime_converter(value, :end)
        end
      end
    end
  end

  private

  def convert_date_filter_into_locale_datetime
    parse_search_parameters(params[:q]) if params[:q]
  end

  def datetime_converter(date_string, period = :start)
    if !date_string.blank?
      case period
      when :start
        return date_string.concat(" 00:00:00 R").to_datetime
      when :end
        return date_string.concat(" 23:59:59 R").to_datetime
      end
    end
    ""
  end

end
