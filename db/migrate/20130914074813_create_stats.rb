class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.float :current_hash_rate
      t.float :current_bitcoin_price

      t.timestamps
    end
  end
end
