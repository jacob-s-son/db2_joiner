class DeclarationStatement < ActiveRecord::Base
  include LinkableModel
  belongs_to :declaration_category
  
  define_index do
    indexes body
  end
end
