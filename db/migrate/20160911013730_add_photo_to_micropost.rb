class AddPhotoToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :photo, :string
  end
end
