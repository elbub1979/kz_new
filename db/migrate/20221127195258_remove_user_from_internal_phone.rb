class RemoveUserFromInternalPhone < ActiveRecord::Migration[7.0]
  def change
    remove_reference :internal_phones, :user, null: false, foreign_key: true
  end
end
