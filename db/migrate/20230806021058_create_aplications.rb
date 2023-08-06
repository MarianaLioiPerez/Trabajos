class CreateAplications < ActiveRecord::Migration[7.0]
  def change
    create_table :aplications do |t|
      t.string :text
      t.references :job_offer, null: false, foreign_key: true
      t.references :tuser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
