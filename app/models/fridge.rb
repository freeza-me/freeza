class Fridge < ActiveRecord::Base
  before_validation :set_inbound_token

  belongs_to :user
  has_many :foods, dependent: :destroy

  validates :user_id, presence: true
  validates :name,    presence: true
  validates :inbound_token, presence: true

  def self.parse_inbound_data data
    data = data.first if data.is_a? Array
    foods = []
    foods << msg['subject'] if msg['subject']
    foods = foods + msg['text'].split(/\n/) if msg['text']
    foods = foods.map{|food| food.split(/,/) }
    foods.map do |name, deadline|
      deadline =
        begin
          Date.parse(deadline)
        rescue
          1.week.since
        end
      [name, deadline]
    end
  end

  def inbound_address
    "fridge-#{self.inbound_token}@freeza.me"
  end

  private

  def set_inbound_token
    unless self.inbound_token
      begin
        token = self.class.generate_token
      end while self.class.where(inbound_token: token).first
      self.inbound_token = token
    end
  end

  def self.generate_token(length=20)
    [(0..9), ('a'..'z'), ('A'..'Z')].map(&:to_a).inject(:+).sample(length).join
  end
end
