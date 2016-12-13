class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.text :comment
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
