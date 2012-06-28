class DeclarationStatement < ActiveRecord::Base
  belongs_to :declaration_category
  
  define_index do
    indexes body
  end
end
