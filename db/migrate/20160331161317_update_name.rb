class UpdateName < ActiveRecord::Migration
  def change
    change_column_null :users, :first_name, false, ""
    change_column_null :users, :last_name, false, ""
    change_column_null :users, :username, false, ""
  end
end
