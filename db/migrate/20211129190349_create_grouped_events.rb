class CreateGroupedEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :grouped_events do |t|
      t.references :group, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.integer :points, default: "0", null: false

      t.timestamps
    end
  end
end
