class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.integer :author_id
      t.string :title

      t.timestamps
    end
  end
end
