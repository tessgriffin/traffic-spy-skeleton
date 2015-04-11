module TrafficSpy
  class Url < ActiveRecord::Base
    has_many :payloads

    def longest_response_time
      payloads.maximum(:responded_in)
    end

    def shortest_response_time
      payloads.minimum(:responded_in)
    end

    def average_response_time
      payloads.average(:responded_in).to_f.round
    end

    def all_request_types
      payloads.pluck(:request_type).uniq
    end

    def most_popular_referrers
      payloadss = payloads.pluck(:referred_by) 
      frequency = payloadss.reduce(Hash.new(0)) { |h, v| h[v] += 1; h}
      payloadss.uniq.sort_by {|v| frequency[v] }.reverse
    end

    def most_popular_user_agents
      user_agents = payloads.pluck(:user_agent_id)
      browsers = user_agents.flat_map {|user_agent| UserAgent.where(id: user_agent).pluck(:browser)}

      frequency = browsers.reduce(Hash.new(0)) { |h, v| h[v] += 1; h}
      browsers.uniq.sort_by {|v| frequency[v] }.reverse
    end
  end
end