class CreateCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :collections, id: :uuid do |t|
      t.string :name
      t.string :slug, null: false
      t.string :url
      t.text :description

      t.timestamps
    end

    add_index :collections, :slug, unique: true
  end
end
