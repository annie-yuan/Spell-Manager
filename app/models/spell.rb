class Spell < ApplicationRecord
      has_and_belongs_to_many :books  
      has_and_belongs_to_many :role_classes  
      belongs_to :school
    
      validates_presence_of :name
      validates_presence_of :level
      validates_presence_of :concentration

      validates_length_of :name, maximum: 70 
      validates_length_of :description, maximum: 4096    
      validates_length_of :level, maximum: 1
    
      validates :name, uniqueness: { case_sensitive: false,
      message: "cannot be the same as an existing spell. Case insensitive."}

#     validate :presence_of_class
#     def presence_of_class
#         if role_classes.count == 0
#             errors.add(:spell, "must have one or more classes")
#         end
#     end
    
  def self.order_by field
    if field == 'level'
      return Spell.order(:level, :name)
    elsif field == 'name'
      return Spell.order(:name)
    elsif field == 'school'
      return Spell.joins(:school).order(:name)
    elsif field == 'concentration'
      return Spell.order(:concentration, :name)
    else
      return Spell.order(:level, :name)
    end
  end
    
      
  # Creates and array of arrays to use in dropdown selects for author. For more info:  
  # https://guides.rubyonrails.org/form_helpers.html#select-boxes-for-dealing-with-model-objects
  def self.to_nested_array_for_select
     nested = []  
     School.order(:name).each do |school|
         nested.push [school.name, school.id]
     end
     return nested 
  end
    
   def role_classes_as_string
        result = ""
        role_classes.order(:name).each do |role_class|
           if result != ""
               result << ", "
           end
           result << role_class.name 
        end
        return result         
    end
end