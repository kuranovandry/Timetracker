class Developer < ActiveRecord::Base
	validates_presence_of(:name)
  validates_numericality_of(:number, :only_integer => true)
  validates_uniqueness_of(:number, :scope => :team_id, :message => "There is already a developer with that number on this team")

  belongs_to :team, :inverse_of => :developer
	belongs_to :project, :inverse_of => :developer
  has_many :events_developers
  has_many :events, class_name:"FullcalendarEngine::Event", through: :events_developers
  
  rails_admin do
    nestable_list true
    list do
      field :name
      field :number
    end
  end

  def draft_id
    self.draft.try :id
  end
  
  def draft_id=(id)
    self.draft = Project.find_by_id(id)
  end
end
