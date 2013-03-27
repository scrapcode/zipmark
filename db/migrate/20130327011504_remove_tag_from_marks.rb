class RemoveTagFromMarks < ActiveRecord::Migration
  def up
    remove_column :marks, :tag
  end

  def down
    add_column :marks, :tag
  end
end
