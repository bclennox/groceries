Sequel.migration do
  up do
    create_table :trips do
      primary_key :id
      Date :date
    end
  end

  down do
    drop_table(:trips)
  end
end
