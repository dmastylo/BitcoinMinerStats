# == Schema Information
#
# Table name: stats
#
#  id                    :integer          not null, primary key
#  current_hash_rate     :float
#  current_bitcoin_price :float
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Stat < ActiveRecord::Base

  attr_accessible :current_bitcoin_price, :current_hash_rate

  def self.hash_rate_stats
    Stat.all.collect do |stat|
      stat.current_hash_rate unless stat.current_hash_rate.blank?
    end
  end

  def self.bitcoin_price_stats
    Stat.all.collect do |stat|
      stat.current_bitcoin_price unless stat.current_hash_rate.blank?
    end
  end

end
