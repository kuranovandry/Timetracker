class Team < ActiveRecord::Base
  validates_presence_of :manager
  has_many :developer, :inverse_of => :team
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :logo

  rails_admin do
    nestable_list true
    list do
      field :name
      field :manager
      field :logo
    end
  end

end
