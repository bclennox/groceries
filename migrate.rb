require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'])

begin
  DB.create_table :trips do
    primary_key :id
    Date :date
  end
rescue PG::DuplicateTable, Sequel::DatabaseError
end

begin
  DB.create_table :people do
    primary_key :id
    String :name
  end
rescue PG::DuplicateTable, Sequel::DatabaseError
end
