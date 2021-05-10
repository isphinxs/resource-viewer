class ChangeAmountTypeToDecimal < ActiveRecord::Migration[6.1]
  def up
    change_column :resources, :amount, :decimal USING amount::numeric
  end

  def down
    change_column :resources, :amount, :string
  end
end
