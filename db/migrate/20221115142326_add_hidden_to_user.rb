class AddHiddenToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :hidden, :boolean, default: false
  end
end
