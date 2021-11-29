class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :address
      t.string :region
      t.decimal :price, precision: 6, scale: 2, default: "0.00", null: false
      t.string :image
      t.string :description
      t.string :name
      t.decimal :rate, precision: 6, scale: 1, default: "0.0", null: false
      t.date :date

      t.timestamps
    end
  end
end
