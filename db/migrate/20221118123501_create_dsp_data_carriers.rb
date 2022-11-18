class CreateDspDataCarriers < ActiveRecord::Migration[7.0]
  def change
    create_table :dsp_data_carriers do |t|
      t.string :type
      t.string :model
      t.string :registration_number
      # t.references :dsp_data_carriers, :user, null: false, foreign_keys: true

      t.timestamps
    end
  end
end
