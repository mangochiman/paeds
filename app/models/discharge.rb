class Discharge < ActiveRecord::Base
belongs_to:patient
validates_presence_of :patient_id,:drugs_taken_home, :discharged_by
end
