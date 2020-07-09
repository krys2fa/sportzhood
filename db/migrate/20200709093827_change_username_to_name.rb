class ChangeUsernameToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :username, :Name
  end
end
