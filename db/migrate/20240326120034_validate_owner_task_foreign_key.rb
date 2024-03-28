class ValidateOwnerTaskForeignKey < ActiveRecord::Migration[6.1]
  def change
    validate_foreign_key :tasks, :users, column: :owner_id
  end
end
