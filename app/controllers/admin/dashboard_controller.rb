class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["AUTHENTICATION_NAME"], password: ENV["AUTHENTICATION_PASSWORD"]
  
  def show
    @products = Product.all.order(created_at: :desc)
    @categories = Category.all
  end
end
