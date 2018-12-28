# frozen_string_literal: true

FactoryBot.define do
  factory :history do
    comment { 'Aprovado com sucesso. Obrigado.' }
    ticket
  end
end
