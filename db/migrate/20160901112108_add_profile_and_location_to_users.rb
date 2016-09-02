class AddProfileAndLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile, :text
    add_column :users, :location, :string
  end
end
