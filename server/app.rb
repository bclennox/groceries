require 'jsonapi-serializers'
require 'pg'
require 'sequel'
require 'sinatra'
require 'securerandom'

require_relative 'db/connect'
require_relative 'models/trip'
require_relative 'models/person'
require_relative 'models/item'
require_relative 'serializers/trip_serializer'
require_relative 'serializers/person_serializer'
require_relative 'serializers/item_serializer'

enable :sessions
set :session_secret, ENV['SESSION_SECRET']

def render_trip(trip)
  trip.to_json_api(include: %w(people items items.person), context: { item_token: session[:item_token] })
end

before do
  session[:item_token] ||= SecureRandom.hex(16)
end

get '/api/trips/latest' do
  render_trip(Trip.latest)
end

get '/api/trips/:id' do
  render_trip(Trip[params[:id]])
end

get '/api/people/:id' do
  person = Person[params[:id]]
  person.to_json_api
end

post '/api/items' do
  request.body.rewind
  data = JSON.parse(request.body.read)
  attributes = data.dig('data', 'attributes')

  attributes['trip_id'] = data.dig('data', 'relationships', 'trip', 'data', 'id')
  attributes['person_id'] = data.dig('data', 'relationships', 'person', 'data', 'id')
  attributes['token'] = session[:item_token]
  attributes.delete('editable')

  item = Item.new(attributes)
  item.save

  item.to_json_api(include: %w(trip person), context: { item_token: session[:item_token] })
end

delete '/api/items/:id' do
  item = Item[params[:id]]
  item.destroy
  item.to_json_api
end
