class Food < ActiveRecord::Base
  belongs_to :fridge

  default_scope -> { order(:deadline) }

  validates :fridge_id, presence: true
  validates :name,      presence: true
  validates :deadline,  presence: true

  def limit
    (self.deadline - Date.today).to_i
  end
end
