class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :tite
      t.string :genre
      t.integer :year
      t.references :author
      
      t.timestamps
    end
  end
end
