class Case < ActiveRecord::Base
  validates :number,  presence: true
  has_many :tickets
end
