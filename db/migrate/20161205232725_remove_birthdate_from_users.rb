class RemoveBirthdateFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :birthdate, :date
  end
end
