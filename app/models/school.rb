class School < ApplicationRecord
      has_many :spell
    
      validates_presence_of :name
 
  # Creates and array of arrays to use in dropdown selects for author. For more info:  
  # https://guides.rubyonrails.org/form_helpers.html#select-boxes-for-dealing-with-model-objects
  def self.to_nested_array_for_select
     nested = []  
     School.order(:name).each do |school|
         nested.push [school.name, school.id]
     end
     return nested 
  end
end