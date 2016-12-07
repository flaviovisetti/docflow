class RemoveMailFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :mail, :string
  end
end
