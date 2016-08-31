Sequel.migration do
  up do
    create_join_table(person_id: :people, trip_id: :trips)
  end

  down do
    drop_join_table(person_id: :people, trip_id: :trips)
  end
end
