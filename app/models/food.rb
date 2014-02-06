class Food < ActiveRecord::Base
  belongs_to :fridge

  default_scope -> { order(:deadline) }

  validates :fridge_id, presence: true
  validates :name,      presence: true
  validates :deadline,  presence: true

  def limit
    limit = (self.deadline - Date.today).to_i
    limit < 0 ? limit : limit + 1
  end

  def status
    if self.limit < 3
      if self.limit < 0
        "dead"
      else
        "shortly"
      end
    else
      "safe"
    end
  end
end
