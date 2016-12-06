class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.string :recipient
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
