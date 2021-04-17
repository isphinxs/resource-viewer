class CreateResources < ActiveRecord::Migration[6.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :amount
      t.string :link
      t.text :description
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
