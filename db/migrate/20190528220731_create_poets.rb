class CreatePoets < ActiveRecord::Migration[5.2]
  def change
    create_table :poets do |t|
      t.string :name
      t.string :birthdate 
      t.string :nationality   
   end
  end
end
