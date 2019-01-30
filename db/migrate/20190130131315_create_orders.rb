class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :date
      t.integer :number

      t.timestamps
    end
  end
end
