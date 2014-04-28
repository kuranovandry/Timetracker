class Team < ActiveRecord::Base
  validates_presence_of :manager
  validates_numericality_of :founded, :only_integer => true

  has_many :developer, :inverse_of => :team


  def developer_names_truncated
    developer.map{|p| p.name}.join(", ")[0..32]
  end

end
