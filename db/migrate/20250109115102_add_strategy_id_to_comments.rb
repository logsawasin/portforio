class AddStrategyIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :strategy_id, :integer
    add_column :comments, :customer_id, :integer
  end
end
