class VrpTask < ActiveRecord::Base
  belongs_to :vrp_category
  has_many :vrp_subtasks
  
  define_index do
    indexes content
    indexes result
  end
end
