class AddOwnerToTask < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :tasks, :owner, index: {algorithm: :concurrently}
  end
end
