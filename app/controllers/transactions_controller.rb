class TransactionsController < ApplicationController
  def index
  end

  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coins = Coin.where(portfolio_id: params[:portfolio_id])
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @coins = Coin.where(portfolio_id: params[:portfolio_id])
  end

  private

  def transaction_params
    params.require(:transaction).permit(:coin_in_id,   :amount_in,
                                        :coin_out_id,  :amount_out,
                                        :coin_fees_id, :amount_fees,
                                        :date)
  end
end
