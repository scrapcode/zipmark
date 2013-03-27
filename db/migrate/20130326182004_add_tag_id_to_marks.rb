class AddTagIdToMarks < ActiveRecord::Migration
  def change
    add_column :marks, :tag_id, :integer
  end
end
