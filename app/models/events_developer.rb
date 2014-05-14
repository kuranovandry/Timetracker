class EventsDeveloper < ActiveRecord::Base
	 belongs_to :developer
	 belongs_to :event, class_name:"FullcalendarEngine::Event"

	rails_admin do
		visible false
	end
end
