class AddPhotoToTusers < ActiveRecord::Migration[7.0]
  def change
    add_column :tusers, :photo, :string
  end
end
