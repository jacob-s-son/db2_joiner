class VrpCategory < ActiveRecord::Base
  has_many :vrp_tasks
  has_many :vrp_subtasks, :through => :vrp_tasks
end
