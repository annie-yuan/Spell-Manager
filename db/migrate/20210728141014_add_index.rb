class AddIndex < ActiveRecord::Migration[6.1]
  def change
      add_index :books, :name, unique: true
      add_index :spells, :name, unique: true
  end
end