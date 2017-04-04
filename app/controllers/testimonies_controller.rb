class TestimoniesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_verified
  
  def index
    @testimonies = Testimonies.all.order('created_at DESC')
  end

  def show
  end

  def new
  end

  def edit
  end
end
