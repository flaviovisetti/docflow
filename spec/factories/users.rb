# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Odair José' }
    phone { '+5511977665544' }
    birthdate { '25/10/2015' }
    person
  end
end
