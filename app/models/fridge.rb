class Fridge < ActiveRecord::Base
  before_validation :set_inbound_token

  belongs_to :user
  has_many :foods, dependent: :destroy

  validates :user_id, presence: true
  validates :name,    presence: true
  validates :inbound_token, presence: true

  def self.parse_inbound_data json
    data = ActiveSupport::JSON.decode(json)
    data = data.first if data.is_a? Array
    raise unless data['event'] && data['event'] == 'inbound'
    raise unless data['msg'] && msg = data['msg']
    raise unless (m = msg['to'][0][0].match(/^fridge-(.*)@freeza.me$/))[0] && token = m[1]
    name, deadline = if msg['subject'].present?
                       [msg['subject'], msg['text'] ]
                     else
                       msg['text'].split(/\n/)[0..1]
                     end
    deadline = if deadline.present?
                 Date.parse(deadline)
               else
                 1.week.since
               end
    [token, name, deadline]
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
