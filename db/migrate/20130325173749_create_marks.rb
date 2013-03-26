class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :user_id
      t.string :url
      t.string :title
      t.string :tag

      t.timestamps
    end

    add_index :marks, :user_id
    add_index :marks, :tag
    add_index :marks, :url
  end
end
