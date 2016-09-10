Sequel.migration do
  up do
    create_table :items do
      primary_key :id
      foreign_key :trip_id, :trips
      foreign_key :person_id, :people
      String :value

      index :trip_id
    end
  end

  down do
    drop_table(:items)
  end
end
