class TransactionsController < ApplicationController
  def index
    @transactions = @Transaction.all.where(portfolio_id: params[:portfolio_id])
  end

  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @coins = Coin.all.where(portfolio_id: params[:portfolio_id])
    @registered = Transaction.all.where(portfolio_id: params[:portfolio_id]).sort.reverse
    @transaction = Transaction.new

  end

  def create
    @transaction = Transaction.new(transaction_params)
    @coins = Coin.where(portfolio_id: params[:portfolio_id])
    @transaction.portfolio_id = params[:portfolio_id]


    if @transaction.save
      redirect_to new_portfolio_transaction_path, notice: "transaction ajoutée"
    else
      redirect_to new_portfolio_transaction_path, notice: "pb ajout transaction"
    end

  end

  private

  def transaction_params
    params.require(:transaction).permit(:coin_in_id,   :amount_in,
                                        :coin_out_id,  :amount_out,
                                        :coin_fees_id, :amount_fees,
                                        :date)
  end
end
