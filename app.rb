require 'rubygems'
require 'bundler'
require "sinatra/reloader"

Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Citibike
	class App < Sinatra::Application
    configure :development do
      register Sinatra::Reloader
    end

    before do
      json = File.open("data/station_data.json").read
      @data = MultiJson.load(json)
    end

    get '/' do
      erb :home
    end

    get '/form' do
      erb :form
    end

    post '/form' do
    erb :response
    end

    post '/map' do
      erb :map
    end
  end
end