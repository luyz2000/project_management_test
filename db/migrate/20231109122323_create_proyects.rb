class CreateProyects < ActiveRecord::Migration[7.0]
  def change
    create_table :proyects do |t|
      t.string :title
      t.string :slug
      t.string :description
      t.integer :status

      t.timestamps
    end
  end
end
