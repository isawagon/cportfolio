class TransactionsController < ApplicationController
  def index
    @transactions = @Transaction.all.where(portfolio_id: params[:portfolio_id])
  end

  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    #@coins = Coin.all.where(portfolio_id: params[:portfolio_id])
    # ajouter les prix actuels
    coins = Coin.all.where(portfolio_id: params[:portfolio_id])
    if coins.first
      list = "#{coins.first.gecko_coin}"
      coins.each do |coin|
        list = "#{list},#{coin.gecko_coin}"
      end
      prices = search_price(list)
      prices['euro_fiat'] =
        { "eur" => 1,
          "eur_24h_change" => 0 }
    end
    coins.each do |coin|
      coin.price = prices[coin.gecko_coin]['eur']
    end
    @coins = coins
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

  def search_price(list)
    price_url = "https://api.coingecko.com/api/v3/simple/price?ids=#{list}&vs_currencies=EUR&include_24hr_change=true"
    price_serialized = URI.open(price_url).read
    JSON.parse(price_serialized)
  end

end
