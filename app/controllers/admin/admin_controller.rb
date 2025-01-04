class Admin::AdminController < ApplicationController
  def dashboard
    render 'admin/dashboard'
  end

  before_action :authenticate_user!
end
