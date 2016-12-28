class RequestsController < ApplicationController
  before_action :load_request, only: :destroy
  before_action :verify_admin, only: :create

  def create
    @request = current_user.requests.build request_params
    if @request.save
      send_email @request
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = t "not_create"
      redirect_to request.referrer
    end
  end

  def destroy
    if @request.destroy
      flash[:success] = t "delete_complete"
    else
      flash[:danger] = t "not_delete"
    end
    redirect_to request.referrer
  end

  private
  def request_params
    params.require(:request).permit :book_id
  end

  def load_request
    @request = Request.find_by id: params[:id]
    unless @request
      flash[:danger] = t "request_not_found"
      redirect_to request.referrer
    end
  end

  def verify_admin
    @admin = User.find_by is_admin: true
    unless @admin
      flash[:danger] = t "admin_not_found"
    end
  end

  def send_email request
    @user = User.find_by id: request.user_id
    unless @user
      flash[:danger] = t "user_not_found"
    end
    BuyBookMailer.mail_to_user(@user).deliver
    BuyBookMailer.mail_to_admin(@admin).deliver
  end
end
