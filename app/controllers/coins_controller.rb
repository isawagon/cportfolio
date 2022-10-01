class CoinsController < ApplicationController
  before_action :set_portfolio, only: %i[new create]

  require "open-uri"

  def index
  end

  def show
  end

  def new
    @coin = Coin.new
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

  def create
    @coin = Coin.new(coin_params)
    @coin.portfolio = @portfolio
    main_data = search_main_data(@coin.gecko_coin)
    @coin.name = main_data["name"].capitalize
    @coin.symbol = main_data["symbol"].upcase
    @coin.image_url = (main_data["image"])["large"]
    @coin.stock = 0

    # empêcher la création d'une crypto déjà en portefeuille
    if @coin.save!
      redirect_to root_path, notice: "nouvelle crypto ajoutée"
    else
      render :new, status: :unprocessable_entity, notice: "erreur"
    end
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

  def coin_params
    params.require(:coin).permit(:gecko_coin)
  end

  def search_main_data(gecko_id)
    main_data_url = "https://api.coingecko.com/api/v3/coins/#{gecko_id}?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false"
    main_data_serialized = URI.open(main_data_url).read
    # gérer l'erreur si l'utilisateur ne saisit pas une crypto valide
    # (en attendant de pouvoir la sélectionner)
    JSON.parse(main_data_serialized)
  end

end
