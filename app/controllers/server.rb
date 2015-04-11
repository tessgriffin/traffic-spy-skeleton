require 'json'
require 'byebug'

module TrafficSpy
  class Server < Sinatra::Base
    get '/' do
      erb :index
    end

    not_found do
      erb :error
    end

    post '/sources' do 
      source_helper = SourceHelper.call(params)
      status SourceHelper.status
      body   SourceHelper.body
    end

    get '/sources/:identifier' do |identifier|
      @source = Source.find_by(identifier: identifier)
      #@url = Url.find_by(id: @source.url_id)
      if @source == nil
        erb :no_source_error
      else
        erb :aggregate_data
      end
    end

    get '/sources/:identifier/urls/:path' do |identifier, path|
      @url = Url.find_by(name: "http://#{identifier}/#{path}")
      erb :url_data
    end

    post '/sources/:identifier/data' do |identifier|
      payload_helper = PayloadHelper.call(params, identifier)
      status PayloadHelper.status
      body   PayloadHelper.body
    end
  end
end
