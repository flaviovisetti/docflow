class Ticket < ApplicationRecord
  belongs_to :user
  has_attached_file :attach, styles: { medium: "300x300>", thumb: "100x100>" }
  do_not_validate_attachment_file_type :attach
end
