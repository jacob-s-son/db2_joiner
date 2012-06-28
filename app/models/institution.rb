class Institution < ActiveRecord::Base
  has_many :vrp_subtasks, :through => :vrp_subtask_institution
end
