class VrpCategory < ActiveRecord::Base
  include LinkableModel
  
  has_many :vrp_tasks
  has_many :vrp_subtasks, :through => :vrp_tasks
end
