class AddEmployeeToInternalPhone < ActiveRecord::Migration[7.0]
  def change
    add_reference :internal_phones, :employee, null: false, foreign_key: true
  end
end
