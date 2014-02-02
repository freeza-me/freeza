class Food < ActiveRecord::Base
  belongs_to :fridge

  validates :fridge_id, presence: true
  validates :name,      presence: true
  validates :deadline,  presence: true
end
