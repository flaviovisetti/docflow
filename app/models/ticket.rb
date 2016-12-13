class Ticket < ApplicationRecord
  belongs_to :user
  has_many :histories

  has_attached_file :attach, styles: { medium: '300x300>', thumb: '100x100>' }
  do_not_validate_attachment_file_type :attach
  validates_with AttachmentSizeValidator, attributes: :attach,
                                          less_than: 1.megabytes
  validates :title, presence: true
  validates :description, presence: true
  validates :recipient, presence: true
end
