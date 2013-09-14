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
    time = -5
    Stat.all.collect do |stat|
      time = time + 5
      [time, stat.current_hash_rate] 
    end
  end

end
