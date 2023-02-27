class RoleClass < ApplicationRecord
    has_and_belongs_to_many :spells
    
    validates_presence_of :name, presence: true, :message => "A spell must have one or more classes"
    

end