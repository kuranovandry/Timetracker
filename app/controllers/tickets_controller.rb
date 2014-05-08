class TicketsController < ApplicationController
	attr_reader :ticket_params
  # before_action :signed_in_user
  before_action :process_ticket_params, only: [:create, :update]

  def index
    @tickets = Ticket.includes(:user, :case)
    # .where(user_id: @user.id).order(created_at: :desc)
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(Ticket_params)
    if correct_user && @ticket.save
      flash[:success] = ticket_success_message(:create)
      redirect_to new_ticket_path
    else
      render 'new'
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(ticket_params)
      flash[:success] = "Record updated."
      redirect_back_or @ticket
    else
      render edit_ticket_path(@ticket)
    end
  end

  def destroy
    if params[:user_id].to_i == current_user.id
      @ticket = Ticket.find(params[:id])
      if @ticket.present?
        flash[:info] = delete_success_message
        @ticket.destroy
      end
    else
      flash[:warning] = "You can not delete other people's ticket records."
    end
    redirect_to tickets_path
  end

  private

  def process_ticket_params
    @ticket_params = params.require(:ticket).permit(:date, :client, :description, :spent, :user_id)
    ticket_case = Case.where(number: ticket_params[:client]).first_or_create
    @ticket_params[:case_id] = ticket_case.id if ticket_case.save
  end

  def correct_user
    ticket_params[:user_id].to_i == current_user.id
  end

  def delete_success_message
    "A ticket record has been deleted. Date: #{@ticket.date},\
     Client: #{@ticket.case.number},\
     Description: #{@ticket.description},\
     Spent: #{@ticket.user} hours"
  end

  def ticket_success_message(action)
    prefix = action == :create ? 'New ticket added.' : 'Need Implementation.'
    "#{prefix} Date: #{ticket_params['date(1i)']}-#{ticket_params['date(2i)']}-#{ticket_params['date(3i)']},\
     Client: #{ticket_params[:client]},\
     Description: #{ticket_params[:description]},\
     Spent: #{ticket_params[:spent]} hours"
  end
end
