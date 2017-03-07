class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_verified
  def index
  end
  
  
end
