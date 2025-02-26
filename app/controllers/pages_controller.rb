class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
  end

  def contact
  end

  def plants
  end

  def terms_and_conditions
  end

  def dashboard
    @user = current_user
  end
end
