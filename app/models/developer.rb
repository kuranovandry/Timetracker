class Developer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
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
      field :team
      field :position
      field :retired
    end

    edit do
        field :team
        field :name
        field :position
        field :number
        field :retired
        field :notes
        field :events
      end
  end
  def position_enum
    ['Trainee', 'Junior', 'Middle', 'Senior']
  end
end
