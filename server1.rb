require 'sinatra'
require 'sinatra/reloader'
require 'json'
require_relative 'lib/general'
require_relative 'lib/addition'
require_relative 'lib/subtraction'

before "*" do
  response.headers['Access-Control-Allow-Origin'] = '*'
  content_type :json
end
