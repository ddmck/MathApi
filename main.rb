require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'newrelic_rpm'
require_relative 'lib/general'
require_relative 'lib/addition'
require_relative 'lib/subtraction'
require_relative 'lib/multiplication'

before "*" do
  response.headers['Access-Control-Allow-Origin'] = '*'
  content_type :json
end

get "/ping" do
  200
end