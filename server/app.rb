require 'pg'
require 'sequel'
require 'sinatra'

require_relative 'db/connect'
require_relative 'models/trip'
require_relative 'models/person'

get '/trips' do
  { data: Trip.all }.to_json
end

get '/people' do
  { data: Person.all }.to_json
end
