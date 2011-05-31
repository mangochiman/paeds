class CreateReferrals < ActiveRecord::Migration
  def self.up
    create_table :referrals do |t|
      t.integer :patient_id
      t.datetime :date_referred
      t.text :reason
      t.string :vehicle_reg_no
      t.string :confirmed_by

      t.timestamps
    end
  end

  def self.down
    drop_table :referrals
  end
end
