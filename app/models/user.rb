class User < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true
  has_many :tickets
end
