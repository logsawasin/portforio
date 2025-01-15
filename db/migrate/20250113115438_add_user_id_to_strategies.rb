class AddUserIdToStrategies < ActiveRecord::Migration[6.1]
  def change
    add_column :strategies, :user_id, :integer
  end
end
