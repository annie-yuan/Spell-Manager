class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name, limit: 70, null: false
  #    t.references :spell, foreign_key: true

      t.timestamps
    end
  end
end