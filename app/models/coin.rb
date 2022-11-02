class Coin < ApplicationRecord
  belongs_to :portfolio
  validates :gecko_coin, presence: true,
                         uniqueness: { scope: :portfolio, message: "this coin is already in your portfolio" },
                         confirmation: true
end
