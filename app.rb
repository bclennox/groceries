require 'pg'
require 'sequel'
require 'sinatra'

DB = Sequel.connect(ENV['DATABASE_URL'])

class Trip < Sequel::Model
end

class Person < Sequel::Model(:people)
end

get '/trips' do
  Trip.map(:date).join('<br>')
end

get '/people' do
  Person.map(:name).join('<br>')
end
