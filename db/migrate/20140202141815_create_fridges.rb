class CreateFridges < ActiveRecord::Migration
  def change
    create_table :fridges do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
