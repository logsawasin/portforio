class AddGameToStrategies < ActiveRecord::Migration[6.1]
  def change
    add_reference :strategies, :game, null: false, foreign_key: true
  end
end
