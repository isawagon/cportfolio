class CreateCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :coins do |t|
      t.string :gecko_coin
      t.string :symbol
      t.string :name
      t.string :image_url
      t.references :portfolio, null: false, foreign_key: true
      t.decimal :stock

      t.timestamps
    end
  end
end
