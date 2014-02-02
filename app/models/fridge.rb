class Fridge < ActiveRecord::Base
  belongs_to :user
  has_many :foods

  validates :user_id, presence: true
  validates :name,    presence: true
end
