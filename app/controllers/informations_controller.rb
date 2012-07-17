class InformationsController < ApplicationController

  def show
    resource = params[:resource].singularize.capitalize.safe_constantize
    if resource
      render json: resource.find_by_id(params[:id])
    end
  end

end
