class CreateResourceCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :resource, null: false, foreign_key: true

      t.timestamps
    end
  end
end
