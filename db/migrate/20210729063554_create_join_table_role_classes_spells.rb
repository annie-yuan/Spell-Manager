class CreateJoinTableRoleClassesSpells < ActiveRecord::Migration[6.1]
  def change
    create_join_table :role_classes, :spells do |t|
      # t.index [:role_class_id, :spell_id]
      t.index [:spell_id, :role_class_id], unique: true
    end
  end
end
