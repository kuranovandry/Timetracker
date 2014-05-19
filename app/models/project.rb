class Project < ActiveRecord::Base
  validates_numericality_of(:team_id, :only_integer => true)
  validates_presence_of(:date)

  belongs_to :team
  has_many :developer, :inverse_of => :project

  rails_admin do
    nestable_list true
    list do
      field :team
      field :date
      field :team
    end
  end

end
