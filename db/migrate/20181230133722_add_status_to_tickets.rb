class AddStatusToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :status, :integer, default: 0
  end
end
