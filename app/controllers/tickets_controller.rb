class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_verified
  def index
    @tickets = current_user.tickets.all.order('created_at DESC')
  end
end
