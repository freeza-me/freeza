class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.date :deadline

      t.timestamps
    end
  end
end
