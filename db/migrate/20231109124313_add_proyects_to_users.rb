class AddProyectsToUsers < ActiveRecord::Migration[7.0]
  create_table :proyect_users do |t|
    t.references :proyect
    t.references :user
    t.integer :role, default: 0
    t.timestamps
  end
end
