class Admin::OrdersController < ApplicationController
  before_action :check_admin

  def all
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def cancelled
    Order.find(params[:id]).update_status(0)

    redirect_to admin_all_orders_path
  end

  private
    def check_admin
      redirect_to "/" if !session[:profile_id] || !Profile.find(session[:profile_id]).admin?
    end
end
