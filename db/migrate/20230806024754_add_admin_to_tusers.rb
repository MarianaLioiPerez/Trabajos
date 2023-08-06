class AddAdminToTusers < ActiveRecord::Migration[7.0]
  def change
    add_column :tusers, :admin, :boolean
  end
end
