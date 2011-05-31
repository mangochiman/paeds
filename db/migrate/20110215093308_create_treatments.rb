class CreateTreatments < ActiveRecord::Migration
  def self.up
    create_table :treatments do |t|
      t.integer :patient_id
      t.string :drug_name
      t.string :quantity
      t.integer :duration_per_day
      t.datetime :start_date
      t.datetime :end_date
      t.string :prescibed_by

      t.timestamps
    end
  end

  def self.down
    drop_table :treatments
  end
end
