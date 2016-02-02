class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :blog_id

      t.timestamps null: false
    end
  end
end
