class CreateDspDataCarriers < ActiveRecord::Migration[7.0]
  def change
    create_table :dsp_data_carriers do |t|
      t.string :carrier_type
      t.string :carrier_model
      t.string :registration_number
      t.references :user, foreign_keys: true, null: false

      t.timestamps
    end
  end
end
