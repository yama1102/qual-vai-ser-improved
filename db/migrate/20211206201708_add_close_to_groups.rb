class AddCloseToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :close, :boolean, default: false
  end
end
