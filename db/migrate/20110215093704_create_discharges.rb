class CreateDischarges < ActiveRecord::Migration
  def self.up
    create_table :discharges do |t|
      t.integer :patient_id
      t.datetime :date_discharged
      t.text :drugs_taken_home
      t.string :discharged_by

      t.timestamps
    end
  end

  def self.down
    drop_table :discharges
  end
end
