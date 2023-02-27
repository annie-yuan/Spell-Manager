class CreateRoleClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :role_classes do |t|
      t.string :name, null: false
      
      t.timestamps
    end
  end
end