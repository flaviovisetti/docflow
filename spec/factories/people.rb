# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    email { 'odair@teste.com.br' }
    password { '12345678' }
  end
end
