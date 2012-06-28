class DeclarationCategory < ActiveRecord::Base
  include LinkableModel
  
  has_many :declaration_statements
  has_many :subcategories, :class_name => "DeclarationCategory", :foreign_key => :parent_category_id
  belongs_to :parent_category, :class_name => "DeclarationCategory", :foreign_key => :parent_category_id
  
  define_index do
    indexes :name, sortable: true
  end
end
