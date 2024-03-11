class ChangeTitleColumnNameToName < ActiveRecord::Migration[6.1]
  def change
    rename_column :categories, :title, :name
  end
end
