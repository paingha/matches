class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_verified
  before_action :find_ticket, only: [:show, :edit, :update, :destroy]
  
  def index
    @tickets = current_user.tickets.all.order('created_at DESC')
  end
  
  def create
    @ticket = Ticket.new(tickets_params)
    
    
		if @ticket.save
			redirect_to @ticket
		else
			render "New"
		end
  end
  
  def new
    @ticket = Ticket.new
  end
  
  def show
  end
  
  def edit
  end
  
  def update
		if @ticket.update(tickets_params)
			redirect_to @ticket
		else
			render "Edit"
		end
	end

	def destroy
		@ticket.destroy
		redirect_to root_path
	end
  
 
  def tickets_params
		params.require(:ticket).permit(:title, :message, :priority)
	end


	def find_ticket
		@ticket = Ticket.find(params[:id])
	end
  
end
