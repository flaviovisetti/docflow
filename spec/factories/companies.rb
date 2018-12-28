# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    legal_name { 'Oderbrecht Lava Jato' }
    mail { 'sac@oderbrecht.com.br' }
    legal_number { '121217199' }
  end
end
