class DeclarationCategory < ActiveRecord::Base
  include LinkableModel
  
  has_many :declaration_statements
  has_many :subcategories, :class_name => "DeclarationCategory", :foreign_key => :parent_category_id
  belongs_to :parent_category, :class_name => "DeclarationCategory", :foreign_key => :parent_category_id
  
  scope :main, where(:parent_category_id => nil)
  
  define_index do
    indexes :name, sortable: true
  end
end
