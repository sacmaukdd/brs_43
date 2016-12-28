class Admin::RequestsController < ApplicationController
  before_action :load_request, only: :destroy

  def index
    @categories = Category.all
    @request = Request.order_date_desc.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def destroy
    if @request.destroy
      flash[:cuccess] = t "delete_complete"
    else
      flash[:danger] = t "not_delete"
    end
      redirect_to request.referrer
  end

  private
  def load_request
    @request = Request.find_by id: params[:id]
    unless @request
      flash[:danger] = t "request_not_found"
      redirect_to request.referrer
    end
  end
end
