class Project < ActiveRecord::Base
  validates_numericality_of(:team_id, :only_integer => true)
  validates_presence_of(:date)

  belongs_to :team
  has_many :developer, :inverse_of => :project
  
end
