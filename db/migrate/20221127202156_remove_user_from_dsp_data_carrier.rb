class RemoveUserFromDspDataCarrier < ActiveRecord::Migration[7.0]
  def change
    remove_column :dsp_data_carriers, :user_id, :bigint
  end
end
