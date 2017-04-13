class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_verified
  before_action :find_ticket, only: [:show, :edit, :update, :destroy]
  
  def index
    if current_user.admin == true
      @tickets = Tickets.all.order('created_at DESC')
    else
    @tickets = current_user.tickets.all.order('created_at DESC')
    end
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
    if current_user.id == @ticket.user_id || current_user.admin == true

		else
			redirect_to root_path, notice: "Ticket not found."
		end
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
		params.require(:ticket).permit(:title, :message, :priority, :user_id)
	end


	def find_ticket
		@ticket = Ticket.find(params[:id])
	end
  
end
