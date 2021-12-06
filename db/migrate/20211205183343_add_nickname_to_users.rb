class AddNicknameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nickname, :string, null: false, default: ""
  end
end