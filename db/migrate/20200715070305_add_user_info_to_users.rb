class AddUserInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :userinfo, :string
  end
end
