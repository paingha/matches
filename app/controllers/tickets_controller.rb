class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_verified
  before_action :find_ticket, only: [:show, :edit, :update, :destroy]
  def index
    @ticket = Ticket.all.order('created_at DESC')
  end
  
  def create
    @ticket = Ticket.new(tickets_params)

		if @ticket.save
			redirect_to @ticket, notice: 'Ticket created'
		else
			render "New"
		end
  end
  
  def new
    @ticket = Ticket.new
  end
  
  
  def tickets_params
		params.require(:ticket).permit(:title, :message, :ticket_by)
	end


	def find_ticket
		@ticket = Ticket.find(params[:id])
	end
  
end
