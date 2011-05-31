class Treatment < ActiveRecord::Base
belongs_to:patient
validates_presence_of :patient_id, :drug_name, :quantity, :duration_per_day, :start_date, :end_date,
:prescibed_by
end
