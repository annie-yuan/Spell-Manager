class CreateSpells < ActiveRecord::Migration[6.1]
  def change
    create_table :spells do |t|
      t.string :name, limit: 70, null: false
      t.string :description, limit: 4096
      t.integer :level, null: false
      t.string :concentration, null: false
      t.references :school, null: false, foreign_key: true
        
        t.timestamps
    end
  end
end