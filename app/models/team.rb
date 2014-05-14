class Team < ActiveRecord::Base
  validates_presence_of :manager
  
  has_many :developer, :inverse_of => :team

  rails_admin do
    nestable_list true
  end

  def developer_names_truncated
    developer.map{|p| p.name}.join(", ")[0..32]
  end

end
