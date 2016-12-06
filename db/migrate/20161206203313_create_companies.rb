class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :legal_name
      t.string :mail
      t.string :legal_number

      t.timestamps
    end
  end
end
