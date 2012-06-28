class VrpSubtask < ActiveRecord::Base
  has_many :institutions, :through => :vrp_subtask_institution
  belongs_to :vrp_task
  
  define_index do
    indexes description
    indexes end_date, sortable: true
  end
end
