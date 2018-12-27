# frozen_string_literal: true

class History < ApplicationRecord
  belongs_to :ticket
end
