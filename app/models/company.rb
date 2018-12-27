# frozen_string_literal: true

class Company < ApplicationRecord
  validates :legal_name, presence: true
  validates :mail, presence: true
  validates :legal_number, presence: true
end
