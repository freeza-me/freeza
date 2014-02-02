class Food < ActiveRecord::Base

  validates :name,     presence: true
  validates :deadline, presence: true
end
