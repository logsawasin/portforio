class CreateStrategies < ActiveRecord::Migration[6.1]
  def change
    create_table :strategies do |t|

      t.timestamps
    end
  end
end
