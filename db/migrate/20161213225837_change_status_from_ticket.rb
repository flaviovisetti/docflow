class ChangeStatusFromTicket < ActiveRecord::Migration[5.0]
  def change
    change_column :tickets, :status, :integer
  end
end
