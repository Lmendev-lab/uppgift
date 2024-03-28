# frozen_string_literal: true

class TaskOwnerBackfill < ActiveRecord::Migration[6.1]
  def up
    Task.find_each do |task|
      task.update(owner_id: User.first.id)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
