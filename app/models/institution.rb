class Institution < ActiveRecord::Base
  include LinkableModel
  has_many :vrp_subtasks, :through => :vrp_subtask_institution
end
