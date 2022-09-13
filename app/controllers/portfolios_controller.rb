class PortfoliosController < ApplicationController
  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user = current_user
    if @portfolio.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:name)
  end
end
