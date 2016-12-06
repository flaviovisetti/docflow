class Company < ApplicationRecord
  validates :legal_name, presence: true
  validates :mail, presence: true
  validates :legal_number, presence: true
end
