class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :model
      t.decimal :vrl_year, precision: 10, scale: 2
      t.integer :num_parcel

      t.timestamps
    end
  end
end
