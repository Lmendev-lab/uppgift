class AddForeignKeyOnTask < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :tasks, :users, column: :owner_id, validate: false
  end
end
