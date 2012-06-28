class VrpSubtaskInstitution < ActiveRecord::Base
  belongs_to :vrp_subtasks
  belongs_to :institution
end
