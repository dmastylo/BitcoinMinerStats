require 'open-uri'
require 'json'

class StatsController < ApplicationController

  def index
    if params[:update_stats]
      # Polling for new stats
      @new_stat = Stat.last
    else
      @stats = Stat.all
    end
  end

  def create
    current_hash_rate = params[:avg]

    json_data = open('https://data.mtgox.com/api/2/BTCUSD/money/ticker', {:ssl_ca_cert => nil, :ssl_verify_mode => false}).read
    current_bitcoin_rate = JSON.parse(json_data)['data']['avg']['value']

    Stat.create(current_hash_rate: current_hash_rate, current_bitcoin_price: current_bitcoin_rate.to_f)

    flash.now[:success] = "Added stat!"
  end

end
