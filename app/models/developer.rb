class Developer < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates_presence_of(:name)
  validates_presence_of(:surname)
  validates_presence_of(:position)

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :photo

  belongs_to :team, :inverse_of => :developer
	belongs_to :project, :inverse_of => :developer
  has_many :events_developers
  has_many :events, class_name:"FullcalendarEngine::Event", through: :events_developers


  rails_admin do
    nestable_list true
    list do
      field :name
      field :surname
      field :position
      field :retired
      field :team
      field :project
    end

    edit do
        field :name
        field :surname
        field :position
        field :retired
        field :team
        field :project
        field :events
        field :notes
        field :my_project
        field :photo
      end
  end
  def position_enum
    ['Trainee', 'Junior', 'Middle', 'Senior']
  end
end
