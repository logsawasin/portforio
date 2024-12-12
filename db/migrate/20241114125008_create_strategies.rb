class CreateStrategies < ActiveRecord::Migration[6.1]
  def change
    create_table :strategies do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.timestamps
    end
  end
end
