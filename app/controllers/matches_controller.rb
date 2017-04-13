class MatchesController < ApplicationController
  before_action :authenticate_user!
	
	before_action :find_matches, only: [:show, :edit, :update, :destroy]

	def index
		@match = current_user.match.all.order('created_at DESC')
	end

	
	def new
		@match = Match.new
	end

	def create
		@match = Match.new(matches_params)

		if @match.save
			redirect_to @match
		else
			render "New"
		end
	end

	def edit
	end

	def update
		if @match.update(matches_params)
			redirect_to @match
		else
			render "Edit"
		end
	end

	def destroy
		@match.destroy
		redirect_to root_path
	end

	private

	def matches_params
		params.require(:match).permit(:receiver_id, :giver_id)
	end

	
	

	def find_matches
		@match = Match.find(params[:id])
	end
end
