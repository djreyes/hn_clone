class AddInvisibleToLinks < ActiveRecord::Migration
  def change
    add_column :links, :invisible, :boolean
  end
end
