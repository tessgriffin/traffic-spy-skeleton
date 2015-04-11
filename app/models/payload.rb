module TrafficSpy  
  class Payload < ActiveRecord::Base
    belongs_to :source
    belongs_to :url
    belongs_to :user_agent
    belongs_to :resolution

    validates :requested_at, presence: true
    validates :responded_in, presence: true
    validates :ip, uniqueness: { scope: :requested_at,
      message: "Can't send multiple payloads" }
  end
end