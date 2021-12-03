class AddImportanceToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :importance, :integer
  end
end
