class ApplicationController < ActionController::Base
  protect_from_forgery

  def parse_search_parameters(params={})
    if !params.nil?
      params.each do |key, value|
        case key
        when /initial_date/
          params[key] = datetime_converter(value + " 00:00:00 R")
        when /final_date/
          params[key] = datetime_converter(value + " 23:59:59 R")
        end
      end
    end
  end

  private

  def datetime_converter(date_string)
    date_string.to_datetime
  end

end
