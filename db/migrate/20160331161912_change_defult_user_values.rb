class ChangeDefultUserValues < ActiveRecord::Migration
  def change
        change_column_default :users, :first_name, ""
        change_column_default :users, :last_name, ""
        change_column_default :users, :username, ""
  end
end
