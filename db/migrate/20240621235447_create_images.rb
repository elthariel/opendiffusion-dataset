class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images, id: :uuid do |t|
      t.references :collection, null: false

      t.string :url
      t.datetime :pinged_at
      t.integer :http_status, default: 0, null: false

      t.timestamps
    end
  end
end
