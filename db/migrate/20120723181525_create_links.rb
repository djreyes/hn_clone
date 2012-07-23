class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.String :url
      t.Integer :author_id
      t.String :title

      t.timestamps
    end
  end
end
