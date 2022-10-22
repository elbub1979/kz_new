class CreateInternalPhones < ActiveRecord::Migration[7.0]
  def change
    create_table :internal_phones do |t|
      t.string :number

      t.timestamps
    end
  end
end
