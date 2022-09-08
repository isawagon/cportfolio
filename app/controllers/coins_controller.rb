class CoinsController < ApplicationController
  def index
    @portfolios = current_user.portfolios.all

# affiner en ne transmettant que les coins des portfolios du user
    @coins = Coin.all
  end

  def show
  end

end
