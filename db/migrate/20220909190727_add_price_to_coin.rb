class AddPriceToCoin < ActiveRecord::Migration[6.1]
  def change
    add_column :coins, :price, :float
    add_column :coins, :change, :float
  end
end
