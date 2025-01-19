class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
  end

  def contact
  end

  def plants
  end

  def dashboard
    @user = current_user
  end
end
