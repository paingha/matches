class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_verified
  def index
  end
  
  def tickets
    @tickets = Ticket.all.where('user_id = current_user.id')
  end
end
