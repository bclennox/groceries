require 'jsonapi-serializers'
require 'pg'
require 'sequel'
require 'sinatra'

require_relative 'db/connect'
require_relative 'models/trip'
require_relative 'models/person'
require_relative 'models/item'
require_relative 'serializers/trip_serializer'
require_relative 'serializers/person_serializer'
require_relative 'serializers/item_serializer'

get '/api/trips/:id' do
  trip = params[:id] == 'latest' ? Trip.latest : Trip[id: params[:id]]
  trip.to_json_api(include: %w(people items items.person))
end

get '/api/people/:id' do
  person = Person[id: params[:id]]
  person.to_json_api
end

post '/api/items' do
  request.body.rewind
  data = JSON.parse(request.body.read)
  attributes = data.dig('data', 'attributes')
  attributes[:trip_id] = data.dig('data', 'relationships', 'trip', 'data', 'id')
  attributes[:person_id] = data.dig('data', 'relationships', 'person', 'data', 'id')

  item = Item.new(attributes)
  item.save

  item.to_json_api(include: %w(trip person))
end
