class EvenetsTeamLeader < ActiveRecord::Base
	belongs_to :team_leader
	belongs_to :event, class_name:"FullcalendarEngine::Event"

	rails_admin do
		visible false
	end
end
