# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true
  has_many :tickets
  belongs_to :person
end
