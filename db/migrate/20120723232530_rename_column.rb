class RenameColumn < ActiveRecord::Migration
  def up
    rename_column :links, :author_id, :user_id
  end

  def down
  end
end
