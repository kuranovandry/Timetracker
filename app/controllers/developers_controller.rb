class DevelopersController < ApplicationController

	def new
		@developer = Developer.new
		respond_to do |format|
			format.html
			format.js
		end
	end

	def create
		@developer = Developer.new(params[:developer])
		if @developer.save
			session[:developer_id] = @developer.id
			flash.now.alert = "Registration successful."
		else
			render 'new'
		end

	end

	def index
		redirect_to  and return unless session[:developer_id]
    if params[:query].present?
      @developers = developer.paginate(page: params[:page], per_page: 5).order("#{sort_column} #{sort_direction}").search(params[:query])
    else
      @developers = developer.order("#{sort_column} #{sort_direction}").paginate(page: params[:page], per_page: 5)
    end
	end

	def update
   render :edit unless @developer.update_attributes(params[:developer])
	end

	def destroy
		redirect_to session_path, notice: "You do not have permition to delete this developer" and return  if current_user != @user
	end

  def sort
    params[:developer].each_with_index do |id, index|
      developer.where(id: id).update_all({position: index+1})
    end
    render nothing: true
  end
  
  def autocomplete
    # binding.pry
    render json: developer.search(params[:query], autocomplete: true).map(&:full_name) if params[:query].size > 2
  end

private

	def find_developer
		@developer = developer.find(params[:id])
	end

  def sort_column
    params[:sort].present? ? params[:sort] : "position"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
