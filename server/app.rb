require 'pg'
require 'sequel'
require 'sinatra'

require_relative 'db/connect'
require_relative 'models/json_api_serializer'
require_relative 'models/trip'
require_relative 'models/person'

get '/trips/:id' do
  trip = Trip[id: params[:id]]
  JsonApiSerializer.new(trip, relationships: :people).to_json
end
