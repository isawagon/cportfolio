class AddMarketCapRankToCoins < ActiveRecord::Migration[6.1]
  def change
    add_column :coins, :market_cap_rank, :integer
  end
end
