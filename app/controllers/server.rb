require 'json'

module TrafficSpy
  class Server < Sinatra::Base
    get '/' do
      erb :index
    end

    not_found do
      erb :error
    end

    post '/sources' do 
      source = Source.create(root_url: params["rootUrl"], identifier: params["identifier"])
      status 200
      body "success"
    end
  end
end


#attributes = JSON.parse(params)

#get out idendifier 