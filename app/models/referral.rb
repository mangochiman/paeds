class Referral < ActiveRecord::Base
belongs_to:patient
validates_presence_of :patient_id, :date_referred, :reason, :vehicle_reg_no, :confirmed_by
end
