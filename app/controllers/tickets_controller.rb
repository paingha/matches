class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_verified
  before_action :find_ticket, only: [:show, :edit, :update, :destroy]
  def index
    @tickets = current_user.tickets.all.order('created_at DESC')
  end
  
  def create
    @tickets = Tickets.new(announcements_params)

		if @tickets.save
			redirect_to @tickets, notice: 'Ticket created'
		else
			render "New"
		end
  end
  
  def new
    @tickets = Tickets.new
  end
  
end
