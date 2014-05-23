class TeamLeader < ActiveRecord::Base
	validates_presence_of(:name)
  validates_presence_of(:surname)
  

	belongs_to :team, :inverse_of => :developer
	belongs_to :project, :inverse_of => :developer
	has_many :events_team_leaders
	has_many :events, class_name:"FullcalendarEngine::Event", through: :events_team_leaders	

	# rails_admin do
 #    nestable_list true
 #    list do
 #      field :name
 #      field :surname
 #      field :team
 #      field :project
 #    end

 #    edit do
 #        field :name
 #        field :surname
 #        field :team
 #        field :project
 #        field :events
 #        field :photo
 #    end
 #  end
end
