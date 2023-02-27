class Book < ApplicationRecord
      has_and_belongs_to_many :spells  
      validates_presence_of :name
      validates_length_of :name, maximum: 70  
    
   def spells_name
        result = ""
        spells.order(:name).each do |spell|
           if result != ""
               result << ", "
           end
           result << spell.name 
        end
        return result         
    end    
    

  def self.order_by field
      return Book.order(:name)
  end
    
end