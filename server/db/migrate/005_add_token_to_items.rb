Sequel.migration do
  up do
    add_column :items, :token, :text
  end

  down do
    remove_column :items, :token
  end
end
