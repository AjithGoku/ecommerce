class HomeController < ApplicationController
  before_action :check_signed_in
  # This method used to check whether or not the User is signed in and navigate accordingly
  def check_signed_in
    redirect_to products_path if signed_in?
  end

  def index
  end
end
