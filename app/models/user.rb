class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :fridges, dependent: :destroy
  has_many :foods, through: :fridges

  after_save :build_examples, if: -> { confirmed_at_changed? && confirmed_at_was.nil? }

  def build_examples
    FactoryGirl.create :fridge_example, user_id: self.id
  end
end
