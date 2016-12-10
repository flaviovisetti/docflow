class AddAttachmentAttachToTickets < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t|
      t.attachment :attach
    end
  end

  def self.down
    remove_attachment :tickets, :attach
  end
end
