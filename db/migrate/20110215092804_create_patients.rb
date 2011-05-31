class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :village
      t.string :ta
      t.string :district
      t.text :chief_complaint
      t.string :guardian
      t.integer :temperature
      t.integer :respiration_rate
      t.integer :blood_pressure
      t.datetime :date_admitted

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
