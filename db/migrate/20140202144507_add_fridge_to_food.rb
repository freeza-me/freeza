class AddFridgeToFood < ActiveRecord::Migration
  def change
    add_reference :foods, :fridge, index: true
  end
end
