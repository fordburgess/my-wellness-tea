class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
  end

  def contact
  end

  def terms_and_conditions
  end

  def privacy_policy
  end

  def our_brand
  end

  def dashboard
    @user = current_user
  end
end
