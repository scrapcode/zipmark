class AddMarkIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :mark_id, :integer
  end
end
