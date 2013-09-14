require 'open-uri'
require 'json'

class StatsController < ApplicationController

  def index
    @stats = Stat.all
  end

  def create
    current_hash_rate = params[:avg]

    json_data = open('https://data.mtgox.com/api/2/BTCUSD/money/ticker', {:ssl_ca_cert => nil, :ssl_verify_mode => false}).read
    data = JSON.parse(json_data)['avg']
    current_bitcoin_rate = data['value']

    Stat.create(current_hash_rate: current_hash_rate, current_bitcoin_rate: current_bitcoin_rate)

    flash.now[:success] = "Added stat!"
  end

end
