class InformationsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :instance_resource

  def index
    render json: @resource.all
  end

  def show
    render json: @resource.find_by_id(params[:id]) if @resource
  end

  private

  def instance_resource
    @resource = params[:resource].singularize.capitalize.safe_constantize
  end

end
