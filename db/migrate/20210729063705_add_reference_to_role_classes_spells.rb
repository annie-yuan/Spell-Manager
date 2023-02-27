class AddReferenceToRoleClassesSpells < ActiveRecord::Migration[6.1]
  def change
      add_foreign_key :role_classes_spells, :role_classes, column: :role_class_id, primary_key: "id"      
      add_foreign_key :role_classes_spells, :spells, column: :spell_id, primary_key: "id"  
  end
end
