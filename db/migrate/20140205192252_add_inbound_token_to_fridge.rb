class AddInboundTokenToFridge < ActiveRecord::Migration
  def change
    add_column :fridges, :inbound_token, :string
    add_index :fridges, :inbound_token, unique: true
  end
end
