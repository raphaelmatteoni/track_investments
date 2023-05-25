class StocksController < ApplicationController

	def index
		@stocks = Stock.all
		render json: @stocks, each_serializer: StockSerializer
	end

end
