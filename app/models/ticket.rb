class Ticket < ActiveRecord::Base
	validates :case_id,  presence: true
  validates :user_id,  presence: true

  attr_accessor :client

  belongs_to :user
  belongs_to :case

  def self.summary(current_user, options = {})
    from = options[:from]
    to = options[:to]
    by = options[:by] || 'case'
    today = Date.today
    from = from ? (from.is_a?(Date) ? from : Date.parse(from)) : self.the_first_day_of_month
    to = to ? (to.is_a?(Date) ? to : Date.parse(to)) : Date.today
    first_order, second_order = Ticket.summary_order(by)
    includes(:user, :case)
    .where(user_id: current_user.id)
    .where("Tickets.date >= ?", from)
    .where("Tickets.date <= ?", to)
    .order(first_order)
    .order(second_order)
  end

  def self.summary_order(by)
    if by == 'time'
      ["tickets.date desc", "cases.number asc"]
    else
      ["cases.number asc", "tickets.date desc"]
    end
  end

  private 

  def self.the_first_day_of_year
    today = Date.today
    return Date.parse("#{today.year}-1-1")
  end

  def self.the_first_day_of_month
    today = Date.today
    return Date.parse("#{today.year}-#{today.month}-1")
  end

  def self.the_first_day_of_last_month
    today = Date.today
    return Date.parse("#{today.year-1}-12-1") if today.month == 1 
    return Date.parse("#{today.year}-#{today.month-1}-1")
  end
end
