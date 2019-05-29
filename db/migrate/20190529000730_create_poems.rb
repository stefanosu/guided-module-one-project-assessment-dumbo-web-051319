class CreatePoems < ActiveRecord::Migration[5.2]
  def change
    create_table :poems do |t|
      t.string :title
      t.string :content 
      t.string :genre 
      t.integer :poet_id 
  end
 end 
end
