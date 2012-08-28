class ApplicationController < ActionController::Base
  protect_from_forgery

  def parse_search_parameters(params={})
    if !params.nil?
      params.each do |key, value|
        case key
        when /initial_date/
          params[key] = datetime_converter(value)
        when /final_date/
          params[key] = datetime_converter(value, :end)
        end
      end
    end
  end

  private

  def datetime_converter(date_string, period = :start)
    case period
    when :start
      date_string.concat(" 00:00:00 R").to_datetime
    when :end
      date_string.concat(" 23:59:59 R").to_datetime
    end
  end

end
